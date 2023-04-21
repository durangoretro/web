# IOx expansion bus

## Description

In its original form, the **Durango-X** home computer has very limited I/O: a single-bit _beeper_, the _interrupt enable_ port and, most importantly,
the _built-in **video output**_. But almost any other device can be connected via the **_IOx_ expansion bus**, which is an 8-bit _parallel_ bus with **16 addresses**,
for easy _daisy-chaining_ of peripherals.

The main PCB bears a single  **IOx** connector; but the proposed _keyboard+gamepads interface_ (which, incidentally, connects to the main PCB thru that) has
_**2** IOx_ connectors for convenience. As noted below, this standard interface board _takes three addresses_ for all its supplied devices
(keyboard, gamepad1, gamepad2).

## Connector Pinout

The _IOx bus_ uses a readily available **IDC-16 socket** which prevents reverse insertion; but regular _1/10" pin headers and sockets_ may be used, even _DuPont_
connectors for testing purposes. If a board has more than one _IOx_ socket, they'll be connected _in parallel_, thus **completely interchangeable**.

**IOx** connector seen from above _(component side):_

|  | Bottom |  Top  | Shroud |
|--|--------|-------|--------|
| #| #####  | ##### |#       |
| #| `+5V`  | `PD0` |#       |
| #| `BA0`  | `PD1` |#       |
| #| `BA1`  | `PD2` |#       |
|  | `BA2`  | `PD3` |#       |
|  | `BA3`  | `PD4` |#       |
| #| `/WE`  | `PD5` |#       |
| #| `/SEL` | `PD6` |#       |
| #| `GND`  | `PD7` |#       |
| #| #####  | ##### |#       |

### _Sidecar_ connector

Besides the IDC socket, Durango-X has a _right-angle pin socket_ for bigger peripherals which should lay levelled with the main PCB.
**Pinout is the same, although _with the bottom and top rows swapped_**.

## Signal descriptions

|Signal|Description|Direction (rel. CPU)|Notes|
|------|-----------|--------------------|-----|
|`+5V` |Power      |Output              |Most peripherals could power from this line. _Maximum recommended power draw: **350 mA (combined)**_.|
|`GND` |Ground     |Output              |Mandatory connection, even is the peripheral is self-powered.|
|`PD0-PD7`|Peripheral Data Bus|Input/Output|**Must** be kept in _high-impedance_ state when `/SEL` is high.|
|`BA0-BA3`|Buffered Address Bus|Output  |Constantly exposing the CPU's lower address bits.|
|`/WE` |Write Enable|Output             |This _or_ `/SEL` **must** be _qualified_ via the Clock signal (usually the latter).|
|`/SEL`|IOx Select |Output              |Active when the CPU interacts with the IOx bus. _Peripherals can **not** ask for CPU attention_, other than via **polling**.|

!!! warning

	The maximum current draw for peripheral boards (350 mA) is based on the **USB standard** guaranteed 500 mA, minus _Durango-X_ maximum power rating (about 150 mA at 5V). _While many power supplies are able to exceed this guaranteed minimum_, **caution is advised if your preipheral setup is going over 350 mA _total_** as the PCB layout and tracks aren't intended for high intensities.
	
	As always, the use of **quality, brand-name power adapters** is _highly recommended_, both for _output stability_ and **safety** reasons.

### Signal timing

_IOx bus_ transactions are similar to regular memory accesses, thus Durango-X will assert the `/SEL` signal _(qualified)_ for _half a cycle_, or
**about 325 nS**; but peripherals are expected to respond in a _reasonably **faster**_ fashion, to account for _glue logic delays_.

### Address decoding

_All peripherals should provide their own address decoding_, although that could be a **very simple** circuit. In any case, _no attached peripheral should
**write** to the IOx bus **unless** the `/SEL` line is low **and** the current address is **within its assigned range**_.

In most cases, a **74HC138** decoder is all that's needed.

## Port assignations

In order to avoid conflicts, **no attached peripherals should _share_ any address**, especially when expected to _write_ to the bus. Note that the _Read/Write line_
may be used as an extra address, if properly decoded.

Here follows a list of _currently produced or projected **peripheral addresses**_. This will be _frequently updated_.

|Address|Dir. (CPU)|Peripheral|Port description|
|-------|----------|----------|----------------|
|`$0`   |write     |_picoVDU_ |Address High Latch|
|`$0`   |read      |**FREE**  |-|
|`$1`   |write     |_picoVDU_ |Address Low Latch|
|`$1`   |read      |**FREE**  |-|
|`$2`   |write     |_picoVDU_ |Data write      |
|`$2`   |read      |FREE      |_might be used as I/O_|
|`$3`   |I/O       |_Virtual Serial Port_\*|Data I/O|
|`$4`   |I/O       |_Virtual Serial Port_|Configuration|
|`$5`   |I/O       |**FREE**  |-|
|`$6`   |I/O       |**FREE**  |-|
|`$7`   |I/O       |**FREE**  |-|
|`$8`   |I/O       |**FREE**  |-|
|`$9`   |I/O       |**FREE**  |-|
|`$A`   |I/O       |_PASK_ parallel port|Data I/O _(currently input only)_|
|`$B`   |write     |Matrix Keyboard|Select column|
|`$B`   |read      |Matrix Keyboard|Read rows  |
|`$C`   |write     |Gamepads  |Latch status    |
|`$C`   |read      |Gamepad 0 |Read status     |
|`$D`   |write     |Gamepads  |Shift data _(NES only, but ignored by MD)_|
|`$D`   |read      |Gamepad 1 |Read status     |
|`$E`   |I/O       |**FREE**  |-|
|`$F`   |I/O       |**FREE**  |-|

\*) Not a real _hardware_ device, but some software (especially _in development_) may access these ports.
