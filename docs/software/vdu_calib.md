# Video Output Calibration

The _Video Circuitry_ of the **Durango-X** home computer has _very tight_ timings. Thus, some **adjustment** is needed in order to cope with _tolerances_, in the form of a few **variable resistors** which, in turn, generate _slight delays_ for some critical signals, in an attempt to match their timings.

!!! note

	Admittedly, the Durango-X design is _far from perfect_... adding performance differences according to the source of components, **no perfect picture is guaranteed**, no matter the adjustment procedure executed. Most of the times you'll be able to reach a _reasonable compromise_, though.

## Colour mode

Two _adjustable resistors_ are provided for this video mode: **RV127** (`PIXEL DELAY`) and **RV128** (``ENABLE DELAY``). _These adjustments may interact with each other_, thus make sure to **recheck** them a few times for the best possible picture quality.

### PIXEL DELAY

**This is the most important setting** with the most noticeable effect in picture quality. Since the multiplexer **U125** (74HC157) has _slightly shorter propagation delay_ than the latch **U124** (74HC574), a thin **ghost image** of every _even pixel_ will show up to the right of _odd pixels_. Thus, a suitable delay will compensate for this; however, too much of it may lead into _uneven_ pixels.
