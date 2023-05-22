# Video Output Calibration

The _Video Circuitry_ of the **Durango-X** home computer has _very tight_ timing. Thus, some **adjustment** is needed in order to cope with _component tolerances_, by means of a few **variable resistors** which, in turn, generate _slight_ delays for some critical signals, in an attempt to match their timing.

!!! note

	Admittedly, the Durango-X design is _far from perfect_... adding performance differences according to the source of components, **no perfect picture is guaranteed**, no matter the adjustment procedure executed. Most of the times you'll be able to reach a _reasonable compromise_, though.

## Colour mode

Two _adjustable resistors_ are provided for this video mode: **RV127** (`PIXEL DELAY`) and **RV128** (``ENABLE DELAY``). _These adjustments may interact with each other_, thus make sure to **recheck** them a few times for the best possible picture quality.

### PIXEL DELAY

<figure markdown>
![Low Pixel Delay](../assets/img/durango-pixdly.png)
<figcaption>Close-up of wrong PIXEL DELAY setting</figcaption>
</figure>

**This is the most important setting** with the most noticeable effect in picture quality. Since the multiplexer **U125** (74HC157) has _slightly shorter propagation delay_ than the latch **U124** (74HC574), a thin **ghost image** of every _even pixel_ will show up to the right of _odd pixels_. Thus, a suitable _delay_ between switching of their inputs will compensate for this; however, too much of it may lead into _uneven_ pixels.

<figure markdown>
![Low Pixel Delay](../assets/img/pixdly-low.png)
<figcaption>Too little: turn COUNTERclockwise</figcaption>
</figure>
<figure markdown>
![Pixel Delay OK](../assets/img/pixdly-ok.png)
<figcaption>Correct setting</figcaption>
</figure>
<figure markdown>
![Excessive Pixel Delay](../assets/img/pixdly-hi.png)
<figcaption>Too much: turn clockwise</figcaption>
</figure>

!!! note

	These are actual photgraphs of an **LCD screen** (Samsung 26C450), thus some _colour artifacts_ are visible all the time.

### ENABLE DELAY

Since the video address counters keep supplying valid addresses all the time, video output **must be disabled** after the whole 128px (64 bytes in colour mode) or 256px (32 bytes in HIRES) have been displayed for every line, in order _not to disturb the sync_ signal. The same goes true for the _vertical blanking interval_. Propagation delays may have the effect of **repeating the leftmost pixel** of every raster as a thin _ghost_ line **after the rightmost pixel**. This can be mitigated by adding a _slight_ delay to the **Display Enable** signal; in case of _colour mode_, this takes `/CDE` line from **U22 pin 6** (74HC175) thru a variable resistor `RV128` -- this, combined with the **U127 pin 19** (74HC245) _input capacitance_, creates the needed delay.

However, _these timing differences are NOT symmetrical_, thus in practice the **enable-off** as described may need a _different_ setting than the **enable-on** moment to the left of the picture; the latter one will actually sample the _display RAM_ contents **just before the horizontal counter is reset**, thus some pixel _around the centre_ of the screen (from the 33rd byte of the previous raster) shows up at the left of the picture. _This is usually a **more noticeable** deffect than the previous one_, thus if no satisfactory compromise can be set, it's normally best to leave this setting in the _low_ side.

<figure markdown>
![Enable Delay OK](../assets/img/endly-ok.png)
<figcaption>MOSTLY correct setting (note slight artifacts to the left of cyan and blue bars)</figcaption>
</figure>
<figure markdown>
![Excessive Enable Delay](../assets/img/endly-bad.png)
<figcaption>Too much: turn clockwise</figcaption>
</figure>

!!! note

	This particular **Durango-X** unit looks almost OK at an extreme setting, thus no further correction is possible. Check for similar artifacts on the other side of the screen in case the setting is _too low_.

## High Resolution mode

### HIRES DELAY

**This is the only adjustment available in _HIRES_ mode**, and it's equivalent to the aforementioned `ENABLE DELAY` for colour. The attempt is to **minimise stray pixels** to the left and right sides of the picture, although most of the times it must be a _compromise_ setting.

Technically speaking, this puts some delay **on the video stream itself**, thus too much of a setting _may impair picture sharpness_ or, most likely, create some gliches.

<figure markdown>
![HIRES Delay OK](../assets/img/hires-ok.png)
<figcaption>**OK**</figcaption>
</figure>
<figure markdown>
![Excessive HIRES Delay](../assets/img/hires-bad.png)
<figcaption>Too much: turn clockwise</figcaption>
</figure>

## Monitor settings

Some adjustments can only be done **on the monitor** itself. Particularly, Durango-X generates **256 raster lines** out from CCIR standard _absolute maximum_ of 288 (**288p**) which some monitors _may not display in full_; some monitors may need a _warm-up time_ for proper adjustment. Otherwise, look for **vertical size/vertical pos./vertical hold** settings on your display.

<figure markdown>
![bottom raster lines](../assets/img/pvm255.png)
<figcaption>The very last raster is cropped on this monitor (Sony PVM-9041Q) until it warms up.</figcaption>
</figure>
