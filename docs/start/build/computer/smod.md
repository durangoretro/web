---
hide:
  - toc
---
[Site map](../../../sitemap.md))
[Home](../../../index.md) > [Getting Started](../../../started.md) > [Building](../../building.md) > [Durango·X](../durango.md) > **Single-mode**

---
# Single-mode Durango computer

Since making a relatively **versatile** video output _from off-the-shelf components_ adds quite a bit of complexity, some people may desire building a _limited Durango configuration_.

## Single video resolution

The original, full-spec **Durango·X** sports two video modes:

-	**Colour mode:** 128 x 128 pixels, [16-colour](../../../hard/dx/palette.md) (4 bpp)
-	**HIRES mode:** 256 x 256 pixels, _monochrome_ (1 bpp)

Components with designators `1xx` are used for colour mode _only_, whereas designators `2xx` are for HIRES mode. Thus, a simple approach would be not fitting either of these component groups according to the desired (fixed) video mode.

However, since the RAM addresses are _multiplexed_ depending on the selected video mode (thru enabling either `U104/U105` or `U204/205`, accordingly), if the _unsupported_ video mode is selected via software, **the CPU will lose access to RAM**, immediately crashing the computer. Thus, some extra connections must be fitted in order to **ignore** the _selected_ resolution, allowing normal operation of the computer (within the _hardwired_ video mode, of course).

This hack mainly affects components with designators like `3xx`-- check below for differences between v1 and v2.

!!! tip

	When a single-resolution configuration is fitted, either `U104/U105` or `U204/205` may be replaced by **74HC157** instead of the specified _'257_. Any of these types will do fine.

### Mods for HIRES-only _Durango·R_

-	Do NOT fit `U104/U105/U321` neither any other `1xx` designated component (you may keep `J105` for convenience, though)
-	(v1 only) Do NOT fit `Q306`
-	(v2 only) Do NOT fit `Q906/Q307/R336/R337/R922`
-	Make sure `R824/R825` ARE fitted (value is not critical)
-	Cut trace to **pin 10** on `U428` (back side) or remove its pin from the socket
-	Bridge **pins 1 and 16** on `U321` empty footprint
-	Bridge **pins 4 and 3** on `U321` empty footprint
-	Bridge **pins 7 and 6** on `U321` empty footprint
-	Bridge **pins 9 and 10** on `U321` empty footprint
-	Bridge **pins 12 and 13** on `U321` empty footprint
-	(v2 only) Bridge **emitter and collector** (pins 1 & 3) on `Q307` empty footprint -- you may bridge ALL of its pins as well, since `R336` is not fitted anyway.

!!! tip

	If you are building _Durango*·R*_ (HIRES mode only), since it generates no colour signal at all, it makes **no sense** to select the _Component Video_ option. If SCART is not available, use the **second video output** option for a suitable _monochrome_ signal thru an RCA jack. You may delete `C5` and `R30` as these provide the SCART output only.

Since SCART is pretty much phased out in Europe (and was never a thing in other continents, anyway), a newly designed option has been included. The aforementioned PVM monitor do support Component Video as well, thus will remain compatible.

### Mods for colour-only _Durango·S_

-	Do NOT fit `U204/U205/U321` neither any other `2xx` designated component
-	(v2 only) Do NOT fit `Q307/R336/R337`
-	Cut trace to **pin 10** on `U428` (back side)
-	Bridge **pins 1 and 15** on `U321` empty footprint
-	Bridge **pins 4 and 2** on `U321` empty footprint
-	Bridge **pins 7 and 5** on `U321` empty footprint
-	Bridge **pins 9 and 11** on `U321` empty footprint
-	Bridge **pins 12 and 14** on `U321` empty footprint

Plus, if you do not intend to use the (deprecated) **greyscale mode**:

-	Do NOT fit `Q306` (v1) or `Q906` (v2)
-	Bridge **emitter and collector** (pins 1 & 3) on `Q306` (v1) or `Q906` (v2) empty footprint

## Removing software-switchable modes

!!! tip

	Since the only component redundant on this mod is `U428`, it's rarely worth it, thus NOT recommended.

This mod removes the **video mode register** (`U428`) which controls:

-	Video resolution (HIRES/colour)
-	Inverse video mode
-	Selected screen area (0 to 3, the last one being the standard)
-	RGB/Greyscale mode _(deprecated)_
-	Emilio's LED (also useable as a _general purpose output_)

The empty footprint must be wired appropriately:

-	Bridge **pin 10** to **+5 V (pin 16) for HIRES** or **GND (pin 8) for colour**. _This is not needed on **single-mode** Durangos_.
-	Bridge **pin 7** to **+5 V (pin 16) for Inverse video** or **GND (pin 8) for normal video**.
-	Bridge **pins 5 and 12** to **+5 V (pin 16)** for the _standard screen_ (**3**, at `$6000-$7FFF`).
-	Bridge **pin 15** _the opposite way as pin 10_ (+5 V for colour, GND for HIRES). _This is not needed on **single-mode** Durangos, neither for greyscale/sync-on-green/component video versions_.

Since _Emilio's LED_ is no longer available, the associated components (`R32` and `J4`) aren't needed.

In the rare case you'd want to use a different **screen memory** from the standard _3_, wire up **pins and ** as follows:

|Pin 12|Pin 5 |Screen|Addresses      |
|------|------|------|---------------|
|`GND` |`GND` |0     |`$0000-$1F00`\*|
|`GND` |`+5V` |1     |`$2000-$3FFF`  |
|`+5V` |`GND` |2     |`$4000-$5FFF`  |
|`+5V` |`+5V` |**3** |`$6000-$7FFF`  |

\*) Note that the beginning of RAM is used by **zero page, stack and system variables** -- make sure your software does NOT access that area for display purposes! The `$1000-$1FFF` range seems quite safe in this case.

## Removing extra video features

This mod removes the ability to _read_ back the status of the _video mode register_ (upper nybble only) and, most noticeably, the status of the **video blanking signals** (both horizontal and vertical). **Deleted** components are `U530` and, in case of v1 only, `U529`; if so, the **empty `U529` footprint** must be wired appropriately:

-	Bridge **pin 12 to 15**.

!!! note

	If you have no _software-switchable modes_ (i. e., `U428` is NOT fitted), don't bother rewiring the empty `U529` footprint (in case of v1 anyway)

!!! warning

	In v1 boards with this mod (but _software-switchable modes_ still installed), any attempt of _reading_ the video mode register will **corrupt** its value!
