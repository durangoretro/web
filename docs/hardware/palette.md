# Durango colour palette

The _Durango-X_ and _Durango-S_ colour computers have a **colour display mode** of 128 x 128 pixels. Using _4 bits per pixel_, it allows the
simultaneous use of **16 colours** on the screen. Unlike some old computers like the _ZX-Spectrum_, _Commodore 64_, _MSX_ etc
**there are no restrictions** about how many different colours may appear in a certain area.

## Palette colour list

|Decimal|Hex|Binary|Name   |HTML equivalent|
|-------|---|------|-------|---------------|
|0      |$0 |%0000 |Black  |<span style="background-color:#000000;color:white">\#000000</span>|
|1      |$1 |%0001 |Green  |<span style="background-color:#00AA00;color:black">\#00AA00</span>|
|2      |$2 |%0010 |Red    |<span style="background-color:#FF0000;color:white">\#FF0000</span>|
|3      |$3 |%0011 |Orange |<span style="background-color:#FFAA00;color:black">\#FFAA00</span>|
|4      |$4 |%0100 |Dark green|<span style="background-color:#005500;color:white">\#005500</span>|
|5      |$5 |%0101 |Lime   |<span style="background-color:#00FF00;color:black">\#00FF00</span>|
|6      |$6 |%0110 |Brick  |<span style="background-color:#FF5500;color:white">\#FF5500</span>|
|7      |$7 |%0111 |Yellow |<span style="background-color:#FFFF00;color:black">\#FFFF00</span>|
|8      |$8 |%1000 |Blue   |<span style="background-color:#0000FF;color:white">\#0000FF</span>|
|9      |$9 |%1001 |Sky    |<span style="background-color:#00AAFF;color:black">\#00AAFF</span>|
|10     |$A |%1010 |Magenta|<span style="background-color:#FF00FF;color:white">\#FF00FF</span>|
|11     |$B |%1011 |Pink   |<span style="background-color:#FFAAFF;color:black">\#FFAAFF</span>|
|12     |$C |%1100 |Azure  |<span style="background-color:#0055FF;color:white">\#0055FF</span>|
|13     |$D |%1101 |Cyan   |<span style="background-color:#00FFFF;color:black">\#00FFFF</span>|
|14     |$E |%1110 |Fuchsia|<span style="background-color:#FF55FF;color:white">\#FF55FF</span>|
|15     |$F |%1111 |White  |<span style="background-color:#FFFFFF;color:black">\#FFFFFF</span>|

This palette is designed in a way that changing the _Least Significant Bit_ will produce a
_noticeable luminance change_, thus providing **adequate contrast**.

!!! Note

	Depending on your display and component tolerances, some colours may differ in practice -- 	**dark green** in particular will usually look _darker_, thus minimising the difference between colours where this bit changes.

## Display format

In all video modes, Durango-X uses a **linear framebuffer**. Its dimensions being _powers of 2_,
any screen position is easily computed into the corresponding memory address.

### Colour mode

Display memory follows the **"chunky"** model -- all bits defining a pixel are packed together into
the same byte. At 4 bpp, _two pixels are encoded on every byte_:

|128|64|32|16|8|4|2|1|
|---|--|--|--|-|-|-|-|
|<span style="background-color:#0000FF">left **B**</span>|<span style="background-color:#005500">left **g**</span>|<span style="background-color:#FF0000">left **R**</span>|<span style="background-color:#00AA00">left **G**</span>|<span style="background-color:#0000FF">right **B**</span>|<span style="background-color:#005500">right **g**</span>|<span style="background-color:#FF0000">right **R**</span>|<span style="background-color:#00AA00">right **G**</span>|

where **R**=red, **B**=blue, **G**=_high_ green (67%) and **g**=_low_ green (33%)

