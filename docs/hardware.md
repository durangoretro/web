[Site map](sitemap.md))
[Home](index.md) > **Hardware**

---
# Hardware

**The physical devices in the _Durango_ ecosystem:**

## [Precursors](hard/previous.md)

Former experiments before the _definitive_ **Durango·X** computer:

- Baja
- SDd / Chihuahua
- Durango·PROTO
- Abandoned projects

## [The _Durango_ architecture](hard/arch.md)

All the current stuff:

### Range

Durango's _not_ alone... choose your flavour!

### [**Durango·X** SBC](hard/durango.md)

The main computer: what it does, how it works and how can it be improved.

1. Overview
1. Specs and options
	1. v1 and improvements for v2
	1. [Options](hard/dx/options.md)
	1. [Palette](hard/dx/palette.md)
	1. [IRQ generation](hard/dx/irq.md)
1. [Theory of Operation](hard/dx/theory.md)
1. Hacks
	- Hardware PAUSE
	- [Overclocking](hard/dx/overclock.md)
	- [Alternative oscillator](hard/dx/oscil.md)
	- [**Power**Durango](hard/dx/power.md)

### [Cartridges](hard/cartridges.md)

The classic way to get software up and running on _Durango_... with a modern twist.

1. [Overview & pinout](hard/cart/pinout.md)
1. [mini-cartridge](hard/cart/mini.md)
1. [devCart](hard/cart/dev.md)
	- Overview
	- _ShadowRAM_
1. [Bankswitching](hard/cart/banks.md)
	- 128K \- 1M
	- multi-cartridge
1. [Universal cartridge _(new)_](hard/cart/universal.md)
1. [Riser boards](hard/cart/riser.md)
	- PSG
	- Breakout board
1. Veracruz cartridge format

### [Peripherals & Interfaces](hard/interfaces.md)

Connectivity means 'ready for the future':

1. nanoLink
1. [IOx bus](hard/bus/iox.md)
	- Pinout
	- Assigned addresses
1. [Keyboard & Gamepads](hard/keyboard.md)
	- [Layout & matrix](hard/kbd/layout.md)
	- [NES version](hard/kbd/nes.md)
	- [MD/VCS version](hard/kbd/md.md)
	- [Extended keyboard](hard/kbd/ext.md)
1. [Other IOx devices](hard/bus/periph.md)
	- _nanoLink_ output
	- _FastSPI_ & I<sup>2</sup>C
	- _PASK_
	- GPIO
1. [Sidecar devices](hard/bus/sidecar.md)
	- Overview
	- SD + RTC

### [Accesories](hard/acc.md)

_Durango_ even better.

- Keyboard overlay
- Component Video output
- _**Power**Durango_ adapter

## Alternative architectures

### With the 65C02

-	**[Chihuahua](hard/alt/chihuahua.md):** small footprint (~98 x 72 mm) SBC with no built-in video, but sporting a [VIAbus]() interface. _For convenience, it shares the [IOx](hard/bus/iox.md) and [cartridge](hard/cart/pinout.md) connectors from Durango·X_.

### Motorola 6800/Hitachi 6300

-	**[Rosario](hard/alt/rosario.md):** Simple SBC based on the **Hitachi 6301/6303 _microcontroller_** in the same small form factor of _Chihuahua_. Can be configured to run _without cartridge_.

### Other CPUs

_To be done_

### Alternative accessories

The following devices share the common _Chihuahua/Rosario_ form factor (~98 x 72 mm):

-	**[picoVDU](hard/alt/picovdu.md):** simple _video output_ for [Rosario](), [Chihuahua]() or even any other 6502 system.
-	**[SimpleI/O](hard/alt/simpleio.md):** eight LEDs and eight pushbuttons for simple interaction with any device sporting the [VIAbus]() interface.
-	**[LCD keypad](hard/alt/lcdpad.md):** connect an LCD character display easily.

## [Future projects](hard/future.md)

We won't stop here...

- Durango _Pocket_
- _Durango·C_
- _Veracruz_
- _SIXtation_
