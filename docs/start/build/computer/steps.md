---
hide:
  - toc
---
[Site map](../../../sitemap.md))
[Home](../../../index.md) > [Getting Started](../../../started.md) > [Building](../../building.md) > [Durango·X](../durango.md) > **Step-by-step**

---
# Building the Durango computer, step-by-step

## General guidelines

Please check [the general guidelines](../general.md) for building these PCBs, but **do not attempt soldering _until you have read this document IN FULL_**.

## Critical points

Besides the aforementioned guidelines, you must pay attention to some items on the Durango·X PCB:

- ***IOx*** and _**Expansion** (sidecar)_ connectors **must be placed ABSOLUTELY FLUSH to the board**, otherwise fitting peripherals may become difficult or right impossible!
- If you plan to use the suggested [keyboard/gamepads interface board](keyboard.md), **do NOT solder `D6` and `D4` _yet_** (`POWER` and `ERROR` LEDs) as they must be set at the _proper height_ in order to be visible over the keyboard PCB.

### Video output options

!!! tip

	Except for the _overlapping output connectors_, **all components** can be soldered no matter the chosen video option (although some values may differ)

- The **SCART** connector (`J905` in v2+, `J105` in v1) and the 3x RCA for **Sync-on-green** (v1, `J106`) or **Component video** (v2+, `J605`) do _overlap_, thus only one can be physically mounted.
- The 3x RCA for the **second video output** (`J706` in v2+, `J6` in v1) _may be desired for the **Component video** option_, as audio is always available there. _The video output won't be enabled unless the associate components for the second output (`C709`, `R731` on v2+) are fitted.

## Hacks and fixes

### Image shifted to the left in v2-v2.1

(TBD)
