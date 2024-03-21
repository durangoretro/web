[Home](../../index.md) > [Getting Started](../../started.md) > [Building _Durango·X_](../building.md) > **Assembly guide (computer)**
___
# Assembly guide (computer)

## [Building options](computer/options.md)

_Whithin the same board_, you may choose from several building options:

- Supported video modes:
	- Colour only (_Durango·**S**_)
	- HIRES only (_Durango·**R**_)
	- **Both modes** (_Durango·**X**_, recommended option)
- Monitor output:
	- **SCART** (colour via _RGB_, recommended option)
	- Sync-on-green (v1) / Component video (v2+)
- Composite encoding:
	- Greyscale (standard in v1)
	- **Luminance** (standard in v2+, recommended option)

!!! warning

	It is known that _many_ modern TVs are **not** compatible with the **240/288p** signal supplied by Durango-X _thru the **Component Video** input_. In such cases, if a _suitable YPbPr-to-HDMI converter_ is not available (we're researching on that), you may always use the **composite video** input, although in _greyscale_ mode. Note that this will perform fine in HIRES mode.

!!! tip

	If you can hook a _PlayStation 2_ **thru Component video input** and properly play a **_PS1_ game** on it, your TV is most likely **compatible** with Durango-X.

There are some _independent_ options as well, you may add them as desired:

- Second audio/video output
- PAL encoder (for composite output, _NOT_ recommended)
- Piezo buzzer for audio

## [BOM](computer/bom.md)

**Before** you begin soldering, please _make sure you've got both the **PCB** and **ALL of the components**_ needed, and that _they fit the footprints on the PCB_. Depending on the [chosen configuration](computer/options.md), some components may vary. In some cases, values are not mandatory and _might be changed_ to fit your stock.

Since this is a **modular** board which allows several [configuration options](computer/options.md), make sure you get the right components for your choice. Generally speaking:

- **Single-digit designator:** _common_ components needed for _all configurations_.
- **`1xx` (`100` to `199`) designators:** if _colour mode_ is required (Durango**·S** and **·X**).
- **`2xx` (`200` to `299`) designators:** if _HIRES mode_ is required (Durango**·R** and **·X**).
- **`3xx` (`300` to `399`) designators:** whenever _both_ video modes coexist (Durango**·X** only, otherwise is a [single-mode Durango](smod.md)).
- **`4xx` (`400` to `499`) designators:** for the _video mode settings_ register (resolution, inverse, greyscale, screen-switching, _Emilio's LED_).
- **`5xx` (`500` to `599`) designators:** for the _extra_ video features (_readable_ video mode, _horizontal & vertical blanking_ detection).
- **`6xx` (`600` to `699`) designators:** if _Component Video output_ is required (v2 only).
- **`7xx` (`700` to `799`) designators:** if the _second video output_ is required (includes _audio_ for the option above).
- **`8xx` (`800` to `899`) designators:** if _HIRES mode_ is NOT fitted (Durango**·S** only).
- **`9xx` (`900` to `999`) designators:** if _SCART video output_ is required.

The **standard build** (SCART-equipped fully software-featured Durango·X) would use all components except designators `6xx`, `7xx` and `8xx`.

## [Step by step](computer/steps.md)

!!! warning

	***This is a particularly complex project*** so it's assumed you've got _some experience_ soldering electronic circuits.

First of all, please read the [general advice](general.md) suitable for all of the boards. But **before soldering**, have into account
this particular board's peculiarities:

- ***IOx*** and _**Expansion** (sidecar)_ connectors **must be placed ABSOLUTELY FLUSH to the board**, otherwise fitting peripherals may become difficult or right impossible!
- Some _video output options_ are **compatible** and may be installed simultaneously, but some others have _overlapping footprints_ and aren't. Other than that, **all** the components can be fitted to the board without any problems, no matter the selected configuration.
- If you plan to use the suggested [keyboard/gamepads interface board](keyboard.md), **do NOT solder `D6` and `D4` _yet_** (`POWER` and `ERROR` LEDs) as they must be set at the _proper height_ in order to be visible over the keyboard PCB.

!!! bug

	v2 and v2.1 PCBs have a design bug which displays the picture heavily _shifted to the left of the screen_ (although the whole area stays visible). Check the [hacks and fixes section](computer/steps.md) for an easy mod to fix this.
	**v2.2 and later are NOT affected** by this bug, as wasn't v1.

## [Video Output Calibration](computer/vdu_calib.md)

Adjustment procedure in order to get the best video output from a Durango computer

## [Troubleshooting](computer/troubleshoot.md)

Not working? Don't panic!
