# _Durango-X_ specific EhBASIC commands

[**EhBASIC** from the late Lee Davidson](http://forum.6502.org/viewforum.php?f=5) is intended as a generic, _console-type_ BASIC interpreter for 6502 systems.
In order to support _Durango-X_'s **graphic, colour and sound** capabilities, new commands have been added.

## CONIO interface

The standalone EhBASIC interpreter for Durango-X is supplied with a suitable minimal _firmware_, mostly around the `CONIO` function as supplied in
[the minimOS Operating System](https://github.com/zuiko21/minimOS/tree/master/OS). There is similar CONIO support in
[DurangoLib](https://github.com/durangoretro/DurangoLib/blob/main/asm/conio.s) C library.

`CONIO` acts as a **terminal emulator**; for easier parsing, most _control codes_ are **single-byte**, thus the [standard CONIO features](conio.md) are accessible
thru a mixture of **traditional ASCII, `bash` shortcut keys and ZX-Spectrum codes**. _All of them are accessible via standard `PRINT CHR$()` BASIC sentences_, but
a few of them have beed granted new BASIC commands for convenience:

### `CLS`

Clears the screen. _If an alternative screen is on display, will set that as the current output screen_.

Equivalent to `PRINT CHR$(12);`

### `LOCATE c, r`

Moves the printing position to column `c` and row `r`; acceptable values are 0...15 in colour mode, and 0...31 in HIRES.

Equivalent to `PRINT CHR$(23);CHR$(32+r);CHR$(32+c);`

### `INK i`

Sets foreground ("ink") colour to `i`; values go thru `MOD 16` to become **0...15**, as per the [standard Durango-X palette](). _In HIRES mode, colours are internally set
but NOT displayed in any way until back into colour mode_.

Equivalent to `PRINT CHR$(18);CHR$(32+i);`

### `PAPER p`

Sets background ("paper") colour to `p`; values go thru `MOD 16` to become **0...15**, as per the [standard Durango-X palette](). _In HIRES mode, colours are internally set
but NOT displayed in any way until back into colour mode_.

Equivalent to `PRINT CHR$(20);CHR$(32+i);`

### `CURSOR n`

Enables (for any non-zero `n`) or disables (when `n` is zero) the cursor.

Equivalent to `PRINT CHR$(19);` (enable) and `PRINT CHR$(21);` (disable)

## Sound and other time-related commands

### `BEEP d,p`

Plays a note of pitch `p` (integer value 0...42, chromatic scale from F3 to B6) for `d`/50 seconds.

In case a similar sentence is found on a _ZX-Spectrum_ programme, it must be rewritten in Durango-X EhBASIC as `BEEP d*50,p+7`

### `PAUSE n`

Waits for `n` _IRQ system interrupts_ to happen, or until any key is pressed. _Current version is limited to 255, thus a little more than a second wait_.
If `n` is zero, it waits for any key to be pressed, without any time limit.

In case a similar sentence is found on a _ZX-Spectrum_ programme, it must be rewritten in Durango-X EhBASIC as `PAUSE n*5`

## Video modes

## Graphic commands

These commands are inspired by those on the _ZX-Spectrum_, but instead of the set foreground colour, they all rely on an extra parameter for colour.
_There is no "attribute area" in Durango-X_, thus any pixel is **completely independent** of its neighbours.

Unlike the ZX-Spectrum, though, the _origin of coordinates_ is at **top left** of the screen.

### `PLOT x,y,c`

Draws a **pixel** of colour `c` (from the [standard Durango-X palette]()) on screen coordinates `x,y`; acceptable values are 0...127 in colour mode,
and 0...255 in HIRES (this mode will also do `c MOD 2`, thus only _odd_ colour values will display the pixel, otherwise is _cleared_).

### `LINE x1,y1,x2,y2,c`

Draws a **line** of colour `c` (from the [standard Durango-X palette]()) from screen coordinates `x1,y1` to `x2,y2`; the usual restrictions apply.

### `CIRCLE x,y,r,c`

Draws a **circle** of colour `c` (from the [standard Durango-X palette]()) and radius `r` centered at screen coordinates `x,y`; besides the usual restrictions,
the whole circle **must** fit inside the screen, otherwise a `Illegal Function Call` error is generated.

### `RECT x1,y1,x2,y2,c`

_This is **NOT working** on the current version_. Intended to draw a filled rectangle, the command will be accepted (and its parameters checked!) but
nothing will be drawn on screen.

