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

From the point of view of the storage device filesystem, the Durango-X volume is represented by the `durango.av` file in the **root directory** of any FAT32-formatted device (valid with bootloader **v2.0** and beyond)

!!! warning

	Current _bootloader_ software (up to **v1.3**) does NOT check for any host filesystem, assuming the volume is **written from the _very first block_ of the device**. In Linux, a `dd` command is suitable for _raw_ writing the volume onto the storage device.

!!! danger

	The use of the `dd` command or any equivalent one is **very risky** as any _incorrect parameter_ may result in **data loss**. _Exert **extreme caution** when writing raw images!_

!!! tip

	Flashing the volume into the storage device _with the current bootloader software_ (up to v1.3) can be done in Linux like this:
	
	```dd if=path-to/durango.av of=/dev/_your-device_```
	
	_Take **extreme caution** when determining _`your-device`_, as any wrong choice will cause **data loss**_.

## Header format

Check the [ROM image](header.md) format for details.

