[Home](../../index.md) > [Development](../development.md) > [Tools](tools.md) > **nanoBoot format**
___

# nanoBoot format

!!! warning

	This is **under development**.

***nanoBoot*** is the software protocol that allows to send code (or generic data) to a _Durango_ or any other computer fitted with a **nanoLink** port.

## Principle of operation

### Signals definition

This is a **two-wire interface** (plus _ground_) based on a Synchronous Serial link. The main feature is that _the receiving side needs almost **no additional hardware**_, as it simply repurposes the regular `/IRQ` and `/NMI` _interrupt_ lines for DATA and CLOCK transmission, respectively. Note that, even if this was designed around the 6502 CPU, _it may be applied to almost any CPU_, as long as it has two interrupt lines with different privilege levels.

### Hardware requisites

TBD

### General operation

TBD...
