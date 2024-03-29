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

This hack affects components with designators like `3xx`-- actually, just `U321/Q306` in v1 boards; but v2 adds `Q307`, `R336` and `R337`.

!!! tip

	When a single-resolution configuration is fitted, either `U104/U105` or `U204/205` may be replaced by **74HC157** instead of the specified _'257_.

### Mods for HIRES-only _Durango·R_

-	Do NOT fit `U104/U105/U321` neither any other `1xx` designated component (you may keep `J105` for convenience, though)
-	(v1 only) Do NOT fit `Q306`
-	(v2 only) Do NOT fit `Q906/Q307/R336/R337/R922`
-	Make sure `R824/R825` ARE fitted (value is not critical)
-	Cut trace to **pin 10** on `U428` (back side)
-	Bridge **pins 1 and 16** on `U321` empty footprint
-	Bridge **pins 4 and 3** on `U321` empty footprint
-	Bridge **pins 7 and 6** on `U321` empty footprint
-	Bridge **pins 9 and 10** on `U321` empty footprint
-	Bridge **pins 12 and 13** on `U321` empty footprint
-	(v2 only) Bridge **emitter and collector** (pins 1 & 3) on `Q307` empty footprint

### Mods for colour-only _Durango·S_

-	Do NOT fit `U204/U205/U321` neither any other `2xx` designated component
-	(v1 only) Do NOT fit `Q306`
-	(v2 only) Do NOT fit `Q906/Q307/R336/R337`
-	Cut trace to **pin 10** on `U428` (back side)
-	Bridge **pins 1 and 15** on `U321` empty footprint
-	Bridge **pins 4 and 2** on `U321` empty footprint
-	Bridge **pins 7 and 5** on `U321` empty footprint
-	Bridge **pins 9 and 11** on `U321` empty footprint
-	Bridge **pins 12 and 14** on `U321` empty footprint
-	Bridge **emitter and collector** (pins 1 & 3) on `Q306` (v1) or `Q906` (v2) empty footprint

## Removing software-switchable modes

## Removing extra video features
