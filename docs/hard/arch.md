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

---
***under construction***

---
#### [Options](hard/dx/options.md)

#### [Palette](hard/dx/palette.md)

#### [IRQ generation](hard/dx/irq.md)

### [Theory of Operation](hard/dx/theory.md)

### Hacks
	- Hardware PAUSE
	- [Overclocking](hard/dx/overclock.md)
	- [**Power**Durango](hard/dx/power.md)

## [Cartridges](hard/cartridges.md)

### [Overview & pinout](hard/cart/pinout.md)
### [mini-cartridge](hard/cart/mini.md)
### [devCart](hard/cart/dev.md)
	- Overview
	- _ShadowRAM_
### [Bankswitching](hard/cart/banks.md)
	- 128K \- 1M
	- multi-cartridge
### [Riser boards](hard/cart/riser.md)
	- PSG
	- Breakout board
### Veracruz cartridge format

## [Peripherals & Interfaces](hard/interfaces.md)

### nanoLink
### [IOx bus](hard/bus/iox.md)
	- Pinout
	- Assigned addresses
### [Keyboard & Gamepads](hard/keyboard.md)
	- [Layout & matrix](hard/kbd/layout.md)
	- [NES version](hard/kbd/nes.md)
	- [MD/VCS version](hard/kbd/md.md)
	- [Extended keyboard](hard/kbd/ext.md)
### [Other IOx devices](hard/bus/periph.md)
	- _nanoLink_ output
	- _FastSPI_ & I<sup>2</sup>C
	- _PASK_
	- GPIO
### [Sidecar devices](hard/bus/sidecar.md)
	- Overview
	- SD + RTC

## [Accesories](hard/acc.md)

- Keyboard overlay
- Component Video output
- _**Power**Durango_ adapter

