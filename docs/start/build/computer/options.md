---
hide:
  - toc
---
[Site map](../../../sitemap.md))
[Home](../../../index.md) > [Getting Started](../../../started.md) > [Building](../../building.md) > [Durango·X](../durango.md) > **Options**

---
# Durango computer buliding options

Designed in a **modular** way, several configurations are available for the Durango _range_ of home computers. Thus, you may **simplify** the building process or simply make the computer that suits your actual needs.

## Video modes

The main difference between the _Durango home computer_ and many other retro-inspired SBCs is the **built-in display output** thru a suitable TV or monitor. Display characteristics make a great difference in circuitry, thus it's worth having the option of limiting the available **video modes**:

### Durango·R

_This is the **simplest** build_, where the display output is **monochromatic 256 x 256 pixels** (a.k.a. _HIRES_ mode). For writing code and any text-based applications (including some _games_) this is the preferred mode, but for _graphical_ games is usually less attractive, due to the lack of colour.

If this option is chosen, **you don't need any component with `1xx` designators** (e.g. `U127`). _Note that any **single video mode** Durango build **must** replace components with `3xx`designators by suitable **jumper wires**_; [check here for details](smod.md)

### Durango·S

_Somewhat **simpler** than the fully-featured version_, the display output is **4-bit-per-pixel (16-colour) 128 x 128 pixels**, allowing a _nice, colourful presentation_ much suited for games. The **limited text area** (16 x 16 characters) makes it less convenient for code or lots of text on screen, though.

If this option is chosen, **you don't need any component with `2xx` designators** (e.g. `U227`). Also, this is the _only configuration that **needs** components with `8xx` designators_ -- in fact, just a couple of _pull-up_ resistors. _Note that any **single video mode** Durango build **must** replace components with `3xx`designators by suitable **jumper wires**_; [check here for details](smod.md)

!!! note

	Even if `R824` and `R825` are needed for this configuration _only_, they're _harmless_ in any case and could be fitted for **all options** with no ill effect.

### Durango·X

!!! tip

	This is the _full-featured, **recommended** option_.

This option combines the functionality of **both _Durango·R_ and _Durango·S_** options. `3xx`-designated components are also needed to allow _software-switching_ between modes.

## Monitor output

Several options are available, depending on you preferred display device. There are big changes from v1 to v2, for **improved compatibility** with modern TV sets.

!!! warning

	Due to the _slightly non-standard_ video output, some TVs and monitors **may not be compatible** with Durango's signal.

### SCART

!!! tip

	This is the originally intended port, and it's the **recommended option** as it provides the **best** image quality.

_SCART_ connections have been pretty much **standard** for European TV sets since the early 80's, and they provide both a **composite video** input (and output, if suitable) and _**RGB signals** for optimum picture quality_. A _fast blanking_ signals allow automatic switching between both modes. This is particularly well fitted to the Durango·X video circuitry, as **colour mode** signals go directly (thru a crude DAC) to the _RGB inputs_, while the **monochrome (HIRES) video** goes into _composite video_, after being mixed with the _sync signals_.

Since some SCART-equipped devices (e.g. VCRs and _combos_) do NOT support RGB inputs, another crude **Luminance DAC** is added to the aforementioned mixer which adds a _greyscale_ version of the colour picture, so the device does at least display the image. There's the option in colour mode to switch off the _fast blanking_ signal, thus making the TV _ignore the RGB signals_ and displaying a **grayscale mode** image instead.

Note that, in _colour (RGB) mode_, sync signals are expected to be present at the SCART _composite_ input in any case.

!!! note

	The _greyscale_ mode is **deprecated**, although all SCART-equipped Durangos up to 2.x do support it. Check the **Composite output DAC** section below for details.

### Sync-on-green _(v1 only)_

Originally intended for the **Sony PVM** range of monitors, quite popular within the _retro-computing_ community, as they sport **RGB inputs** but NOT a SCART connection. Tapping off the separate sync from Durango would be cumbersome, thus this option allows easy connection to these monitors. As a side effect, _monochrome (HIRES) mode_ will display as **green-on-black**, for a further retro experience!

!!! bug

	Despite what the schematics stated, `R111` and `R113` must be fitted (maybe with values down to 330 ohm) and pin 11 of `J105` must be **grounded** (easily done from the nearby pins 9 or 13) for best **colour accuracy**.

!!! note

	This option has been replaced since v2.0 for **Component video**, which is more popular within modern TVs and the PVM monitors support as well. In any case, _greyscale mode is **not** supported_ on either type of connection.

### Component Video _(v2.x only)_

!!! tip

	If you are building _Durango*·R*_ (HIRES mode only), since it generates no colour signal at all, it makes **no sense** to select the _Component Video_ option. If SCART is not available, use the **second video output** option for a suitable _monochrome_ signal thru an RCA jack. You may delete `C5` and `R30` as these provide the SCART output only.

Since SCART is pretty much phased out in Europe (and was never a thing in other continents, anyway), this option has been included. The aforementioned PVM monitor do support Component Video as well, thus will remain compatible.

!!! tip

	You might want to add `J706` for the **audio output**, even if you don't fit `R731` and `C709`  (which enable the _second video output_ from the third RCA jack on it)

!!! note

	RGB is still the native video output of a Durango computer, thus _colours may differ a bit_ thru Component video, but this is to be expected.

!!! warning

	It is known that _many_ modern TVs are **not** compatible with the **240p/288p** signal supplied by Durango-X _thru the **Component Video** input_. In such cases, if a _suitable YPbPr-to-HDMI converter_ is not available (we're researching on that), you may always use the **composite video** input, although in _greyscale_ mode. Note that this will perform fine in HIRES mode.

!!! tip

	If you can hook a _PlayStation 2_ **thru Component video input** and properly play a **_PS1_ game** on it, your TV is most likely **compatible** with Durango-X.
 
## Composite output DAC

In the original, standard form (SCART-equipped v1), display info _in colour mode_ is sent via the **RGB lines**, while the _sync pulses_ are sent thru the **composite video output** present on the SCART (pin 19) and the _second video output_ as well (if fitted). Since not every SCART-equipped device does support the **RGB mode** (as enabled by the _fast blanking_ line at pin 16), a crude DAC (Digital-to-Analog Converter) is made up from `R107` thru `R110`, providing a **backup signal** which will display an acceptable _greyscale_ version of the image, and not a blank screen.

As an _afterthought_, a **greyscale mode** was added to v1 (**bit 3** of the _video mode register_ at `$DF80`, write-only) by temporarily negating the _fast blanking_ signal, thus allowing the composite output to be displayed on the TV, ignoring the signals on the RGB lines. For that matter, the values of `R107` thru `R110` were chosen to get an acceptably **_linear_ greyscale**.

However, the SCART connector is hard to find on modern TVs, so an _alternative connection_ was needed. **Component Video** is widely supported nowadays, and it's relatively simple to obtain from the native RGB signals, thus this became a **built-in option in _v2_**, and an _external_ [Component Video converter](../../../hard/acc.html) was designed for improved compatibility on v1 units. But these converters just generate the needed `Pb` and `Pr` signals from the original RGB outputs, while the needed `Y` (luminance) signal is _taken directly from the composite output_, again from the crude DAC and intended for _greyscale_. On the other hand, **_proper_ luminance values** are expected on this signal when in Component Video mode for accurate colour display, thus a **new set of valued for `R107` thru `R110`** must be used. Check at the end of [palette considerations](../../../hard/dx/palette.md) for suitable replacement values.

!!! note

	Since the _greyscale mode_ is seldom used and will still work with the _Luminance DAC_ values (even if somewhat less linear), **these new values are always recommended** in any case.

	v2+ silkscreen uses **Luminance values** as standard. _Greyscale mode_ is still operative (when using the SCART option) but **deprecated**.

## PAL encoder

Since RGB signals are _natively generated_ in Durango·S/·X and they give **the highest picture quality**, initially no provision to add **chrominance** (colour) information on the _composite video_ output (both at the SCART and the optional _second video output_). But again, it might be desired for compatibility reasons.

**v1 boards** provide space for a _PAL chrominance encoder_ (components with `6xx` designators) based around the `AD724` IC (unfortunately, only available as a less hobbyist-friendly _Surface-Mounted Device_). But being an _afterthough_ and, specially, due to the **non-standard sync frequencies** from the Durango v1 video output, **performance might be poor _or not display any colour at all_**, depending on the particular TV set used. Thus, this option is **NOT recommended**.

## Second video output

Essentially the _same_ signal as the one available at the **composite** signal on the SCART (pin 19), but for _impedance matching_ reasons it's obtained thru a separate RC network (`R31` and `C9` on v1, `R731` and `C709` on v2+). If these components are fitted, this signal is available at the yellow (leftmost) RCA jack on `J6`. The remaining RCA jacks (red & white) provide **monoaural audio** output for convenience, just in parallel with the SCART audio signal.

!!! tip

	If _both_ composite signals are to be used **simultaneously**, it's recommended to use a lower value for `R15` (down to **120 ohm**). _v2 boards_ silkscreen already state this updated value and, in any case, using it won't do any harm, just a somewhat increased power consumption.

## Piezo buzzer for audio

The Durango-generated audio (usually a _square wave_ from `U12`, but also any arbitrary signal thru the `AUDIO IN` line supplied by suitable cartidges) goes into a simple mixer around `Q3`, then it takes two routes:

-	_Line-level_ audio at SCART `J105` (and `J6` if fitted), thru a **low-pass filter** and attenuator made around `R4`, `R5` and `C2`.
-	Internal **buzzer** `BZ1` thru an attenuation resistor `R23` and a _disabling jumper_ `JP2`.

If the buzzer is not needed, these three components don't need to be fitted. Also, `R23` can be modified for _volume_ control.

!!! warning

	`R23` may dissipate quite a lot of heat, thus a **half-watt** rated resistor is highly recommended. For _maximum loudness_ it may be replaced by a jumper wire, but that might **overload** `Q3`.

	In any case, the use of the buzzer does **increase power consumption** considerably.
