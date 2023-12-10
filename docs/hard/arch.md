[Site map](../sitemap.md))
[Home](../index.md) > [Hardware](../hardware.md) > **Architecture**

---
# The _Durango_ architecture

The _Durango_ project attempts to make a _80s-style_ **home computer** based on
_readily available_ components: besides CPU and memory, everything else is just ordinary
_logic circuits_ (74xx series) -- no PIA, VIA, CRTC, ACIA etc.

## Range

Since the **Durango·X** computer was designed with _modularity_ in mind, you may
choose the desired set of features, or deal with _alternative_ models:

- **Durango·_X_**: Fully featured computer with both HIRES and colour video modes.
- **Durango·_S_**: No HIRES, only colour video mode (128 x 128 px, [16 colour](dx/palette.md).
- **Durango·_R_**: No colour, just HIRES video mode (256 x 256 px, monochrome) and _somewhat reduced component count_.
- **Durango·_C_**: Simplified, GAL-based version of _·X_ with _a lot_ less soldering. ***(under development)***
- **Durango _Pocket_**: _Handheld_ **2 MHz** version, although not ~~fully~~ compatible. ***(under development)***

## [**Durango·X** SBC](hard/durango.md)

### Overview

As previously mentioned, this is a _80s-style_ home computer made out of _readily
available_ components, with no computer-specific chips besides CPU and RAM.

### Specifications

Main specs for the _original_ (v1) version of this computer are:

- **CPU:** 65C02 @ 1.536 MHz
- **ROM:** on external [cartridge](cartridges.md), up to 32 KiB (more with _bankswitching_)
- **RAM:** 32 KiB (static)
- **Expansion:** [parallel 8-bit bus](bus/iox.md) with 16 addresses for keyboards, joysticks, storage devices...
- **Video output:** _RGB_ SCART connector for a CCIR (PAL) TV, composite greyscale, composite PAL or _Sync-on-green_ (options available).
- **Controls:** Power switch (optional), `RESET` button, `NMI` (interrupt) button.
- **Connectivity:** _nanoLink_ input (synchronous serial) for reception of data & code.
- **Footprint:** 5.1" x 7", rounded corners (129.54 x 177.8 mm)

#### Improvements for v2

_Both issues are essentially 100% compatible_, but some improvements were made in v2:

- **CPU:** now at 1.75 MHz with _switchable **turbo**_ mode (**3.5 MHz**)
- **Video output:** _RGB_ SCART connector for a CCIR (PAL) TV or **component video** options (PAL and sync-on-green deprecated).
- **Controls:** _Built-in_ power switch, `RESET` button, **debounced** `NMI` button.

Otherwise, they are **the same** (including the _footprint_)

#### [Options](hard/dx/options.md)

_Whithin the same board_, you may choose from several building options:

- Supported video modes:
	- Colour only (_Durango·**S**_)
	- HIRES only (_Durango·**R**_)
	- **Both modes** (_Durango·**X**_, recommended option)
- Monitor output:
	- **SCART** (colour via _RGB_, recommended option)
	- Sync-on-green (v1) / Component video (v2+)
	- Second audio/video output
- Composite encoding:
	- Greyscale (standard in v1)
	- **Luminance** (standard in v2+, recommended option)
- PAL encoder (for composite output, v2 only, _NOT_ recommended)
- Piezo buzzer for audio
- Debug port

#### [Palette](hard/dx/palette.md)

In _colour mode_, Durango·X uses a **16-colour _fixed_ palette**, where _2 bits_
are assigned to **green**, while the remaining two bits of each nybble represent
the **red** and **blue** values in full.

#### [IRQ generation](dx/irq.md)

_Durango·X_ has a **switchable interrupt generator**, working at a fixed rate of
**250 Hz** (4 ms period). _These are **not** latched_ in any way, thus lost interrupts
do _not_ queue up.

### [Theory of Operation](dx/theory.md)

This document deploys **detailed information** about the _Durango·X_ computer operation.

### Hacks

Some modifications for improved functionality:

#### Hardware PAUSE

This is pretty simple: the 6502's `RDY` line (which was intended to allow synchronisation
with slow memory chips) is **not used** in _Durango·X_, and simply connected to a
_pull-up_ resistor (on RN1). But the pin itself is available in the `STEP` connector
(J10), thus _halting the CPU is as simple as **grounding** this pin_; you might
use the _ground_ pin (labelled `G`) on the nearby **nanoLink** connector (J1).
_No debouncing or any additional hardware is needed_, and no ill effects are to be expected.

#### [Overclocking](dx/overclock.md)

While most components on _Durango·X_ are way faster than actually needed (except
the U3 **SRAM**, because of _multiplexing_), **overclocking** this computer is _not_
as simple as changing the _oscillator_ (X1) as all **video timings** come from this,
and would be thrown off otherwise.

!!! tip

	**issue v2** includes a **TURBO** jumper as a built-in _overclocking_ feature
	and doesn't need anything else, _as long as your CPU and RAM are fast enough_
	to cope with it!

#### [**Power**Durango](dx/power.md)

Durango's 65C02 CPU can be replaced with a more advanced **65C816** -- an _adapter board_
is needed because pinout and signals aren't fully compatible. From the software side,
_the 65C816 is able to run 65C02 with **100% compatibility**_, but not the opposite.

!!! note

	In order to get _any_ performance improvement with the 65C816, **specific _native_
	code** must be used -- which won't be compatible with the regular 65C02. The
	computer's architecture also limits the memory map to **64 KiB**, _mirrored_ to
	fill the whole _16 MiB_ address space of the '816.

## [Cartridges](cartridges.md)

Since there's _no ROM_ in Durango·X, it's **essential** the use of a cartridge with
suitable _firmware_. In case you want to load software off an SD card, _you'll need
at least a cartridge_ with a suitable [bootloader](../dev/6502/multiboot.md).

### [Overview & pinout](cart/pinout.md)

A readily available **36-pin edge connector** is used for the cartridge. Most
cartridge boards can be fitted inside a _Commodore 64_ cartridge box.

!!! warning

	Height constraints inside the C64 cartridge _preclude the use of **sockets**_
	for the cartridge's ICs.

### [mini-cartridge](cart/mini.md)

_Basic_ cartridge to supply a ROM (8 - 64 KiB, up to **32 KiB** simultaneously).
It's a very small and inexpensive board but _won't fit inside a C64 cartridge_.

### [devCart](cart/dev.md)

This **Development Cartridge** is able to supply a 16 KiB ROM, but sports **32 KiB
of _shadow_ RAM** which can be loaded from the supplied **SD card** interface and
be used to _emulate ROM_, for **maximum convenience**. This board is very tall and,
once again, _won't fit inside a C64 cartridge_.

The so-called **ShadowRAM** cartridge is the same but, thanks to the use of _Surface
Mount Devices_ and a pluggable SD card reader, **reduced in size**, so it does
actually **fit inside a C64 cartridge**. Otherwise, it's functionally identical to
the _devCart_, although it allows to access up to **32 KiB of ROM**.

### [Bankswitching](cart/banks.md)

**Bankswitching** was a common technique in the 8-bit era, extending beyond the
_64 KiB addressing limit_. With bigger EPROM/EEPROM/Flash chips (**128 KiB - 1 MiB**)
available in a still hobbyist-friendly _DIP-32_ package, we developed a board that
_fits inside a C64 cartridge_ and **splits the ROM into 16 or 32 KiB banks** which
are switched by _software_ (bank _size_ is configurable via a jumper)

!!! warning

	The **whole cartridge space** is swapped when switching banks so, in case you're
	switching _from the ROM code itself_, care must be taken.

Another bankswitching cartridge is not controlled by software, but **triggers a counter
from the `RESET` signal**. Once again configurable for **16 or 32 KiB banks**, allows
the combination of _several software titles in **one** single cartridge_.

### [Riser boards](cart/riser.md)

_These boards go **between** a regular cartridge and the Durango·X computer_, passing
thru all signals but **adding extra functionality**. As of December 2023 they are:

- Extra sound capabilities with the SN76489A **Programmable Sound Generator**.
- A _breakout_ board for easier probing of all of the cartridge's signals.

### Veracruz cartridge format

_Veracruz_ will be a much more advanced **65C816-based computer** with huge memory
and built-in firmware, although _extendable thru cartridges_ with a new **44-pin**
format. However, _it will be possible to fit a **Durango** (36-pin) cartridge into
**Veracruz**'s 44-pin slot_, although actual compatibility is unknown. _Will physically
fit inside a C64 cartridge_ as well.

## [Peripherals & Interfaces](interfaces.md)

_Durango·X_ has some ports for **peripheral** connection:

### nanoLink

This is an **input** port, simply connected to the **`NMI` and `IRQ` interrupt lines**
thru discrete _open collector drivers_. Its main use is to form a _synchronous serial port_
to [**receive code from a Raspberry Pi**](../dev/6502/nanoboot.md) via its GPIO pins.

_nanoLink_ is also the _name_ of a **communications protocol** (under development)
which, by adding a suitable **output** port, will allow **data transfers** between Durangos.

### [IOx bus](bus/iox.md)

This is the **main Peripheral Bus** with inexpensive **IDC-16** connectors, allowing
daisy-chaining **up to 16 devices**.

### [Keyboard & Gamepads](hard/keyboard.md)

The _standard keyboard_ for **Durango·X** fits _atop_ the main board, covering it and
providing **two gamepad ports**, in either [NES](kbd/nes.md) or [Megadrive](kbd/md.md)
format.

#### [Layout & matrix](kbd/layout.md)

This keyboard is based on the **ZX Spectrum** layout and matrix, and is indeed
_electrically compatible_. However, no _single-key commands_ are available, and
it has been adapted to **support Spanish characters**.

#### [Extended keyboard](kbd/ext.md) (under development)

An improved, separate keyboard for **more comfortable typing**.

### [Other IOx devices](bus/periph.md)

Thanks to the _versatility_ of the **_IOx_ Peripheral Bus**, several devices have
been developed -- with many more to come!

#### _nanoLink_ output

Allows intercommunication between Durangos.

#### _FastSPI_ & I<sup>2</sup>C

Experimental board with **much faster SPI** for _improved SD card performance_. Now
with an **I<sup>2</sup>C** port as well.

#### _PASK_

A _semi-intelligent_ keyboard that never materialised, but did set some standards.
Used for a Raspberry Pi-based **keyboard emulator**, might be considered as a
_bidirectional paralell port_.

#### GPIO

Similar to the above, but with _non-latching_ input. **Jumper-selected** pin directions.

### [Sidecar devices](bus/sidecar.md)

Mechanically speaking, **sidecar** devices are boards that fit on the Durango's **left** side.
Electrically, is just another **IOx** port with a different connector _(2x8 pin socket)_.

#### SD + RTC

This is essentially the **FastSPI** board in the _sidecar_ form factor. The built-in
**I<sup>2</sup>C** port allows the connection of an _inexpensive **Real Time Clock**_,
particularly useful when dealing with **storage** devices.

---
---
---
---
## [Accessories](acc.md)

### Keyboard overlay
### Component Video output
### [_**Power**Durango_ adapter](dx/power.md)

This accessory allows _Durango·X_ (or almost _any_ 6502-based computer) the use of a
much more powerful **65C816** CPU, albeit limited to the usual **64 KiB** address space.

