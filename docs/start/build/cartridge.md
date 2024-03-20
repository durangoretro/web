[Site map](../../sitemap.md))
[Home](../../index.md) > [Getting Started](../../started.md) > [Building _Durango·X_](../building.md) > **Assembly guide (cartridge)**

---
# Assembly guide (cartridge)

Since the _Durango·X_ computer has **no built-in ROM** or any kind of _firmware_,
***it's essential to have at least one cartridge*** in order to boot the computer!

Many of these cartridges **fit into a standard _Commodore 64_ cartridge shell** for convenience.

## [Building options](cart/options.md)

There are several types of available cartridges:

1. [mini-cartridge](hard/cart/mini.md) allows simple, **instant-on** execution of stored software,
much like a classic console cartridge. _**Note**: you may need an EPROM/EEPROM/Flash programmer_
in order to store the software (The _MiniPro TL866_ is a popular choice).
1. [_Development Cartridge_](hard/cart/dev.md) includes 32 KiB of RAM which can _emulate ROM_,
allowing the use of **[ROM images](../../soft/sys/rom.md)
_conveniently stored in an SD card_**. You still need at least an EPROM/EEPROM/Flash memory chip
with a [suitable bootloader](../../dev/6502/multiboot.md) installed, though.
1. _ShadowRAM_ is a more elegant, compact version of the _Development Cartridge_,
suitable for _larger bootloaders_ (32 KiB instead of 16).
1. [Bankswitching](hard/cart/banks.md) allows **multiple ROM images** on a single cartridge which
may be switched via software (128K-1M) or the `RESET` button (multi-cartridge).
1. [Universal Cartridge](hard/cart/universal.md) **(NEW)** combines the functionality of the _mini-cartridge_, _bankswitching cartridge_ and _PSG riser_ boards, supporting almost all EPROM/EEPROM/Flash chips **from 2 KiB up to 1 MiB** with **improved sound** thru the _**SN76489** Programmable Sound Generator_ with a newly developed **amplifier**. 
1. [Riser boards](hard/cart/riser.md) add extra capabilities which might be built in
_custom cartridges_, like **enhanced sound output**. _You still need another kind of cartridge
(loaded with the desired [software](../../software.md)) plugged into the riser's top slot_.

***For starters, either the [mini-cartridge](hard/cart/mini.md) or the
original [Development cartridge](hard/cart/dev.md) is recommended***

## BOM

Check any particular cartridge page (links above) for detailed component list and other advice.

## [Step by step](cart/steps.md)

!!! note

	Unlike most boards from the Durango project, cartridge boards intended to be fitted into a _C64_ cartridge shell will **NOT** accept _IC sockets_.

For generic advice, please read the [common build procedures](general.md) for any other boards. Detailed instructions are given on any particular cartridge page (links above).

