# Durango colour palette

The _Durango-X_ and _Durango-S_ colour computers have a **colour display mode** of 128 x 128 pixels. Using _4 bits per pixel_, it allows the
simultaneous use of **16 colours** on the screen. Unlike some old computers like the _ZX-Spectrum_, _Commodore 64_, _MSX_ etc
**there are no restrictions** about how many different colours may appear in a certain area.

## Palette colour list

|Decimal|Hex|Binary|Name   |HTML equivalent|
|-------|---|------|-------|---------------|
|0      |$0 |%0000 |Black  | \#000000      |
|1      |$1 |%0001 |Green  | <span style="background-color:#00aa00">\# 00AA00</span>      |
|2      |$2 |%0010 |Red    | \#FF0000      |
|3      |$3 |%0011 |Orange | \#FFAA00      |
|4      |$4 |%0100 |Dark green| \#005500   |
|5      |$5 |%0101 |Lime   | \#00FF00      |
|6      |$6 |%0110 |Brick  | \#FF5500      |
|7      |$7 |%0111 |Yellow | \#FFFF00      |
|8      |$8 |%1000 |Blue   | \#0000FF      |
|9      |$9 |%1001 |Sky    | \#00AAFF      |
|10     |$A |%1010 |Magenta| \#FF00FF      |
|11     |$B |%1011 |Pink   | \#FFAAFF      |
|12     |$C |%1100 |Azur   | \#0055FF      |
|13     |$D |%1101 |Cyan   | \#00FFFF      |
|14     |$E |%1110 |Fuchsia| \#FF55FF      |
|15     |$F |%1111 |White  | \#FFFFFF      |

## Display format

In all video modes, Durango-X uses a **linear framebuffer**. Its dimensions being _powers of 2_, any screen position is easily computed into
the corresponding memory address.

### Colour mode

Display memory follows the **"chunky"** model -- all bits defining a pixel are packed together into the same byte. At 4 bpp, _two pixels are
encoded on every byte_:

|128|64|32|16|8|4|2|1|
|---|--|--|--|-|-|-|-|
|left B|left g|left R|left G|right B|right g|right R|right G|

where **R**=red, **B**=blue, **G**=_high_ green (67%) and **g**=_low_ green (33%)

