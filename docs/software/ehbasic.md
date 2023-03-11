# _Durango-X_ specific EhBASIC commands

[**EhBASIC** from the late Lee Davidson](http://forum.6502.org/viewforum.php?f=5) is intended as a generic, _console-type_ BASIC interpreter. In order to support
_Durango-X_'s **graphic, colour and sound** capabilities, new commands have been added.

## CONIO interface

The standalone EhBASIC interpreter for Durango-X is supplied with a suitable minimal _firmware_, mostly around the `CONIO` function as supplied in
[the minimOS Operating System](https://github.com/zuiko21/minimOS/tree/master/OS). There is similar CONIO support in
[DurangoLib](https://github.com/durangoretro/DurangoLib/blob/main/asm/conio.s) C library.

`CONIO` acts as a **terminal emulator**; for easier parsing, most _control codes_ are **single-byte**, thus the [standard CONIO features](conio.md) are accessible
thru a mixture of **traditional ASCII, `bash` shortcut keys and ZX-Spectrum codes**. _All of them are accessible via standard `PRINT CHR$()` BASIC sentences_, but
a few of them have beed granted nre BASIC commands for convenience:

### `CLS`

Clears the screen. _If an alternative screen is on display, will set that as the current output screen_.

Equivalent to `PRINT CHR$(12);`

### `LOCATE c,r`

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

