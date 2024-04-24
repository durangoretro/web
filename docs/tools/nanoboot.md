[Home](../../index.md) > [Development](../development.md) > [Tools](tools.md) > **nanoBoot format**
___

# nanoBoot format

!!! warning

	This is **under development**.

***nanoBoot*** is the software protocol that allows to send code (or generic data) to a _Durango_ or any other computer fitted with a **nanoLink** port.

## General operation

The idea is pretty simple: by using the `NMI` (or similar) line as a **clock** signal, the sender quickly gets the receiver's attention for every transmitted bit. Upon servicing this prioritary interrupt, any lower-privilege ones are masked. Then, this mask is temporarily lifted so, _if the **data** line is asserted_, an `IRQ` (or other lower privilege/maskable interrupt) is issued and a **flag** is marked, and returns. After this brief interrupt enabling, the NMI checks for the aforementioned flag: if that flag is _not enabled_, a **zero** was received. Otherwise, it's a **one**.

The NMI routine should keep count of the times it was called, so after _eight calls_ a whole byte was received (_shifting_ the bits _in_ as soon as they're checked). Then, that byte is **written** into the corresponding address and a suitable _pointer_ is incremented to point to the following address, until the **address limit** is reached; at that point, loaded code is **executed**, if possible (more on this later).

!!! note

	This is a **best effort** protocol, without any flow control, acknowledge or negotiation.

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

### Sender requisites

Being a **synchronous serial** interface on a _simplex_ link, the output interface is just a couple of pins for **clock** and **data** signals -- no need for _open collector_ or _tristate_. This can be achieved thru several ways, like:

-	Two **GPIO** pins, like those on the _RaspberryPi_ or _Arduino_ (3.3 V logic is OK).
-	A **VIA 6522** _shift register_ thru `CB1` and `CB2`.
-	Another Durango with a couple of **latched output** pins -- a [suitable interface]() has been developed.

Since **Durango·X** (as well as **Chihuahua** and **Rosario**) have the same receiving interface (BC548 _BJT_ with 22K base resistor), there's no need for a full 5V level at these inputs. To be on the conservative side, anything over **TTL levels** (2.0 v active _high_), probably much less (but definitely over ~0.7 v)

## The software

### Required header

TBD

### _Magic_ numbers

TBD

## Timing

TBD
