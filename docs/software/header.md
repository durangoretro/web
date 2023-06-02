# Standard file header

## Rationale

Although **Durango-X** is a _ROM-based_ computer, thus not depending on a proper filesystem, the use of a **mass-storage device** with _ROM image files_
instead of "blowing" and switching physical (E)EPROMs is certainly convenient. Having into account the limitations of an 8-bit computer, especially when
dealing with _huge_ modern storage devices, a fully-featured filesystem implemented on the 6502 side would be pretty cumbersome; thus, an **intermediate
solution** is proposed.

The idea behind this is to simply add a **standard header** to _any_ ROM image (like any individual "file") which creates, by simple _concatenation_, a
**linked list** of ROM images, easily sorted out by the Durango-X computer thru jumping between headers. _This very same principle has been used on the
[minimOS Operating System](https://github.com/zuiko21/minimOS) as a means to manage ROM contents_, but does apply to mass-storage devices as well,
especially Solid-State ones (like a readily available **SD card**).

!!! tip

	This kind of [file system](filesys.md) has been already implemented for use with the [SD card interface on the Development Cartridge](../hardware/dev_cart.md), and it's available for source code storage with [EhBASIC](ehbasic.md)

This header will provide adequate **metadata**, with some room for expansion. By the way, even if the desired software is going to live on an EPROM
permanently and never downloaded from SD, it _does not harm to have the **Standard Header** all the time_, if you have 256 spare bytes for it.

## Hardware support

The **Durango-X [Development Cartridge](../hardware/dev_cart.md)** provides a convenient way to upload and run software on the Durango-X computer. It provides an extra **32 KiB RAM**
switchable with the standard ROM, plus an inexpensive **SD-card interface**. While standard ROMs (up to 16 KiB) can be placed on this cartridge for regular
use, with a suitable [**bootloader firmware**](multiboot.md) it allows _choosing_ whithin the ROM images stored in the card, _downloading_ any of them in a matter of seconds,
and _running_ the selected software flawlessly -- as the Development Cartridge may _lock_ its RAM after downloading, making it **read-only** just like a
regular ROM.

## ROM images

The use of a [standardised format for ROM images](filesys.md) allows the use of both **EPROM _blowers_** and convenient [download from **SD card** or **Raspberry Pi**](multiboot.md) from the very same binary.

Just like any other 6502 system, ROMs for Durango-X must have appropriate `NMI/RESET/IRQ` hardware vectors at the last addresses `$FFFA-$FFFF`. However, in order to be fully compliant, a suitable **header** plus some extra information at the end must be provided, according to this document.

!!! note

	In order to be fully compliant with all devices, all ROM images must have a **512-byte multiple** size, _including all headers and footers_.

### Header format

A simple 256-byte block must be provided _in front_ of any ROM image in order to be properly identified and linked to other images on the device.

|Offset|Size (bytes)|Contents      |Description|
|------|------------|--------------|-----------|
|0     |1           |$00           |Magic number #1 (`NUL`)|
|1     |2           |`dX`          |Signature (`dX`=Standard Durango-X ROM-image)|
|3     |4           |`****`        |_**Reserved**_|
|7     |1           |$0D           |Magic number #2 (`CR`)|
|8     |_n_         |_Filename_    |C-string with filename|
|8+_n_ |1           |$00           |`NUL`-termination for the above|
|9+_n_ |_m_         |_Comment_     |C-string with **optional** comment (_n_+_m_ ≤ **220** in current version)|
|9+_n_+_m_|1        |$00           |`NUL`-termination for the above (**mandatory:** if no comment is present, _two_ `NUL`s are expected after _filename_)|
|10+_n_+_m_|_220-n-m_|_usually_ $FF|_**padding**_|
|230 ($E6)|8        |_User Field 2_|**8-char** string, usually library commit hash|
|238 ($EE)|8        |_User Field 1_|**8-char** string, usually main code commit hash|
|246 ($F6)|2        |_Version_     |_Little-endian_ 16-bit `%vvvvrrrrppbbbbbb`, where `v` is version number, `r` revision, `b` build and `p` phase (`%00`=alpha, `%01`=beta, `%10`=Release Candidate, `%11`=final)|
|248 ($F8)|2        |_Time_        |Last modification time in [_FAT_ format](https://en.wikipedia.org/wiki/Design_of_the_FAT_file_system#Directory_entry)|
|250 ($FA)|2        |_Date_        |Last modification date in [_FAT_ format](https://en.wikipedia.org/wiki/Design_of_the_FAT_file_system#Directory_entry)|
|252 ($FC)|4        |**file size** |Includes the 256-byte header. _Unlikely to be over 64 KiB, the last two bytes may be used as **Magic numbers** as well ($00)._

!!! note

	**additional _metadata_** may be included just before the _user field 2_ (offset < 230), as long as a _tighter_ limit is set to _filename+comment_ total length.

### Footer format

In order to be fully compliant with the [Development Cartridge](../hardware/dev_cart.md), some extra content must be provided at the end of the ROM image. More often than not, the actual code from any ROM will end _before_ the standard `$FFFA` vectors initial address. We need to reserve **the last 42 bytes** for compliance, just as shown in the following example:

```
; (actual ROM code above)
	.dsb  $FFD6 - *, $FF    ; padding to reserved area
	.asc  "DmOS"            ; Durango-X ROM signature
	.dsb  $FFE1 - *, $FF    ; padding to Development Cartridge interface
	JMP ($FFFC)             ; jump to (downloaded) RESET vector

	.dsb  $FFFA - *, $FF    ; standard padding
	.word nmi               ; standard 6502 hard vectors for the supplied ROM
	.word reset
	.word irq
```

!!! note

	While not absolutely necessary, it is **higly recommended** that the interrupt _hard_ vectors point to `JMP ($0200)` (for **IRQ**) and `JMP($0202)` (for **NMI**), for ease of _integration with debuggers_.

## Using ROM images

ROM images compliant with the aforementioned format are suitable for _ROM chips_, **downloadable files** stored in a _Raspberry Pi_ server, or even joined into a [**Durango-X _volume_**](filesys.md). Check the following link for [more information about getting these running in Durango-X](multiboot.md)
