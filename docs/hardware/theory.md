# Theory of Operation

This document explains the way **Durango-X** is designed. Since one of its goals is the use of _standard 74xx logic circuits_, the [schematic]([https://](https://github.com/zuiko21/minimOS/tree/master/hard/kicad/durango/full)) may appear pretty complex at first sight, but it's easily understood with the help of this guide.

This is also a good complement to the [Troubleshooting guide](../troubleshoot.md).

## Block Diagram

Unlike many Single Board retro-Computers, **Durango-X**'s main feature is the **_built-in_ video output**. This is achieved by _multiplexing_ the RAM's address bus between the CPU and the video address generation circuit, for **optimum performance** -- no _wait states_ nor _snow_ during screen accesses!

Here's a _simplified_ **Block Diagram** showing Durango-X's major blocks and most of its interconnections:
<figure markdown>
![Durango-X block diagram](../assets/img/durango_arch.png)
<figcaption>Simplified Block Diagram of the Durango-X computer</figcaption>
</figure>

## Circuit description

!!! note

	Details on this description apply to _Durango-X_ **revision v1**. Changes included in the new _v2_ revision will be noted; otherwise, it's all the same.

According to a _modular approach_ as suggested by [EmilioLB](http://emiliollbb.net/), several big blocks can be isolated:

* **Clocks:** generation of both _video_ and _CPU_ clock signals, as they're **fully synchronised** for optimum performance.
* **VDU:** picks video data from SRAM and sends it to the monitor thru some analogue circuitry.
* **SCART:** the actual analogue circutry for sending the video output.
* **CPU:** the **brains** of the machine. Includes _interrupt_ generation.
* **MUX:** the RAM needs to be _multiplexed_ between the CPU and the video circuitry.
* **Base I/O:** basic on-board devices.
* **Extra features:** not indispensable, but useful anyway.
* **Interface:** external devices and connections.

### Clocks

<figure markdown>
![Clocks circuit](../assets/img/clocks.png)
<figcaption>Clock circuit (and video address generation) on Durango-X</figcaption>
</figure>

For **optimum performance**, the 24.576 MHz _master clock_ **X1** is used to generate both _video addresses_ and **system clock**, in perfect sync -- the later originally called `SCLK` but shown in most schematics as `VCLK`, since it's the same for both parts. Both sections run at **1.536 MHz**, from a **divide-by-16 _prescaler_** included into **U15** (74HC4040), then inverted via **U16** (74HC02) for adequate phase against other high frequency signals (mainly used for the _HIRES_ video mode).

`SCLK` is further divided thru the remaining stages of **U15**, together with the AND gate **U17** (74HC21) configured as a **divide-by-98** counter reset by the `LEND` signal. Thus, the _horizontal sync frequency_ is generated, albeit at a **_slightly non-standard_ 15673 Hz**, which is near enough to the CCIR standard 15625 Hz. From these 98 clock cycles, **the first 64 cycles** define the _active region_ of each scanline as the `/LINE` signal (directly from U15's `Q10` output), when the remaining U15's `Q4` to `Q9` outputs act as the **video address lines `VA0` to `VA5`**. That `/LINE` signal is used as the clock signal of the _line counter_ **U19** (another 74HC4040).

About the aforementioned **line counter**, since a proper computer TV display output must be **non-interlaced**, **U19** together with the other AND gate in U17 is configured as a **divide-by-312** counter, which leads to a slight _vertical frequency_ increase, as was common in most home computers. This counter emits the remaining **video address lines `VA6` to `VA13`** from its `Q0` to `Q7` outputs. Accordingly, `Q8` generates the `/FRAME` signal in a similar way to `/LINE`, thus marking the **256 active rasters** period.

!!! note

	Not all video address lines are used _simultaneously_. Depending on the active **video mode**, the needed 74HC257 multiplexers are enabled (either `U104/U105` or `U204/U205`), plus the common-to-all-modes **`U6` and `U7`** (74HC157).

A proper **_horizontal_ sync pulse** must be generated within the 34 inactive clock cycles per raster. This pulse has a width of **8 clock cycles** or **~5.2 µs**, pretty close to the specified 4.7 µs, easily achieved by using the `Q7-Q10` outputs from U15 into a **_4-bit magnitude comparator_ U18** (74HC85) aginst a fixed number 9, so the sync pulse (`UHS`, active-high) will be sent while the count values are **between 72 and 79**, as 9 x 8 = 72. _This results in a slightly off-centre image to the right_, but good enough for most (if not all) monitors.

A minor drawback of this simple approach is the inversion of the horizontal pulse during the _vertical sync_, as both signals get combined into `CSYNC` thru an EXOR gate **U23** (74HC86), which may cause _some instability_ for some displays. Since most TVs do actually sync on the _high-to-low_ sync flange, the remedy for this is quite simple: _during vertical sync, generate the `UHS` pulse **8 clock cycles earlier**_ (count 64 to 71), simply by applying the _inverted_ `/VS` signal to the U18 comparator, in order to check whether the aforementioned video address bits stay at 8 during this stage.

About the **_vertical_ sync pulse**, it is generated in a similar way within the **56 inactive rasters**. This pulse has a width of **4 rasters** or **~256 µs**, acceptably close to the specified 160 µs, once again achieved by using the `Q2-Q5` outputs from U19 into another **_4-bit magnitude comparator_ U20** (74HC85) aginst a fixed number 8, but _only enabled while `/FRAME` is **high**_ (blanking period), so the sync pulse (`UVS`, active-high) will be sent when the raster count is **between 288 and 291**, as (8 x 4)+256 = 288. _Vertical centering is usually OK_, although the 256 active raster area may be a _tight fit_ for some monitors.

!!! note

	_Revision v2_ uses a **28 MHz** main oscillator which, after the prescaler and a **divide-by-112** horizontal counter, gets the _CCIR-specified_ **15625 Hz** horizontal frequency. For better centering, _horizontal sync_ is generated at clock count **88** instead of 72.
	No changes are made for the _vertical_ counter.

#### 60 Hz EIA (NTSC) version

This is _under development_ as a derivative from v2. It's intended to use a readily available **25.175 MHz** oscillator and a **divide-by-100** horizontal counter for a nominal **15734 Hz** horizontal rate. The _line counter_ is based on a **divide-by-262** counter but, since _there's no way to display 256 rasters on an EIA/NTSC screen_, the `\FRAME` signal needs an extra IC (74HC85) in order to make just _192 active rasters_.

#### Overclocking Durango-X

_Although the v2 revision will include a TURBO setting_ option, it is possible to **overclock** an existing v1 Durango-X with some mods, _while keeping the proper **sync frequencies** for a working display_. This involves some trace cutting, bodge wiring and even adding some extra circuitry. [Check this other page for more information on the several overclocking methods available](overclock.md).

!!! warning

	Since the video clocks (and thus, the **sync frequencies**) are derived from the _master clock_, trying to overclock Durango by merely changing the main oscillator frequency will result in a **non-functional video output** -- in extreme cases, the display itself might be damaged!

### VDU

<figure markdown>
![VDU circuit](../assets/img/vdu.png)
<figcaption>VDU circuit on Durango-X</figcaption>
</figure>

While the 65C02 CPU has full access to RAM during the _Phi2_ clock phase (`SCLK` high), the **Phi1** phase (`SCLK` low) grants RAM access to _video circuitry_. Display data in RAM is read then according to the current `VAx` video address lines, at full clock rate in colour mode but half the speed (768 kHz) in HIRES. Thus, **no video noise or performance penalty** is made during CPU accesses to display data.

Depending on the current _video mode_, this display data follows different paths. In **HIRES**, data is latched by the **`U224`** _shift register_ (74HC166) at the precise moment determined by `U227A` (`/PE` signal) combining some of U15's highest bits. This data is shifted out at a 6.144 MHz _dot clock_ rate (`HDOT`). This serial output (`HPIX`) may be inverted thru an XOR gate (`U23C`, 74HC86) for the actual pixel stream to be displayed (`HVID`). This signal might suffer a small delay from `RV231` for **timing calibration**, turning into `DHVD` which is **gated** thru `U227B` (74HC20) as requested during _blanking_ periods by the `DHRDE` signal. Being a NAND gate, this _inverted_ signal (`/HVG`) goes back to normal thru another XOR gate (`U23D`) configured as a fixed inverter, where the _definitive video stream_ **`HVG`** is obtained.

!!! note

	Pull-up and pull-down resistors are used in a few U23 inputs, just in case `U227` is **not** installed (colour-only _Durango-S_ option). _These are not needed otherwise_, but won't hurn anyway.

On the other hand, video data path in **colour** mode is somewhat less convoluted. Display data is latched via **`U124`** (74HC574) at `VCLK` rate. We're dealing with **_chunky_ 4 bits per pixel**, thus every byte contains _two pixels_ which must be serialized at the same rate via the **`U125`** (74HC157) multiplexer, which has a slightly faster _propagation time_ than the former IC. For **optimum picture quality**, `RV127` creates a slight delay (`DEV/ODD`) which may adjust the `Pixel Delay` between both nibbles. Finally, this 4 bpp stream (`XB`, `XR`, `XGL` and `XGH`) goes thru a dedicated XOR inverter (**`U126`**, 74HC86) in case the _Inverse video_ mode is enabled, creating the desired pixel stream lines (**`IB` for blue, `IR` for red, `IGL` and `IGH` for green**). _This stream is **not** gated_ as that will be done on the SCART section.

### SCART

<figure markdown>
![SCART circuit](../assets/img/scart.png)
<figcaption>SCART and video output circuitry on Durango-X</figcaption>
</figure>

This circuit creates the **analog video signals** from the _digital_ streams provided by the VDU section, no matter the connector used. The main circuit is made around **`Q4` and `Q5` transistors** (BC548). `Q4`is configured as a **common-base mixer** for _high bandwidth_ and _negligible signal interaction_, taking the **composite sync** `/CSYNC` signal and mixing it with the HIRES video stream `HVG` at appropriate levels (actually around **2 Vpp** as common practice). This `ZMIX` signal is then _buffered_ via `Q5` as an **emitter follower** for _low impedance_ output (`MIX`). A **75 ohm** series resistor (68 is _acceptable_ too) provides _short circuit protection_ and gets the signal down to the standard **1 Vpp** level and impedance. Actually, _two_ of these outputs are provided, for both SCART (`R30/C5`) and RCA (`R31/C9`) sockets.

!!! tip

	`Q5` buffer uses a _bias resistor_ (`R15`) whose **330 ohm** is determined for the use of _either_ SCART or RCA output, but _**not** simultaneously_. In case both outputs are needed at the same time, `R15` must be reduced accordingly (say, to **150 ohm**) for safe operation. _This lower value will work in any case_, at the expense of somewhat increased power consumption.

In colour mode, the above circuit is mainly used for **sync signals**. The SCART connector provides **RGB inputs** when switched via the _fast blanking_ input. The colour bitstreams coming from VDU (`IB, IR, IGL, IGH`) are buffered by **`U127`** (74HC245) which in turn disables video output during _blanking_ periods from the **`/DCDE`** signal. Together with the previous `DHRDE`, these signals come from `/CDE` and `HRDE` generated at `U3xx` (74HC175) after some _adjustable delay_ via `VR128` and `VR221`, respectively. The buffers in the '245 are used _in pairs_ for minimal output impedance, and the outputs go into two separate paths: main one is a simple DAC for each colour in order to attenuate the signals down to the **nominal 0.7 Vpp** expected by each RGB input's 75 ohm standard impedance -- in case of the _green_ channel, two bits are in use, which account for approx. 1/3rd and 2/3rds of the full-scale output, rendering _three levels of green_ plus black.

The remaining path is sort of an afterthought... In case the RGB mode is not supported (or the SCART connection is missing altogether), an approximate **luminance value** is supplied to the composite output. A _crude_ DAC is made upon `R107...R110` which apply a suitable current level to the common ground input `VIN` of the aforementioned _video mixer_, so at least a monochromatic image is displayed.

!!! tip

	The DAC resistor values stated in the silkscreen (v1 issue) are intended for a reasonably **linear greyscale**, which may be enabled by clearing bit `D3` of the _video mode register_ (`$DF80`, _not officially supported_). But since this mode seems of little use, and _might render somewhat inaccurate colours if the **RGB-to-component** video converter is used_, alternative values may be used. Check [the Palette article](palette.md) for details.
 	**v2** and later issues of Durango-X include the **luminance DAC** as standard.

The way for switching the TV between the composite and RGB inputs is via the _fast blanking_ input in the SCART connector. This receives the `RGB` signal from U3xx (which is either _0_ in HIRES mode, or the value of `D3` from the _video mode register_), buffered by `Q306` and applied thru `R312`.

!!! note

	The _fast blanking_ signal does draw **a lot** of current, accounting for nearly **one third (!)** of Durango-X's total power consumption. Increasing the value of `R312` to suit your particular TV will decrease energy usage, but might be the cause of _unreliable mode switching_.
	This resistor is **not used** in _Composite_, _Sync-on-Green_ or (for v2 and later) _Component video_ outputs, thus _greyscale_ mode is _not available_.

### CPU

<figure markdown>
![CPU circuit](../assets/img/cpu.png)
<figcaption>CPU and interrupts generation on Durango-X</figcaption>
</figure>

The CPU section on the **Durango-X** computer is based around the **65C02** microprocessor `U1` and its associated circuitry -- mainly, [interrupt generation](irq.md). Please note that the Durango-X board has _no ROM at all_, relying on the one on the **cartridge**, which is essential for operation. _RAM_ is also surrounded by the **multiplexing** circuitry described below.

`U9` (74HC00) generates the bare minimum **control signals**, according to these equations:

- **`ROM /CS`** is `A15` NAND `/IO`, thus ROM will be disabled while accessing the _I/O area_ (`$DF80-$DFFF`)
- **`ROM /OE`** comes thru the NAND from `R/W`, but also gated via `SCLK`, as _ROM **must** leave the data bus free during _Phi1_ phase (while _video data_ is collected by the **VDU**)
- **`/WE`** is generated the usual way, gating with `SCLK` the aforementioned `ROM /OE` signal, even if it's already SCLK-gated, as is a conveniently inverted `R/W`. This signal is sent to the corresponding pin on the cartridge slot but is _**not** directly used by the RAM_, as being multiplexed calls for an _additional delay_ for the address lines to settle.

The remaining gate is used to invert the `HIRES` signal for selecting the adequate bank of multiplexers.

!!! note

	In the v2 issue, this spare gate has a different purpose, creating the _**3.5 MHz** clock signal_ for the _TURBO_ option.

#### Interrupt generation

### MUX

<figure markdown>
![MUX circuit](../assets/img/mux.png)
<figcaption>Static RAM and MUX circuit on Durango-X</figcaption>
</figure>

### Base I/O

<figure markdown>
![Base I/O circuit](../assets/img/base_io.png)
<figcaption>Base I/O devices on Durango-X</figcaption>
</figure>

### Extra features

<figure markdown>
![Extra features circuit](../assets/img/extra.png)
<figcaption>Extra features on Durango-X</figcaption>
</figure>

### Interface

<figure markdown>
![Interface circuit](../assets/img/interface.png)
<figcaption>Port interface on Durango-X</figcaption>
</figure>
