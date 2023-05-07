# Durango cartridge

<figure markdown>
![Durango Cartridge](../assets/img/cart.jpg)
<figcaption>Standard Durango mini-cartridge</figcaption>
</figure>

The Durango cartridge hosts the ROM chip containing any program or game for the **Durango-X** computer.

You can use EPROM, EEPROM or _Flash_ chips to store the software.

Durango-X has up to **32 KiB** of ROM address space, but you could use _bankswitching_ to store more information, with a suitable cartridge.

Currently, two kinds of cartridges have been developed:

* The standard **mini-cartridge** (suitable for most EPROMs, EEPROMs and _Flash_ chips, up to 32 KiB) as pictured above.
* The [**Development Cartridge**](devcart.md), which adds 32 KiB _shadow_ RAM plus an **SD Card reader**.

Also _under development_ is a **multi-cartridge**, which will hold more than a ROM image, cycling between them simply by hitting the `RESET` button.

All these cartridges use the same [pinout](cart_pinout.md).

For more information about Durango-X cartridges please refer to the [Getting Started](../started/) section.
