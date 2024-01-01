[Home](../../index.md) > [Hardware](../../hardware.md) > [Durango](../arch.md) > [Durango·X](../durango.md) > **EIA (60 Hz) version**
___
# EIA (NTSC) 60 Hz version

Although _Durango·X_ was initially designed around the **CCIR TV standards** used in Spain and in most _PAL_ countries,
there is an alternative version compatible with the **EIA standard** most used in _NTSC_ countries, allowing
**worldwide** use of this computer architecture.

!!! note

	Although the terms _PAL_ and _NTSC_ are commonly used to describe the regional versions of many consoles and
 	home computers, these are **not** accurate for the Durango computers, as **they lack a _chroma_ subcarrier**
	encoded in either PAL or NTSC (or SECAM, for that matter), using **direct RGB or _component video_** connections
	instead, for **higher quality** picture. But the **refresh rates** and **number of rasters** must match the
	desired standard (625/50 for **CCIR** and 525/60 for **EIA**) in any case.
	
	_Most of the times EIA countries use
	NTSC for colour encoding, and CCIR use PAL_, but not always.

## Specs

- **1.57 MHz** (3.15 MHz with _turbo_ option) from a readily available 25.175 MHz _VGA_ oscillator.
- **Component video** output and/or _greyscale_ composite signal (SCART is not available).
- Display: **256 x 192 pixels** in monochrome HIRES or **128 x 96 pixels** in the usual [16-colour mode](palette.md)
- _Momentary_ display of the **bottom 64 _rasters_** (64 lines in HIRES, 32 in colour) for existing software compatibility.

Remaining specs are the same as the CCIR (50 Hz) version.
 
