[Home](../../index.md) > [Development](../development.md) > [Tools](tools.md) > **nanoBoot format**
___

# nanoBoot format

!!! warning

	This is **under development**.

***nanoBoot*** is the software protocol that allows to send code (or generic data) to a _Durango_ or any other computer fitted with a **nanoLink** port.

## General operation

The idea is pretty simple: by using the `NMI` (or similar) line as a **clock** signal, the sender quickly gets the receiver's attention for every transmitted bit. Upon servicing this prioritary interrupt, any lower-privilege ones are masked. Then, this mask is temporarily lifted so, _if the **data** line is asserted_, an `IRQ` (or other lower privilege/maskable interrupt) is issued and a **flag** is marked, then returns. After this brief interrupt enabling, the NMI routine checks for the aforementioned flag: if that flag is _not enabled_, a **zero** was received. Otherwise, it's a **one**.

The NMI routine should keep count of the times it was called, so after _eight calls_ a whole byte was received (_shifting_ the bits _in_ as soon as they're checked). Then, that byte is **written** into the corresponding address and a suitable _pointer_ is incremented to point to the following address, until the **address limit** is reached; at that point, loaded code is **executed**, if possible (more on this later).

!!! note

	This is a **best effort** protocol, without any _flow control_, acknowledge or negotiation. Being a _simplex_ link, there's no way for the receiver to request any 'file' from the sender -- if the receiver is _ready_ when the sender transmits, transfer will be successful.

## The Hardware

### Signals definition

This is a **two-wire interface** (plus _ground_) based on a ***Synchronous Serial* link**. The main feature is that _the receiving side needs almost **no additional hardware**_, as it simply repurposes the regular `/IRQ` and `/NMI` _interrupt_ lines for DATA **(`SERDAT`)** and CLOCK **(`SERCLK`)** transmission, respectively. Note that, even if this was designed around the 6502 CPU, _it may be applied to almost any CPU_, as long as it has two interrupt lines with different privilege levels.

### Suggested connector

The standard connector is a **4-way pin header**, where one pin has been cut to prevent reversed connection. Pinout goes as follows:

|Pin #|Silkscreen|Signal        |
|-----|----------|--------------|
|1    |`G`       |Ground        |
|2    |`C`       |`SERCLK` clock|
|3    |`D`       |`SERDAT` data |
|4    |`x`       |_cut key_     |

### Receiver requisites

Since this communication link uses **two interrupt lines** (one of them _non-maskable_ or, at least, with different privileges), you'll need these exposed. The protocol uses **active-high** signals (unlike the interrupt lines in most CPUs) so you'll likely need a couple of **open collector inverters**, which will also _isolate_ the computer's 5 V line from 3.3 V devices (like recent _Raspberry Pi_s). Also, in order not to interfere with the data transmission, a way to **disable regular interrupts** (other than _masking_ them in software) must be provided.

The `SERCLK` (**C**lock) signal will drive _NMI_ or the interrupt with _highest privileges_, whereas the `SERDAT` (**D**ata) signal will drive _IRQ_ or the least privileged interrupt line. Of course, you need to connect the `GND` (**G**round) pin as well.

!!! tip

	The **Durango·X** home computer fits all requirements for nanoBoot, as do the simpler [Chihuahua]() SBC and the recently developed [Rosario]() 6301 computer.

!!! note

	In case of the **Durango·X** computer, there's an `AUDIO_FB` jumper which _connects the `SERDAT` input to the **audio** output_, which makes a screeching sound during **nanoLink** transfers, as a crude (but sometimes helpful) form of feedback.

### Sender requisites

Being a **synchronous serial** interface on a _simplex_ link, the output interface is just a couple of pins for **clock** and **data** signals -- no need for _open collector_ or _tristate_. This can be achieved thru several ways, like:

-	Two **GPIO *(output)*** pins, like those on the _RaspberryPi_ or _Arduino_ (3.3 V logic is OK).
-	A **VIA 6522** _shift register_ thru `CB1` and `CB2`.
-	Another Durango with a couple of **latched output** pins -- a [suitable interface]() has been developed.

Since **Durango·X** (as well as **Chihuahua** and **Rosario**) have the same receiving interface (BC548 _BJT_ with 22K base resistor), there's no need for a full 5V level at these inputs. To be on the conservative side, anything over **TTL levels** (2.0 v active _high_), probably much less (but definitely over ~0.7 v). These inputs will **sink 200 µA** at most, thus almost any kind of circuit will be able to drive them.

## Protocol

### Required header

Prior to actual data transmission, a **40-bit header** must be sent in order to identify the _data type_, start _address_ and length. The receiver would be able to **reject** the transmission, although normal operation of the receiving computer might be affected by abnormal activity on interrupt lines during the rejected transfer, as _the sender has no way to know about the rejection_.

|Byte 1|Byte 2 & 3|Byte 4 & 5|
|------|----------|----------|
|_Magic_ number|**End** address (_BigEndian_)|**Start** address (_BigEndian_)|

!!! note

	Unlike 6502 code, both addresses are in **Big Endian** format!

 The **End** address is the first address that will **not** be loaded from transmission. If, for instance, the transmitted block is to be loaded into the `$6000-$7FFF` area, the _end address_ will be **`$8000`**, and thus bytes 2 to 5 will be sent precisely as `$80`, `$00`, `$60`, `$00`.

### _Magic_ numbers

This is a byte to identify the activity as a valid _nanoBoot_ transmission, and also determine its format. As of 2024-04-24, **four** formats are defined.

|_Magic_ number|Type|Load address|Execution address|
|--------------|----|------------|-----------------|
|`$4B`|RAM bootloader (legacy)|Specified to sender|Same as load address|
|`$4C`|ROM image|`$10000`-image size|Vectored at `$FFFC`|
|`$4D`|Generic data|Specificed to sender|_N/A_|
|`$4E`|_Pocket_ executable|Offset `$3-4` in file header|Offset `$5-6` in file header|

!!! warning

	`$4B` was the only supported mode on older versions of nanoBoot client ROM, but timing and other details may be **incompatible** with modern implementations. Make sure you use recent (April 2024 and later) versions of both the server (sender) and receiver (client) software!

!!! note

	`$4B`, `$4C` and `$4E` are intended for _executable_ code, when the receiver will keep waiting for something to be executed; whereas the `$4D` signature is about _generic data_ for **communication between Durangos** (or any other nanoLink-equipped device) and still under development.

## Software

### Sender

According to the available hardware, there are many ways to write suitable code. Usually will be a matter of **generating the header** and sending out the bits **with suitable delays** (see _Timing_ section below for details). So far (until April 2024) a [simple C program for RaspberryPi]() has been used, although only _binary blobs_ (type `$4B`) are supported.

### Receiver

Since this is an **interrupt-driven** feature, _unless the target computer has no use for interrupts_ at all, your firmware will usually provide **user-defined interrupt vectors**. Two common ways are available for 6502 systems:

-	Make the `IRQ/NMI` _hard_ vectors point to a `JMP` instruction in RAM, followed by the required ISR address.
-	Make the `IRQ/NMI` _hard_ vectors point to an **indirect `JMP(abs)`** _in ROM_, which will take the ISR address from some RAM vectors.

_Durango_ software takes the latter approach, with _soft_ IRQ vector at `$0200`, and _soft_ NMI vector at `$0202`. ***In any case, both the bootloader firmware and the executable code to be loaded are expected to set these vectors accordingly***.

Also, since the normal IRQ generation will interfere with the _data_ line, the bootloader should **shut off** such generation before attempting to receive, ***and* restore it** just after loading has finished (or was aborted). In the case of **Durango·X** computer, this is done by clearing bit 0 at the _Interrupt Enable Register_ (`$DFAx`) and then setting it afterwards; the `ERROR` LED will stay lit while reception is enabled.

## Timing

Generally speaking, _nanoBoot_ timing is very loose, _as long as **the receiver is fast enough** to handle the incoming data_. Designed more for **convenience and reliability** than _speed_, these are the _recommended minimum_ times to be observed.

### Header

In order to allow for timeouts, feedback etc., the header is transmitted at a slow pace of **500 bits per second**. Current software waits ***2 ms** between bits*, of which the `SERCLK` pulse is kept for at least **15 µS** for reliability. After each byte is transmitted, and **extra 1 mS delay** is used for reliable operation, although not strictly necessary.

The whole header takes about **85 mS** to be transmitted.

### Data stream

Originally designed to work _reliably_ on a **1 MHz** computer, which is the minimum expected for any 6502 system, each bit takes a total of **80 µS**, of which the `SERCLK` pulse is kept for at least **15 µS** as before. After all 8 bits are transmitted, an extra **125 µS delay** is specified.

However, unlike the header trasnmission, **page boundary crossing** may happen and **extra delay** must be added, especially if some kind of _feedback_ is desired. Originally stated at 1 mS, current version specifies **2 mS** allowing for graphic screens to be updated.

All of this means the _nominal_ rate is **12.5 kbit per second**, although the needed overhead will get the _actual_ transfer rate a bit **over 1 KByte per second**, which is reasonable for its purpose.

!!! note

	You may **speed up** the transmission _if the receiving computer is fast enough_; but reliability might be affected. Experiments with **1 MHz 65C02** were able to make successful transmissions up to **18 kb/s** nominal rates, but sometimes it needed a few attempts to succeed.
