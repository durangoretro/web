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

According to a _modular approach_ as suggested by [EmilioLB](http://emiliollbb.net/), several big blocks can be isolated:

* **Clocks:** generation of both _video_ and _CPU_ clock signals, as they're **fully synchronised** for optimum performance.
* **VDU:** picks video data from SRAM and sends it to the monitor thru some analogue circuitry.
* **SCART:** the actual analogue circutry for sending the video output.
* **CPU:** the **brains** of the machine.
* **MUX:** the RAM needs to be _multiplexed_ between the CPU and the video circuitry.
* **Base I/O:** basic on-board devices.
* **Extra features:** not indispensable, but useful anyway.
* **Interface:** external devices and connections.

### Clocks

<figure markdown>
![Clocks circuit](../assets/img/clocks.png)
<figcaption>Clock circuit (and video address generation) on Durango-X</figcaption>
</figure>

!!! note

	_Revision v2_ uses a **28 MHz** main oscillator which, after the prescaler and a **divide-by-112** horizontal counter, gets the _CCIR-specified_ **15625 Hz** horizontal frequency. For better centering, _horizontal sync_ is generated at clock count **88** instead of 72.

### VDU

<figure markdown>
![VDU circuit](../assets/img/vdu.png)
<figcaption>VDU circuit on Durango-X</figcaption>
</figure>

### SCART

<figure markdown>
![SCART circuit](../assets/img/scart.png)
<figcaption>SCART and video output circuitry on Durango-X</figcaption>
</figure>

### CPU

<figure markdown>
![CPU circuit](../assets/img/cpu.png)
<figcaption>CPU and interrupts generation on Durango-X</figcaption>
</figure>

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
