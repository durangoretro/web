[Home](../index.md) > [Development](development.md) > **Tools**
___

# Durango Development Tools

Durango has several **tools** that can help you creating software.

## Rescomp

Rescomp is a java application Based on [SGDK](https://github.com/Stephane-D/SGDK)`s rescomp. This Java Based tool allows to generate all the binary information to import any resource (image, sprite...) also, this tool allows you to sign any ROM created for Durango.

To Run _rescomp_ you can use the next approach.

```bash
java -jar rescomp.jar -n name - i file.png -o out.h -m BACKGROUND
```

Where the options are:

* ```-n name```: Resource Name.
* ```-i inputfile```: Input File.
* ```-o outputfile```: Output File.
* ```-m MODE```: Mode; to select the operation Mode:

    * BACKGROUND: Background mode; for generate a binary from a background Image.
    * SPRITESHEET: Sprite Sheet mode; for generate binary from a Sprite Sheet and cut each frame.
    * SCREENSHOT: Generate information for a screenshot.
    * BINARY: Allow to store Binary Information.
    * FONT: Allow to generate information from a Font in a Image File.
    * SIGNER: Allow to Sign a Durango Rom.
    * STAMP: Allow to STAMP a Durango Rom.
    * MUSIC: Allow to generate a .h file from [musicxml](https://www.w3.org/2021/06/musicxml40/) format file.
    
* ```-w width```: set the Sprite Frame With.
* ```-h height```: set the Sprite Frame Height.

For more information about Rescomp, please see the Source Code:

[https://github.com/durangoretro/rescomp](https://github.com/durangoretro/rescomp)

## Raspberry Pi Durango Server (nanoBoot)

You can use the Durango nanoLink interface to load a program. You may use the [Durango nanoBoot ROM](../software/roms.md#nano-boot-load-programs-from-raspberry-pi) to load a program using the Raspberry Pi GPIO thru the nanoLink interface.

The nanoLink Interface its in the upper side of the durango board.

<figure markdown>
![Durango nanolink interface](../assets/img/nanolink.png)
<figcaption>Durango nanoLink Interface</figcaption>
</figure>

This server uses the following GPIO pins:

* 35: GND (G)
* 36: CLK (C)
* 38: DAT (D)
* 40: STB (NOT USED)

Or on BCM notation:

* 16: CLK
* 20: DAT
* 21: STB

You need to compile the source code downloaded from:

[https://github.com/durangoretro/nanobootserver/](https://github.com/durangoretro/nanobootserver/)

To compile this program you need the library [WiringPI](https://github.com/WiringPi/WiringPi):


After installing you can compile the program, using make.

```bash
make
```

To use this program, you need to send as a parameter the Rom File Path:

```bash
nanobootServer Rom.dux
```

Remember to stick the nanoBoot ROM on Durango first.

!!! warning "Under Development"

    This software is under development and we are working to improve it. Of course, you can contribute in the github repository.

## CC65

_CC65_ is a freeware C compiler and other tools to work with 6502 microprocessor.

You can use this compiler to create all the ROMS or, use the tools included to helps you the development of the software used for Durango.

For more information about CC65, check CC65 Web Page:

[https://cc65.github.io/](https://cc65.github.io/)

## XA65 assembler

XA is a high-speed, two-pass portable cross-assembler. It understands mnemonics and generates code for NMOS 6502s, CMOS 65C02s and the 65C816.

For more information about XA65, please see the [project's web page](http://www.floodgap.com/retrotech/xa/).
