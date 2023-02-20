# Durango Development Tools

Durango have some Tools that can help you to create software.

## Rescomp

Rescomp, is a java application Based on [SGDK](https://github.com/Stephane-D/SGDK)`s rescomp. This Java Based tool allows to generate all the binary information to import any resource (image, sprite...) also, this tool allows you to sign any ROM created for Durango.

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
    
* ```-w width```: set the Sprite Frame With.
* ```-h height```: set the Sprite Frame Height.

For more information about Rescomp, please see the Source Code:

[https://github.com/durangoretro/rescomp](https://github.com/durangoretro/rescomp)

## CC65

_CC65_, is a freeware C compiler and other tools to work with 6502 microprocessor.

You can use this compiler to create all the ROMS or, use the tools included to helps you the development of the software used for Durango.

For more information about CC65, check CC65 Web Page:

[https://cc65.github.io/](https://cc65.github.io/)
