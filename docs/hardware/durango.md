# Durango

<figure markdown>
![Durango Computer](../assets/img/durangoprototipe.png)
<figcaption>Durango Computer</figcaption>
</figure>

Originally born as a 6502 tester without any specific chips, soon became a full-featured home computer with integrated video output
Range

* **Durango PROTO**: the original CPU tester with some basic I/O (1 MHz)
* **Durango·SV**: 16-colour video output module for SVGA monitor (abandoned)
* **Durango·S**: 128x128, 16-colour home computer
* **Durango·R**: as above but with 256x256 monochrome display
* **Durango·X**: full model, with both the ·S and ·R models video output _(software switchable)_

## Basic Specs

* **CPU**: 65C02 @ 1.536 MHz
* **ROM**: up to 32 KiB cartridge slot (more with bank switching)
* **RAM**: 32 KiB
* **Expansion connector**: [parallel 8-bit bus with 16 addresses](exp_bus.md) for keyboards, joysticks etc.
* **Video output**: via CCIR (PAL) TV thru RGB SCART connector
    Also available as options: composite video (greyscale/HIRES only), Sync-on-Green and Component Video outputs

## Video Modes


* 128 x 128 px. 4 bpp (16-colour GRgB fixed palette, no restrictions) except in ·R model
* 256 x 256 px. 1 bpp (monochrome) except in ·S model
* Switchable greyscale mode (16 levels) except in ·R model
* Inverse Video mode (hardware)
* Four 8 KiB screens software-switchable (screen 0 is shared with ZP, stack etc)
