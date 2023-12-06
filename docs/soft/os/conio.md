[Home](../../index.md) > [Software](../../software.md) > [Operating Systems](../os.md) > BIOS/BDOS > **CONIO**
___
# The CONIO terminal emulator

Although the **Durango-X** computer is intended to use _ad hoc_ software in standalone cartridges, without the need
for any [underlying OS](https://github.com/zuiko21/minimOS), the availability of a **console-type I/O** is
always welcome, allowing easy _text display_ and _keyboard interaction_.

## _Firmware_ Requeriments

As a _firmware module_, `CONIO` (**CON**sole **I**nput/**O**utput) needs some basic support to operate:

* The `CONIO` code itself.
* An **8x8 _bitmap_ font** (usually included, but can be switched)
* A **keyboard driver** (one for the standard _5x8 matrix_ keyboard is supplied but, if not detected, paralell input at `$DF9A` is supported.
* A minimal **interrupt handler** which, besides any application-specific needs, should increment the `ticks` counter and call the _keyboard scanning_ routine.
* Basic **initialisation** for all of the above.

You can check an example of the software package installation for CONIO support on the
[_standalone_ version of EhBASIC](https://github.com/zuiko21/minimOS/blob/master/forge/eh_basic/ehbasic_sa.s)
from address `$E000` on the binary file (label name: `reset`).

## Supported features

**CONIO** supports both **HIRES** and **colour** modes, displaying **32 x 32 or 16 x 16 characters** respectively.
_All four screen areas are supoported_ and, in case of the first area (`$0000-$1FFF`) where _zeropage & stack_ reside,
it's automatically **limited to the bottom half of the screen** to protect the important system variables.

Being a _bitmap-only_ display, **alternative fonts** are supported; just change a pointer to a
_2 KiB font definition_ of your choice (256 chars of 8x8 pixels).

!!! note

	These features have **no support from the CONIO _interface_**, and will need to _manually_ set some **memory addresses**
	and/or **hardware registers**.

## Character set

`CONIO` makes use of a slightly custom variant of [**ISO/IEC 8859-1**](https://en.wikipedia.org/wiki/ISO/IEC_8859-1)
for convenience and localisation reasons. _C1 control codes_, **undefined** on the standard, are used by:

*	The **Sinclair ZX Spectrum _semi-graphic_** characters (128-143, `$80-$8F`)
*	_Selected Greek for Maths_ based on $E0-$EF of **code page 437** (144-159, `$90-$9F`) but including **check mark**, **approximation** and **_non-strict_
inequalities**.

Other differences:

* _Non-Breaking space_ (160, `$A0`) is replaced by a **hollow square/rectangle** (code 128/`$80` _Spectrum graphic_ might be used as a substitute)
* _Currency symbol_ (164, `$A4`) is replaced by the **Euro sign** from ISO 8859-15.
* _Soft hyphen_ (173, `$AD`) is replaced by the (seldom found on single-byte encodings!) **slashed equal**.
* _Cedilla_ (184, `$B8`) is replaced by **lowercase omega**. _This encoding is already used on some HD44780-based LCD text displays_.
* _Superscript 1_ (185, `$B9`) is replaced by **uppercase delta**.
* _Fractions_ (188-190, `$BC-$BE`) are replaced by the **bullet** character, the _lowercase **oe** ligature_ and the **eng** character.

_Codes 191 (`$BF`) and beyond_ are the **same as ISO 8859-1** -- and also like _Windows-1252_, for that matter.

### extended-ASCII character table

mOS|$x0|$x1|$x2|$x3|$x4|$x5|$x6|$x7|$x8|$x9|$xA|$xB|$xC|$xD|$xE|$xF
---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---
**$8x**| |&#9629;|&#9624;|&#9600;|&#9623;|&#9616;|&#9626;|&#9628;|&#9622;|&#9630;|&#9612;|&#9627;|&#9604;|&#9631;|&#9625;|&#9608;
**$9x**|&#945;|&#10003;|&#915;|&#960;|&#931;|&#963;|&#8804;|&#964;|&#8805;|&#1012;|&#937;|&#948;|&#8734;|&#8776;|&#8712;|&#8745;
**$Ax**|&#9633;|¡|&#162;|£|€|&#165;|&#166;|&#167;|&#168;|&#169;|&#170;|&#171;|&#172;|&#8800;|&#174;|&#175;
**$Bx**|°|&#177;|&#178;|&#179;|&#180;|&#181;|&#182;|&#183;|&#969;|&#916;|&#186;|&#187;|&#8226;|&#339;|&#331;|¿
**$Cx**|À|Á|Â|Ã|Ä|Å|Æ|Ç|È|É|Ê|Ë|Ì|Í|Î|Ï
**$Dx**|Đ|Ñ|Ò|Ó|Ô|Õ|Ö|×|Ø|Ù|Ú|Û|Ü|Ý|&#222;|&#223;
**$Ex**|à|á|â|ã|ä|å|æ|ç|è|é|ê|ë|ì|í|î|ï
**$Fx**|ð|ñ|ò|ó|ô|õ|ö|÷|ø|ù|ú|û|ü|ý|&#254;|&#255;

## _C0_ Control characters

Usually **single-byte** sequences for _efficiency_. Most of _bash_ key shortcuts are implemented here, while a few other are just **traditional ASCII**.
A notable difference is the use of **plain `CR` as _newline_**, unlike the common UNIX (`LF`) and DOS/Windows (`CR` plus `LF`) alternatives.

Some other changes are the **cursor up/down** (made from `VT` and `LF`), the _CR-without-LF_ (used as `HOML`, line home) and the `XON`/`XOFF`,
which make little sense on a _glass tty_ but are used instead to **enable/disable the cursor**.

**Colour commands**, on the other hand, are generated in a similar way to the _ZX Spectrum_ although with different codes (18 for `INK`, 20 for `PAPER`).

!!! note

	When required, the normally _hidden_ **glyph** is obtained by preceeding the code with a `DLE` (16/`$10`).

|Ctl-key|Dec|Hex|ASCII|name|glyph & description|effect|
|-------|---|---|-----|----|-------------------|------|
|-|0|`$00`|`NUL`|**`SWTC`**|&#9635; square with block|(1)|
|A|1|`$01`|`SOH`|**`CRTN`**|&#8606; double arrow left|carriage return (without line feed)|
|B|2|`$02`|`STX`|**`LEFT`**|&#8678; arrow left|cursor left (no backspace)|
|C|3|`$03`|`ETX`|**`TERM`**|&#9211; ball switch|send TERM signal(7)/BREAK key (6)|
|D|4|`$04`|`EOT`|**`ENDT`**|&#8690; arrow to SE corner|(7)|
|E|5|`$05`|`ENQ`|**`ENDL`**|&#8608; double arrow right|move cursor to end of line (7)|
|F|6|`$06`|`ACK`|**`RGHT`**|&#8680; arrow right|cursor right (no space)|
|G|7|`$07`|`BEL`|**`BELL`**|&#128276; bell|acoustic alert|
|H|8|`$08`|`BS`|**`BKSP`**|&#9003; left sign with x|backspace, clear previous character|
|I|9|`$09`|`HT`|**`HTAB`**|&#8677; right arrow with bar|advance to next tab, printing spaces|
|J|10|`$0A`|`LF`|**`DOWN`**|&#8681; arrow down|cursor down (no CR)|
|K|11|`$0B`|`VT`|**`UPCU`**|&#8679; arrow up|cursor up one line|
|L|12|`$0C`|`FF`|**`CLRS`**|&#73668; paper sheet|clear screen (2)|
|M|13|`$0D`|`CR`|**`NEWL`**|&#9166; angled arrow|newline, _ZX Spectrum-like_|
|N|14|`$0E`|`SO`|**`EON`**|&#8658; imply|emphasis (inverse) on|
|O|15|`$0F`|`SI`|**`EOFF`**|&#8656; reverse imply|emphasis (inverse) off|
|P|16|`$10`|`DLE`|**`DLE`**|&#9829; heart suit|show glyph for next char, do not interpret it (3)|
|Q|17|`$11`|`DC1`|**`XON`**|&#9733; star|cursor on|
|R|18|`$12`|`DC2`|**`INK`**|&#9999; pencil|set foreground colour (3)(4)|
|S|19|`$13`|`DC3`|**`XOFF`**|&#9830; diamond suit|cursor off|
|T|20|`$14`|`DC4`|**`PAPR`**|&#9827; club suit|set background colour (3)(4)|
|U|21|`$15`|`NAK`|**`HOME`**|&#8689; arrow to NW corner|reset cursor without clearing screen|
|V|22|`$16`|`SYN`|**`PGDN`**|&#8609; double arrow down|page down (7)|
|W|23|`$17`|`ETB`|**`ATYX`**|&#9824; spade suit|set cursor position (5)|
|X|24|`$18`|`CAN`|**`BKTB`**|&#8676; left arrow with bar|backwards tabulation (7)|
|Y|25|`$19`|`EM`|**`PGUP`**|&#8607; double arrow up|page up (7)|
|Z|26|`$1A`|`SUB`|**`STOP`**|&#9940; no entry|send STOP signal (7)|
|-|27|`$1B`|`ESC`|**`ESC`**|&#11017; NW arrow/mouse cursor|escape (7)|
|-|28|`$1C`|`FS`|**`PLOT`**|&#9698; wedge pointing SE|(7)|
|-|29|`$1D`|`GS`|**`DRAW`**|&#9699; wedge pointing SW|(7)|
|-|30|`$1E`|`RS`|**`INCG`**|&#9618; light pattern|(7)|
|-|31|`$1F`|`US`|**`TXTM`**|&#9619; mid pattern|(7)|
|-|127|`$7F`|`DEL`|**`DEL`**|&#8999; square with x|delete (7)|

### Notes:

1.If sent to `CONIO`, will issue an _input_.

2.If sent to `CONIO`, will **reset** the standard device.

3.Takes a second character to complete.

4.Currently only low nibble used as `BgRG` or `B1 G0 R1 G1` -- official values are **32...47**, thus always _printable_.

5.Takes another TWO chars, _ASCII 32_ and up, stating row & column (home is `0,0` or ASCII 32,32).

6._Read_ value from keyboard.

7.Not yet implemented.
