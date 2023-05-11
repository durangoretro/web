# Durango-X cartridge pinout

## Connection to the computer

_Durango-X_ uses a readily availbale **36-pin edge connector** (2.54 mm pitch) as a cartridge port, supplying all necessary signals,
plus some other for future expansion. Thus, the _edge of the cartridge PCB_ can be inserted for a reliable connection.

### Pinout

Cartridge connector as seen from _above_ (**component side**, using _KiCAD_ numbering):

| front pin #	| front pin signal	| back pin signal	| back pin #	|
|---------------|-------------------|-------------------|---------------|
| 35			| `!RESET`			| `VCLK`			| 36			|
| 33			| `D3`				| **`GND`**			| 34			|
| 31			| `D4`				| `D2`				| 32			|
| 29			| `D5`				| `D1`				| 30			|
| 27			| `D6`				| `D0`				| 28			|
| 25			| `D7`				| `A0`				| 26			|
| 23			| `!ROM_CS`			| `A1`				| 24			|
| 21			| `A10`				| `A2`				| 22			|
| 19			| `!ROM_OE`			| `A3`				| 20			|
| 17			| `A11`				| `A4`				| 18			|
| 15			| `A9`				| `A5`				| 16			|
| 13			| `A8`				| `A6`				| 14			|
| 11			| `A13`				| `A7`				| 12			|
| 9				| `A14`				| `A12`				| 10			|
| 7				| **`+5 V`**		| `!WE`				| 8				|
| 5				| _KEY_				| _KEY_				| 6				|
| 3				| `!IOC`			| `AUDIO IN`		| 4				|
| 1				| `!IRQ`			| `!NMI`			| 2				|

!!! note

	Pins 5 & 6 have no connection and are designed as a _**key** to prevent accidental reverse insertion_ of the cartridge.
	_Cartridge PCBs **must have a slot** at this position_, whereas the connector on the computer should have its corresponding pins removed
	and, if possible, with some _filling_ inside.

### Signal description

Signal direction is as seen from the computer's point of view:

| Signal | direction | Description |
| ------ | --------- | ----------- |
| **`+5 V`, `GND`** | Out | Power supply from the computer. |
| `D0-D7` | I/O | Data bus. |
| `A0-A14` | Out | Address bus (`A15` is missing but it's mostly the inverse of `!ROM_CS`) |
| `!RESET` | **Out** | Active-low reset. _Cartridges cannot request a computer reset_. |
| `VCLK` | Out | Main _Phi 0_ **clock** signal (1.536 MHz) |
| `!IRQ` | In | Active-low Interrupt ReQuest, must be an _open collector_ signal from cartridge or, at least, use a diode with the anode on the connector pin. |
| `!NMI` | In | Non-Maskable Interrupt (edge-sensitive), must be _open collector_ as the above one. |
| `!IOC` | Out | Active-low **Cartridge I/O** enable (addressed at `$DFC0-$DFFF`, **VCLK-qualified**), _completely custom_, just for decoding convenience. |
| `!WE` | Out | Active-low **Write enable**; not used for ROMs but useful for _shadow RAM_ and _I/O_. **VCLK-qualified** for convenience. |
| `!ROM_CS` | Out | Active-low **ROM Chip Select**, nominally _`!A15` NAND `!IO`_ (excludes I/O area at `$DF80-$DFFF`) |
| `!ROM_OE` | Out | Active-low **ROM Output enable**, nominally _`VCLK` NAND `R!W`_ (note it's **VCLK-qualified**) |
| `AUDIO IN` | In | _For cartridges providing **sound hardware**_, this pin is connected to the Audio mixer thru a diode. _Analogue signals must provide a **~3.15 V DC bias** and **~3.8 Vpp max. amplitude** for optimum performance_. |

### RESET line

This is intended to be _detected_ by some cartridges, either for resetting any additional hardware they may contain, or to switch between software
inside a large ROM in a suitable _multi-cartridge_ (under development). There is **no way** for the cartridge to reset the whole computer by itself!

### Audio In

Since the built-in audio capabilities of Durango-X are quite limited, there is the option of including audio-generating circuitry inside a cartridge,
mixing its audio output with the single-bit built-in device. _Mostly designed with square wave generators in mind_, it's possible to inject an
**analogue signal** as long as the proper _bias_ (~3.15 V) is supplied. In its simplest way, this could be achieved thru a _voltage divider_
between the power pins -- a **3.3K** resistor to +5V and a **5.6K** one to ground could be a simple solution, with a suitable _coupling capacitor_ (e.g. **10 µF**) between the generator's output (as long as it supports _load impedances_ below ~2 Kohm) and the divider.

## Form factor

Although the current cartridges are intended to be used as _bare PCBs_, the preferred form factor for Durango cartridges is
_the same as used on **Commodore 64** cartridges_ for convenience. _Note the 36-pin PCB is narrower than the original's 44-pin,
thus the edge connector must provide appropriate offset_.


