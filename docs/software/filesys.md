# minimOS file system

## Rationale

The idea behind this is to simply add a [**standard header**](header.md) to _any_ "file" which creates, by simple _concatenation_, a
**linked list**, easily sorted out by the _filesystem_ software by jumping between headers. _This very same principle has been used on the
[minimOS Operating System](https://github.com/zuiko21/minimOS) as a means to manage ROM contents_, but it's suitable for implementing a _barebones filesystem_ in mass-storage devices as well, especially Solid-State ones (like a readily available **SD card**).

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
|246 ($F6)|2        |_Version_     |_Little-endian_ 16-bit `%vvvvrrrrppbbbbbb`, where `v` is version number, `r` revision, `b` build and `p` phase (`%00`=alpha, `%01`=beta, `%10`=Release Candidate, `%11`=final), **if applies**.|
|248 ($F8)|2        |_Time_        |Last modification time in [_FAT_ format](https://en.wikipedia.org/wiki/Design_of_the_FAT_file_system#Directory_entry)|
|250 ($FA)|2        |_Date_        |Last modification date in [_FAT_ format](https://en.wikipedia.org/wiki/Design_of_the_FAT_file_system#Directory_entry)|
|252 ($FC)|3        |**file size** |Includes the 256-byte header. _Cannot be over **16 MiB**_ in the current implementation; most likely _below 64 KiB_.|
|255 ($FF)|1		|$00           |Magic number #3 (`NUL`)|

### Signatures list

In order not to depend on _file extensions_, the minimOS file systems adds a non-mutable file signature which describes the **type of file** stored afterwards. _**Currently supported** signatures are shown in the table below:_

|Signature|Max. size|Type|
|---------|---------|----|
|`dX`     |< 64 KiB |executable [ROM image](header.md)|
|`dA`     |< 16 MiB |generic file|
|`dL`     |≤ 16 MiB |**free space**|
|`dR`     |**8 KiB**|HIRES screen dump (256x256 1bpp)|
|`dS`     |**8 KiB**|Colour screen dump (128x128 [4bpp](../hardware/palette.md))|
