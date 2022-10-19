# VeraCruz
 A quantum leap above the 8-bit, 6502-based Durango home computers. The use of the advanced 65C816 CPU will allow full compatibility of well-behaved minimOS applications, but also the availability of a much larger address space and higher speed (especially with 16-bit math).

The ultimate goal is to reach the 3M benchmark (1 MiB of memory, 1 Mpixel on screen, 1 MIPS). The current Veracruz model lacks only the "second M", topping at ~0.25 Mpixel (512x512). 


* **Veracruz**: the entry-level 5 MHz 65C816 workstation
* **SIXtation·P**: ~7 MHz portrait display workstation[^1]
* **Jalisco**: 9 MHz 65C816 workstation with 1360 x 768 px. colour display[^2]
* **Tabasco**: Top of the range 13.5 MHz 65C816 workstation with high resolution colour display[^2]

!!! info
    This Project is under construction; is only in design and definition stage and is not ready yet.

## Veracruz Basic Specs

* CPU: 65C816 @ 5 MHz
* ROM: 32 KiB built in firmware plus extended cartridge slot up to 1 MiB
* RAM: 256 KiB, expandable to 1 MiB
* Use of some dedicated chips (65C22 VIAs, 6445 CRTC, PLDs...) for reduced chip count
* Video output: via SVGA monitor
* Other ports to be determined

## Video Modes

Video Modes: (to be determined)

* 256 x 256 px. 4 bpp (16-colour GRgB fixed palette, no restrictions)
* 512 x 512 px. 1 bpp (monochrome)
* 128 x 256 px. 8 bpp (256-colour fixed palette) (under development)
* Inverse Video mode (hardware)
* 128 x 128 px. 4 bpp (16-colour GRgB fixed palette, for Durango compatibility) (under development)
* Two 32 KiB screens software-switchable


[^1]: Full specs to be determined
[^2]: Name and full specs to be determined
