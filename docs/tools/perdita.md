# Perdita

Perdita is a Durango Emulator, that can run any ROM created for Durango. Perdita is based on 6502 instructions and the durango Architecture.

<figure markdown>
![Perdita Emulator](../assets/img/perdita.png)
<figcaption>Durango Emulator</figcaption>
</figure>

With Perdita you can test your developments, and use the internal development tools, like memory dump or gamepad emulation.

Perdita use SDL2 framework to show the information; so you need to install it on your System (only Linux)

```bash
apt install sdl2-dev
```

You can find the source code of Perdita, in the next Repository.

[https://github.com/zuiko21/minimOS/tree/master/emulation](https://github.com/zuiko21/minimOS/tree/master/emulation)

You can use the Makefile to generate the perdita executable.

```bash
make
```

!!! note "Generate Perdita for Windows"

    If you want to generate perdita for windows, you need to use _mingw32_ to generate the exe file, with the next make goal.


```bash
make perdita.zip # Only for generate windows executable
```

!!! note "Generate Perdita using Docker"

    You can use the next DockerFile to generate an container with Perdita. [https://github.com/zerasul/dockerretro/blob/master/sdl/Dockerfile](https://github.com/zerasul/dockerretro/blob/master/sdl/Dockerfile).


To Run Perdita, you can use the next instructions

```bash
./perdita [options] <path to romfile>
```

The options included are:

* ```-a```: load ROM at supplied address, example ```0x8000```.
* ```-f```: fast mode.
* ```-s```: safe mode (will stop on warnings and BRK).
* ```-p```: start in STEP mode
* ```-l```: enable error LED(s)
* ```-k```: keep GUI open after program end
* ```-h```: headless -- no graphics!
* ```-v```: verbose (warnings/interrupts/jumps/events/all)
* ```-r```: do NOT randomize memory at startup
* ```-g```: emulate controllers (Gamepads); you can use usb gamepads with durango emulator.
* ```-m```: do NOT emulate Minstrel-type keyboard

Also, you can execute some commands using functions keys:

* ```F1```: Stop emulation and quit.
* ```F2```: NMI Button.
* ```F3```: IRQ (interruption).
* ```F4```: Reset.
* ```F5```: Pause.
* ```F6```: DUMP.
* ```F7```: STEP.
* ```F8```: CONT.
* ```F9```: Load.