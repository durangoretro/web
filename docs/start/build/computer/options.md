---
hide:
  - toc
---
[Site map](../../../sitemap.md))
[Home](../../../index.md) > [Getting Started](../../../started.md) > [Building](../../building.md) > [Durango·X](../durango.md) > **Options**

---
# Durango computer buliding options

Designed in a **modular** way, several configurations are available in the Durango _range_ of home computers. Thus, you may **simplify** the build or simply make the computer that suits your actual needs.

## Video modes

The main difference between the _Durango home computer_ and many other retro-inspired SBCs is the **built-in display output** thru a suitable TV or monitor. Display characteristics make a great difference in circuitry, thus worth having the option of limiting the available **video modes**:

### Durango·R

_This is the **simplest** build_, where the display output is **monochromatic 256 x 256 pixels** (a.k.a. _HIRES_ mode). For writing code and any text-based applications (including some _games_) this is the preferred mode, but for _graphical_ games is usually less attractive, due to the lack of colour.

If this option is chosen, **you don't need any component with `1xx` designators** (e.g. `U127`). _Note that any **single video mode** Durango build should replace components with `3xx`designators by suitable **jumpers**_; [check here for details](smode.md)

### Durango·S

_Somewhat **simpler** than the fully-featured version_, the display output is **4-bit-per-pixel (16-colour) 128 x 128 pixels**, allowing a _nice, colourful presentation_ much suited for games. The **limited text area** (16 x 16 characters) makes it less convenient for code or lots of text on screen, though.

If this option is chosen, **you don't need any component with `2xx` designators** (e.g. `U227`). Also, this is the _only configuration that **needs** components with `8xx` designators_ -- in fact, just a couple of _pull-up_ resistors. _Note that any **single video mode** Durango build should replace components with `3xx`designators by suitable **jumpers**_; [check here for details](smode.md)

!!! tip

	Even if `R825` and `R827` are needed for this configuration _only_, they're _harmless_ in any case and could be fitted for **all options** with no ill effect.

### Durango·X

!!! note

	This is the _full-featured, **recommended** option_.

This option combines the functionality of **both _Durango·R_ and _Durango·S_** options. `3xx`-designated components are also needed to allow _software-switching_ between modes.

## Monitor output

Several options are available, depending on you preferred display device. There are changes from v1 to v2, for improved compatibility with modern TV sets.

!!! warning

	Due to the _slightly non-standard_ video output, some TVs and monitors **may not be compatible** with Durango's signal.

	Monitor output:
        SCART (colour via RGB, recommended option)
        Sync-on-green (v1) / Component video (v2+)
        Second audio/video output
    Composite encoding:
        Greyscale (standard in v1)
        Luminance (standard in v2+, recommended option)
    PAL encoder (for composite output, NOT recommended)
    Piezo buzzer for audio
