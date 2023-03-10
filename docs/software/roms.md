# ROMS

Here you can find information about Durango's ROMs, like programs or utilities.

## Roms to download

You can download the Binary ROM, or see the source code.

### EhBasic

<figure markdown>
![Durango EhBasic](../assets/img/basicdur.png)
<figcaption>Durango Ehbasic</figcaption>
</figure>

_basic.dux_: EhBasic Interpreter; with this ROm you can run BASIC programs in your Durango. It contains Durango specific Basic commands.


* [ROM](../assets/bin/basicgr.dux);
* [Source Code]()

More information for Ehbasic interpreter:

* [EHBasic Manual](http://retro.hansotten.nl/uploads/leedavison/Enhanced_6502_BASIC_reference_manual.pdf).
* [Durango Specific Basic Commands](ehbasic.md)


### Nano Python: Durango Python Interpreter (PoC)

### Nano Boot (Load Programs From Raspberry Pi)

With this ROM, you can load programs using NanoLink interface connected to a Raspberry Pi.

* [ROM](../assets/bin/nanoboot.dux).
* [Source Code](https://github.com/zuiko21/minimOS/blob/master/forge/nanoboot/cargador.s).

For more information, please see [Raspberry Pi Server tool Section](../tools/tools.md#raspberry-pi-durango-servernano-boot).

### GamePads Test

<figure markdown>
![Durango Gamepads Test](../assets/img/gamepads.png)
<figcaption>Durango Gamepads Test</figcaption>
</figure>

* _gamepads.bin_ : Durango Gamepad Testing; Press Gamepads buttons to check that is working.

* [ROM](../assets/bin/gamepads.dux).
* [Source Code](https://github.com/durangoretro/durango_demos/blob/main/gamepads.s).

### KeyBoard Tester


<figure markdown>
![Durango keyBoard Test](../assets/img/keyboard_test.png)
<figcaption>Durango KeyBoard Test</figcaption>
</figure>

* _keyboard_tester.bin_ : Durango KeyBoard Tester. Press keyboard buttons to check that is working properly. This test is compatible with Keyboard and gamepad interface.

* [ROM](../assets/bin/keyboard_tester.dux).
* [Source Code](https://github.com/durangoretro/durango_demos/blob/main/keyboard_tester.c).

### Durango Full Test

<figure markdown>
![Durango Full test](../assets/img/fulltest.png)
<figcaption>Durango Full Test</figcaption>
</figure>

* _fulltest.dux_ : Full Test for Durango; use NMI (F2 on perdita) key for change ROM test.

* [ROM](../assets/bin/fulltest.dux).
* [Source Code]().

For more information about Full test, please check [Full test documentation Page](fulltest.md).
