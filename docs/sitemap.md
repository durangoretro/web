# Site Map

This is a **general index** of the _whole [**DurangoRetro.com**](index.md) website_. Most important pages can be accessed via the _Navigation menu_ at the top, as well.

## [Home](index.md)

## [About](about.md)

1. **Overview**

1. **Durango Computer Team**

## [FAQ](faq.md)

## [Getting Started](started.md)

1. [**Running _Durango_ Software**](start/running.md)
	1. [On actual hardware](start/run/hard.md)
		1. ROM Cartridges
		1. ROM images on SD card
		1. _Pocket_ executables on SD card
		1. _Pocket_ executables from Raspberry Pi
	1. [Emulation](start/run/emulation.md)
    	1. _Perdita_
        1. MAME support

1. [**Building the _Durango·X_ computer**](start/building.md)
	1. [PCB manufacturing](start/build/pcb.md)
	1. [Assembly guide **(computer)**](start/build/durango.md)
		1. [Building options](start/build/computer/options.md)
		1. [BOM](start/build/computer/bom.md)
		1. [Step by step](start/build/computer/steps.md)
		1. [Troubleshooting](start/build/computer/troubleshoot.md)
	1. [Assembly guide **(keyboard/gamepads interface)**](start/build/keyboard.md)
		1. [Building options](start/build/kbd/options.md)
		1. [BOM](start/build/kbd/bom.md)
		1. [Step by step](start/build/kbd/steps.md)
	1. [Assembly guide **(cartridge)**](start/build/cartridge.md)
		1. [Building options](start/build/cart/options.md)
		1. [BOM](start/build/cart/bom.md)
		1. [Step by step](start/build/cart/steps.md)

## [Hardware](hardware.md)

1. [**Precursors**](hard/previous.md)
	1. _Baja_
	1. _SDd / Chihuahua_
	1. Durango-*PROTO*
    1. Abandoned projects

1. [**The _Durango_ architecture**](hard/arch.md)
	1. Range
	1. [**Durango·X** SBC](hard/durango.md)
		1. Overview
		1. Specs and options
    		1. v1
    		1. Improvements for v2
    		1. [Options](hard/dx/options.md)
        1. [Theory of Operation](hard/dx/theory.md)
    	1. _Hacks_
    		1. Overclocking
        	1. _**Power**Durango_
    1. [Cartridges](hard/cartridges.md)
    	1. [mini-cartridge](hard/cart/mini.md)
    	1. [_devCart_](hard/cart/dev.md)
			1. Overview
    		1. _ShadowRAM_
        1. [Bankswitching](hard/cart/banks.md)
        	1. 128K-1M
        	1. multi-cartridge
        1. [Riser boards](hard/cart/riser.md)
        	1. Programmable Sound Generator
        	1. Breakout board
    	1. _Veracruz_ cartridge format
	1. [Peripherals and interfaces](hard/interfaces.md)
		1. _nanoLink_
    	1. [_IOx_ bus](hard/bus/iox.md)
    		1. Pinout
        	1. Assigned addresses
        1. [Keyboard & Gamepads](hard/keyboard.md)
        	1. [Layout & Matrix](hard/kbd/layout.md)
        	1. [NES version](hard/kbd/nes.md)
        	1. [Megadrive / Genesis / Atari VCS version](hard/kbd/md.md)
        	1. [Extended keyboard](hard/kbd/ext.md)
        1. [Other _IOx_ peripherals](hard/bus/periph.md)
        	1. _nanoLink_ output
            1. _FastSPI_ & I<sup>2</sup>C
            1. _PASK_
            1. GPIO
        1. [Sidecar devices](hard/bus/sidecar.md)
        	1. Overview
        	1. SD + RTC
	1. [Accesories](hard/acc.md)
		1. Keyboard overlay
		1. Component video output
    	1. _**Power**Durango_ adapter
    
1. [**Future projects**](hard/future.md)
	1. Durango _Pocket_
 	1. _Durango·C_
  	1. _Veracruz_
	1. _SIXtation_

## [Software](software.md)

1. [**Games Library**](soft/games.md)
1. [**Utility Software**](soft/utils.md)
	1. Languages
	1. Test suites
	1. Other utilities

1. [**Operating Systems**](soft/os.md)
	1. BIOS/BDOS library
	1. _minimOS_
	1. DOS/65

1. [**File format**](soft/filesys.md)
	1. [ROM images](soft/sys/rom.md)
		1. Standard header
		1. ROM footer
 	1. [Other files](soft/sys/files.md)
		1. Standard header
		1. Signatures list
		1. _Pocket_ executables
  	1. Durango volumes

## [Development & Tools](tools.md)

1. [**Languages**](dev/language.md)
	1. Assembly
	1. BASIC
		1. [EhBASIC](dev/lang/ehbasic.md)
		1. BBC BASIC
		1. GfA BASIC
	1. _C_
		1. CC65
    	1. [_DurangoLib_](dev/lang/durangolib.md)

1. [**Tools**](dev/tools.md)
	1. Rescomp
	1. Durango Imager
    	1. [GUI Utility](dev/tool/gui.md)
        1. [CLI tools](dev/tool/cli.md)
    1. DurangoCode
    1. Docker
    1. [_nanoBoot_ server](dev/tool/nanoboot.md)

1. [**_In situ_ tools**](dev/insitu.md)
	1. [_nanoMon_](dev/6502/nanomon.md)
 	1. [_miniMoDA_](dev/6502/minimoda.md)
	1. [_nanoBoot_](dev/6502/nanoboot.md)
	1. [_multiBoot_](dev/6502/multiboot.md)
		1. Overview
		1. Supported formats
		1. _Pocket_ firmware support
			1. BIOS
			1. BDOS
			1. Perdita _Pocket_ support

## [Community](community.md)

1. **GitHub**

1. **Discord**
