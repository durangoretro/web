[Home](../../index.md) > [Getting Started](../../started.md) >
[Running _Durango_ Software](../running.md) > **On actual hardware**

---
# Running _Durango_ Software on actual Hardware

Like any other computer, Durango·X needs the code to be in some form of **primary memory**
in order to be able to execute it. This can be any form of _non-volatile_ **Read-Only Memory (ROM)**
(usually EPROM/EEPROM/Flash) or, if some _downloading_ means is available, into _volatile_
**Random Access Memory (RAM)**, much like a modern computer does.

## ROM cartridges

_This is the originally intended way to execute code in Durango·X_. Since there's
**no ROM** at all in the Durango·X main board, a suitable [cartridge](../../hard/cartridges.md)
with appropriate code must be fitted into the cartridge slot.

In order to store suitable code in a cartridge, you'll need:
- A _non-volatile_, programmable memory chip (EPROM, EEPROM, Flash)
- A suitable _programming device_. A popular choice is the **MiniPro TL866**,
but many others exist.

For this application, you may use _any_ kind of Durango cartridge; the base
[mini-cartridge](../../hard/cart/mini.md) is very adequate.

!!! tip

	At boot time, the 65C02 looks for a **RESET vector** located at addresses `$FFFC-$FFFD`
	and _jumps_ to the address stored there _(little-endian)_, executing the code.
	The _cartridge slot_ in Durango·X is mapped to the upper 32 KiB of memory
	(`$8000-$FFFF`, minus the I/O area at `$DF80-$DFFF`), thus the ROM inside **must**
	have its contents aligned to the upper addresses, if needed, so this _RESET vector_
	is available.

## ROM images on SD card

A **ROM image** is the actual binary contents of a _ROM chip_ stored in a file on
some **secondary memory** (mass storage) device, intended to be transferred to some
RAM and be executed there; but Durango·X's RAM is mapped to `$0000-$7FFF`, whereas
the ROM code is expected to fill the _top_ of the addressing range.

The solution to this is the use of **shadow RAM**, which sits on the same address
range of ROM and can be **swapped** with it -- starts in a _write-only_ status to be
loaded from a [suitable bootloader in ROM](../../dev/6502/multiboot.md), which then
gets switched off and puts the shadow RAM in a _read-only_ status, actually **replacing**
the bootloader ROM and continuing the _downloaded_ code execution.

This _shadow RAM_ is present in the [Development cartridge](../../hard/cart/dev.md), but
for a _clean_ swap between the ROM and RAM execution, a proper [footer](../../soft/sys/rom.md)
must be present on the ROM image which, besides the aforementioned _RESET vector_, consists of:

- The **`DmOS`** signature from address `$FFD6`.
- A `JMP ($FFFC)` instruction from address `$FFE1` (bytes **`$6C, $FC, $FF`**)

!!! note

	The bootloader ROM code does swap to _shadow RAM_ thru an instruction **just before
	`$FFE1`**, thus expects the RAM to be loaded with a suitable jump instruction --
	`JMP ($FFFC)` goes to the specified RESET vector, actually bootstrapping the
	_downloaded **image**_ as if it were in physical ROM.

In addition to that, [bootstrap](../../dev/6502/multiboot.md) and
[image managing](../../dev/tool/cli.md) utilities expect a
[standard header](../../soft/sys/rom.md) on any ROM image for proper **identification**
and _metadata_ access.

A `.dux` _file extension_ is recommended for **ROM images** in the host file system
(but not mandatory).

!!! tip

	Bootloaders expect to find a **Durango volume** (written _raw_ in the card or,
	since _multiBoot v2.0_, as a `durango.av` file in the **root directory** of a FAT32
	filesystem) containing at least one ROM image (or other executable). _Note that
	a **single ROM image** may act as a whole volume_.

The aforementioned **Development cartridge** provides all that is needed to get
_ROM images_ up and running:

- 32 KiB of **Shadow** RAM.
- A suitable (albeit a bit _slow_ at ~3.4 KiB/s) **SD card** interface.

## _Pocket_ executables on SD card

Unlike a _ROM image_, a **_Pocket_ executable** is a file containing code
_intended to be run on **regular RAM**_ (typically within `$0800-$5FFF` to stay
clear of _system variables_ and video memory). Thus, **no _shadow RAM_ or _footer_
is needed**; but the proper [header](../../soft/sys/files.md) becomes **essential**
as it provides the **load and execution addresses** for the bootloader to be able
to run the executable.

From the hardware side, _any_ cartridge is suitable for the bootloader to run these
_Pocket_ executables; but, in any case, some way to access the _SD card_ is needed,
like the [FastSPI interface](../../hard/bus/periph.md) or the
[SD+RTC _sidecar_](../../hard/bus/sidecar.md), both performing at **~19 KiB/s**.
The slower _Development cartridge_ is suitable as well.

!!! note

	The handheld **Durango _Pocket_** computer (still in early development) lacks
	any cartridge slot, relying on **_Pocket_ executables** downloaded from SD into
	regular RAM, hence the format's name -- _albeit they aren't directly compatible_.

## _Pocket_ executables from Raspberry Pi

Since the _Pocket_ format has no special hardware requirements, the very same files
can be transferred to the _Durango·X_ computer **from a Raspberry Pi** or almost
any other device with suitable GPIO pins, since all Durangos are equipped with a
[**_nanoLink_ input port**](../../hard/interfaces.md) which acts as an _almost zero-hardware_
**receiving** interface, based on the use of both interrupt lines thru a simple
**three-wire connection** (ground, clock & data) at a nominal speed around 15 kbps
(~1.1 KiB/s after adding _overhead_).

Once again, _any_ cartridge is suitable for the bootloader.

!!! warning

	The concept of using the _nanoLink_ port for receiving
	[from a Raspberry Pi](../../dev/tool/nanoboot.md) was first implemented on the
	[nanoBoot protocol](../../dev/6502/nanoboot.md), but **as of version 2.1.3 of
	the _multiBoot_ bootstrapper, this option is _NOT_ yet supported**.
