[Home](../../index.md) > [Getting Started](../../started.md) > [Building _Durango·X_](../building.md) > **Assembly guide (cartridge)**
___
# Assembly guide (cartridge)

***(under construction)***

Since the _Durango·X_ computer has **no built-in ROM** or any kind of _firmware_,
***it's essential to have at least one cartridge*** in order to boot the computer!

## [Building options](kbd/options.md)

There are several types of available cartridges

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
1. [Riser boards](hard/cart/riser.md) add extra capabilities which might be built in
_custom cartridges_, like **enhanced sound output**. _You still need another kind of cartridge
(loaded with the desired [software](../../software.md)) plugged into the riser's top slot_.

***For starters, either the [mini-cartridge](hard/cart/mini.md) or the
original [Development cartridge](hard/cart/dev.md) is recommended***

## [BOM](kbd/bom.md)

***(TBD)***

## [Step by step](kbd/steps.md)

***(TBD)***

