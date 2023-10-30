# Durango

<figure markdown>
![Durango Computer](../assets/img/durangoprototipe.png)
<figcaption>Durango-X Computer main board</figcaption>
</figure>

Originally born as a _6502 tester_ without any specific chips, soon became a full-featured home computer with **integrated video** output.

For advanced information, check the [Theory of Operation](theory.md). If you already own a Durango-X computer and it's _acting up_, you may be interested in the [Troubleshooting Guide](../troubleshoot.md) as well.

## Range

* **Durango PROTO**: the original CPU tester with some basic I/O (1 MHz)
* **Durango·SV**: 16-colour video output module for SVGA monitor (abandoned)
* **Durango·S**: 128x128 pixel, [16-colour](palette.md) home computer
* **Durango·R**: as above but displaying 256x256 _monochrome_ instead
* **Durango·X**: full model, with both the ·S and ·R models video output _(software switchable)_
* **Durango·C**: simplifed, reduced chip-count version of **Durango-X** _(under development)_
* **Durango Pocket**: _handheld_ **2 MHz** version, although not ~~fully~~ compatible _(under development)_

## Basic Specs

* **CPU**: 65C02 @ 1.536 MHz
* **ROM**: up to 32 KiB cartridge slot (more with bank switching)
* **RAM**: 32 KiB
* **Expansion connector**: [parallel 8-bit bus with 16 addresses](exp_bus.md) for keyboards, joysticks etc.
* **Video output**: via CCIR (PAL) TV thru RGB SCART connector.

Also available as options: composite video (greyscale/HIRES only), _Sync-on-Green_ and Component Video outputs.

!!! note

	Revision v2 will increase the clock speed up to **1.75 MHz**, plus an option for a **_TURBO_ mode** at _twice_ the speed -- a whopping **3.5 MHz** !!

## Video Modes

* 128 x 128 px. 4 bpp (256-raster, [16-colour GRgB fixed palette](palette.md), no restrictions) except in ·R model
* 256 x 256 px. 1 bpp (monochrome) except in ·S model
* Switchable greyscale mode (16 levels) except in ·R model and _Sync-on-Green/Component video_ options
* Inverse Video mode (hardware)
* Four 8 KiB screens software-switchable (screen 0 is shared with ZP, stack etc)

!!! note

	Built-in screen for _Pocket_ model to be determined.

!!! warning

	The Durango-X computer is designed to be hooked to a TV or monitor conforming to the _CCIR (PAL)_ **50 Hz** standard. While a _mod_ (under development) may generate a proper _EIA (NTSC)_ **60 Hz** signal, _there is no way to fit the usual 256-raster image_ on such displays -- 240 rasters being the _absolute limit_, and very few sets will actually display more than 215-220 rasters. All software will run, but the bottom of the screen may become invisible. _Revision 2 will be available with a **60 Hz option** (different board) displaying 192 rasters at once, with a **pushbutton** to momentarily show the bottom rasters_.

!!! note

	The _EIA_ (60 Hz) version of the revision v2 is expected to run at ~**1.5734 MHz** (with a _TURBO_ option of ~3.15 MHz)

## Options

The _Durango project_ allows to build your computer under **several configuration options, _all of them using the same PCB_**, by just choosing the appropriate components.

!!! warning

	Generally speaking, as the _Durango_ computer provides a **slightly non-standard video signal**, some displays _might be incompatible_, no matter the chosen option (although this is quite rare according to our experience so far).

### Supported video mode options

* Durango-S: _colour mode only_ (128 x 128 px., 4 bpp)
* Durango-R: _HIRES mode only_ (256 x 256 px., 1 bpp)
* **Durango-X**: _both modes available_ **(recommended option)**

### Video output options

* **RGB-SCART (recommended option)**: will display colour _on RGB mode only_, as composite output needs the PAL encoder.
* Sync-on-green: suitable for some monitors, especially the **Sony PVM range**, via RCA connectors. _Note that greyscale mode is not available_.

!!! note

	Future revisions (v2 onwards) of the _Durango-X_ board will replace the _Sync-on-green_ option by a **Component video** output, which is both suitable for the _PVM monitors_ and more **modern TV sets**, lacking SCART socket.

### PAL encoder option

* with PAL encoder (AD724): _composite output_ (from SCART and/or RCA) may be in colour.
* **No PAL encoder (recommended option)**: composite output is _greyscale_.

!!! bug

	The **PAL encoder** option was an afterthought, thus _picture quality may be poor_ or, on some devices, may not display any colour at all. _This has been **deprecated** on revision 2 of the board_.
	
### Second composite output option

This adds an RCA jack (together with a couple more for _audio_) with **composite video** output, although it will be _**grayscale** unless the PAL encoder option is installed_. If both this output and the one on the SCART are to be used _at the same time_, you may wish to swap `R15` for a lower value (say, 180 ohm) for picture stability.

!!! tip

	The _Sync-on-green_ option, unlike the SCART, does NOT provide audio output, thus the extra _3 RCA jack set_ intended for the _Second video output_ may be desired for **audio**, even if the second video output isn't functional.
