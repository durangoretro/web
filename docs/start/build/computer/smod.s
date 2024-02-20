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

This hack affects components with designators like `3xx`-- actually, just `U321` in v1 boards; but v2 adds `Q307`, `R336` and `R337`.

## Extra video modes

## Extra video features
