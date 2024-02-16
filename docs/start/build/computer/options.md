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

If this option is chosen, **you don't need any component with `1xx` designators** (e.g. `U127`). _Note that any **single video mode** Durango build **must** replace components with `3xx`designators by suitable **jumpers**_; [check here for details](smode.md)

### Durango·S

_Somewhat **simpler** than the fully-featured version_, the display output is **4-bit-per-pixel (16-colour) 128 x 128 pixels**, allowing a _nice, colourful presentation_ much suited for games. The **limited text area** (16 x 16 characters) makes it less convenient for code or lots of text on screen, though.

If this option is chosen, **you don't need any component with `2xx` designators** (e.g. `U227`). Also, this is the _only configuration that **needs** components with `8xx` designators_ -- in fact, just a couple of _pull-up_ resistors. _Note that any **single video mode** Durango build **must** replace components with `3xx`designators by suitable **jumpers**_; [check here for details](smode.md)

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

## Composite output DAC

In the original, standard form (SCART-equipped v1), display info _in colour mode_ is sent via the **RGB lines**, while the _sync pulses_ are sent thru the **composite video output** present on the SCART (pin 19) and the _second video output_ as well (if fitted). Since not every SCART-equipped device does support the **RGB mode** (as enabled by the _fast blanking_ line at pin 16), a crude DAC (Digital-to-Analog Converter) is made up from `R107` thru `R110`, providing a **backup signal** which will display an acceptable _greyscale_ version of the image, and not a blank screen.

As an _afterthought_, a **greyscale mode** was added to v1 (**bit 3** of the _video mode register_ at `$DF80`, write-only) by temporarily negating the _fast blanking_ signal, thus allowing the composite output to be displayed on the TV, ignoring the signals on the RGB lines. For that matter, the values of `R107` thru `R110` were chosen to get an acceptably **_linear_ greyscale**.

However, the SCART connector is hard to find on modern TVs, so an _alternative connection_ was needed. **Component Video** is widely supported nowadays, and it's relatively simple to obtain from the native RGB signals, thus this became a **built-in option in _v2_**, and an _external_ [Component Video converter](../../../hard/acc.html) was designed for improved compatibility on v1 units. But these converters just generate the needed `Pb` and `Pr` signals from the original RGB outputs, while the needed `Y` (luminance) signal is _taken directly from the composite output_, again from the crude DAC and intended for _greyscale_. On the other hand, **_proper_ luminance values** are expected on this signal when in Component Video mode for accurate colour display, thus a **new set of valued for `R107` thru `R110`** must be used. Check at the end of [palette considerations](../../../hard/dx/palette.md) for suitable replacement values.

!!! tip

	Since the _greyscale mode_ is seldom used and will still work with the _Luminance DAC_ values (even if slightly less linear), **these new values are always recommended** in any case.

!!! note

	v2 and beyond use **Luminance values** as standard. _Greyscale mode_ is still operative (when using the SCART option) but deprecated.

## PAL encoder

Since RGB signals are _natively generated_ in Durango·S/·X and they give **the highest picture quality**, initially no provision to add **chrominance** (colour) information on the _composite video_ output (both at the SCART and the optional _second video output_). But again, it might be desired for compatibility reasons.

**v1 boards** provide space for a _PAL chrominance encoder_ (components with `6xx` designators) based around the `AD724` IC (unfortunately, only available as a less hobbyist-friendly _Surface-Mounted Device_). But being an afterthough and, specially, due to the _non-standard sync frequencies_ from the Durango video output, **performance might be poor _or not display any colour at all_**, depending on the particular TV set used. Thus, this option is **NOT recommended**.

	    Piezo buzzer for audio
