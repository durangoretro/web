# ROMs

Here you can find information about Durango's ROMs, like programs or utilities.

## ROMs to download

You can download the Binary ROM, or see the source code.

### EhBASIC

<figure markdown>
![Durango EhBASIC](../assets/img/basicdur.png)
<figcaption>Durango EhBASIC</figcaption>
</figure>

_basic.dux_: EhBASIC Interpreter; with this ROM you can run BASIC programs in your Durango. It provides Durango-specific Basic commands for **graphics, colour and sound**.


* [ROM](../assets/bin/basicgr.dux);
* [Source Code](https://github.com/zuiko21/minimOS/blob/ehgraph/forge/eh_basic/ehbasic_sa.s)

More information for Ehbasic interpreter:

* [EhBASIC Reference Manual](http://retro.hansotten.nl/uploads/leedavison/Enhanced_6502_BASIC_reference_manual.pdf).
* [Durango-Specific BASIC Commands](ehbasic.md)


### Nano Python: Durango Python Interpreter (PoC) _under development_

### nanoBoot (bootstrap firmware For Raspberry Pi or SD card)

With this ROM you can load _ROM images_ using the nanoLink interface connected to a _Raspberry Pi_, or from an SD card. _Needs the Development Cartridge_.

* [ROM](../assets/bin/nanoboot.dux).
* [Source Code](https://github.com/zuiko21/minimOS/blob/master/forge/nanoboot/rom.s).

For more information, please see [Raspberry Pi Server tool Section](../tools/tools.md#raspberry-pi-durango-servernano-boot) and the [ROM images in SD card section]()

### GamePads Test

<figure markdown>
![Durango Gamepad Test](../assets/img/gamepads.png)
<figcaption>Durango Gamepad Test</figcaption>
</figure>

* _gamepads.bin_ : Standalone Durango Gamepad Tester; Press Gamepad buttons to check that they're working. _This test is compatible with the integrated 40-key Keyboard and gamepad interface_.

* [ROM](../assets/bin/gamepads.dux).
* [Source Code](https://github.com/durangoretro/durango_demos/blob/main/gamepads.s).

### KeyBoard Tester

<figure markdown>
![Durango Keyboard Test](../assets/img/keyboard_test.png)
<figcaption>Durango Keyboard Test</figcaption>
</figure>

* _keyboard_tester.bin_ : Standalone Durango Keyboard Tester. Press keyboard buttons to check that it's working properly. _This test is compatible with the integrated 40-key Keyboard and gamepad interface_.

* [ROM](../assets/bin/keyboard_tester.dux).
* [Source Code](https://github.com/durangoretro/durango_demos/blob/main/keyboard_tester.c).

### Durango Full Test

<figure markdown>
![Durango Full test](../assets/img/fulltest.png)
<figcaption>Durango Full Test</figcaption>
</figure>

* _fulltest.dux_ : Full Hardware Test for Durango; use NMI (F2 on perdita) key to cycle between all tests. _Includes a compact version of the gamepads & keyboard tests above_.

* [ROM](../assets/bin/fulltest.dux).
* [Source Code](https://github.com/zuiko21/minimOS/blob/master/forge/test/fulltest.s).

For more information about Full Test, please check [Full Test documentation page](fulltest.md).
