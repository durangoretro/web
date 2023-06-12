# minimOS file system

## Rationale

While a _ROM-based_ system like **Durango-X** may not depend on it, a **file system** for managing a _mass-storage device_ is always desirable. But a limited 8-bit system may struggle with the _large_ file systems found on today's storage devices. Thus, a **simplified file system** should be implemented.

The idea behind this is to simply add a **header** to _any_ "file" which creates, by simple _concatenation_, a **linked list**, easily sorted out by the _filesystem_ software by jumping between headers. _This very same principle has been used on the
[minimOS Operating System](https://github.com/zuiko21/minimOS) as a means to manage ROM contents_, but it's suitable for implementing a _barebones filesystem_ in mass-storage devices as well, especially Solid-State ones (like a readily available **SD card**).

## Durango-X volumes

Simply put, a **volume** is a _concatenation of files_, each of them preceded by a suitable _header_. Some **padding** must be applied _at the end_ of every file, in case its length is not a **512-byte multiple**, as required by most storage devices.

From the very first _sector_ (the leading 256 bytes would suffice) of a volume, any file can be accessed as all headers form a **linked list**; from the file's _size_ (conveniently rounded up to the nearest _512-byte multiple_) you may compute the **next file's sector number**, and so on. When this points to a _non-valid header_ (at least **three _magic_ numbers** must be checked), the volume has ended.

!!! note

	A **single file** (with the proper _header_) is suitable as a whole volume as well, as the sector following it is _(very)_ likely to contain garbage, and will thus fail the **header validation** procedure.

!!! warning

	In **very rare** circumstances, older device contents _after the volume's end_ may be recognised as a valid header; this shouldn't be a concern as the only ill effect would be the "recovery" of older files after the volume's contents; but in case of doubt, you may add a _fake sector_ suitably filled (`$FF` is convenient for most devices) after every volume, for extra safety.

!!! tip

	Concatenating files and ROM images can be easily done with the `cat` command, like the following example:
	```cat image1.dux image2.dux image3.dux > durango.av```

### Volume location

From the point of view of the storage device filesystem, the Durango-X volume is represented by the `durango.av` file in the **root directory** of any FAT-formatted device.

!!! warning

	Current _bootloader_ software does NOT check for any host filesystem, assuming the volume is **written from the very first block of the device**. In Linux, a `dd` command is suitable for _raw_ writing the volume onto the storage device.

!!! danger

	The use of the `dd` command or any equivalent one is **very risky** as any _incorrect parameter_ may result in **data loss**. _Exert **extreme caution** when writing raw images!_

!!! tip

	Flashing the volume into the storage device _with the current software_ can be done in Linux like this:
	```dd if=path-to/durango.av of=/dev/your-device```
	_Take **extreme caution** when determining `your-device`, as any wrong choice will cause **data loss**_.

## Header format

Much like the [ROM image](header.md) format, a simple 256-byte block must be provided _in front_ of any file in order to be properly identified and linked to other files on the volume.

|Offset|Size (bytes)|Contents      |Description|
|------|------------|--------------|-----------|
|0     |1           |$00           |Magic number #1 (`NUL`)|
|1     |2           |_see table below_|Signature|
|3     |4           |`****`        |_**Reserved**_|
|7     |1           |$0D           |Magic number #2 (`CR`)|
|8     |_n_         |_Filename_    |C-string with filename|
|8+_n_ |1           |$00           |`NUL`-termination for the above|
|9+_n_ |_m_         |_Comment_     |C-string with **optional** comment (_n_+_m_ ≤ **220** in current version)|
|9+_n_+_m_|1        |$00           |`NUL`-termination for the above (**mandatory:** if no comment is present, _two_ `NUL`s are expected after _filename_)|
|10+_n_+_m_|_220-n-m_|_usually_ $FF|_**padding**_|
|230 ($E6)|8        |_User Field 2_|**8-char** string, _free for the user_|
|238 ($EE)|8        |_User Field 1_|**8-char** string, _free for the user_|
|246 ($F6)|2        |_Version_ (if applies)|_Little-endian_ 16-bit `%vvvvrrrrppbbbbbb`, where `v` is version number, `r` revision, `b` build and `p` phase (`%00`=alpha, `%01`=beta, `%10`=Release Candidate, `%11`=final).|
|248 ($F8)|2        |_Time_        |Last modification time in [_FAT_ format](https://en.wikipedia.org/wiki/Design_of_the_FAT_file_system#Directory_entry)|
|250 ($FA)|2        |_Date_        |Last modification date in [_FAT_ format](https://en.wikipedia.org/wiki/Design_of_the_FAT_file_system#Directory_entry)|
|252 ($FC)|3        |**file size** |**Includes the 256-byte header**. _Cannot be over **16 MiB**_ in the current implementation; most likely _below 64 KiB_.|
|255 ($FF)|1		|$00           |Magic number #3 (`NUL`)|

### Signatures list

In order not to depend on _file extensions_, the minimOS file systems adds a non-mutable file signature which describes the **type of file** stored afterwards. _**Currently supported** signatures are shown in the table below:_

|Signature|Size|Type|
|---------|----|----|
|`dX`     |< 64 KiB|executable [ROM image](header.md)|
|`dA`     |< 16 MiB|generic file|
|`dL`     |≤ 16 MiB|**free space**|
|`dR`     |**8.5 KiB**|HIRES screen dump (256x256 1bpp)|
|`dS`     |**8.5 KiB**|Colour screen dump (128x128 [4bpp](../hardware/palette.md))|
|`dr`     |< 8.5 KiB|_RLE-compressed_ HIRES screen dump (256x256 1bpp)|
|`ds`     |< 8.5 KiB|_RLE-compressed_ Colour screen dump (128x128 [4bpp](../hardware/palette.md))|

!!! note

	_Uncompressed_ screen dumps include a **256-byte _empty_ leader**, in order to be _sector-aligned_.
