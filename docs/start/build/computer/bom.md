---
hide:
  - toc
---
[Site map](../../../sitemap.md))
[Home](../../../index.md) > [Getting Started](../../../started.md) > [Building](../../building.md) > [Durango·X](../durango.md) > **BOM**

---
# Bill Of Materials (v2.x)

Once you've got the [PCB](../pcb.md), it's time to gather all the necessary **components**. _Make sure you decide on a particular [configuration](options.md)_ as some components differ according to the chosen option.

Also, don't forget to check the **Notes** below for alternative values.

!!! tip

	If you are building _Durango*·R*_ (HIRES mode only), since it generates no colour signal at all, it makes **no sense** to select the _Component Video_ option. If SCART is not available, use the **second video output** option for a suitable _monochrome_ signal thru an RCA jack. You may delete `C5` and `R30` as these provide the SCART output only.

If you want to build [the older v1 PCB](), check [this BOM instead!](bom1.md) 

|Class       |Type   |Qty. (\*)|·S|·R|Component video|Second video output|Buzzer|Notes|
|------------|-------|---------|--|--|---------------|-------------------|------|-----|
|Piezo Buzzer|passive|0        |  |  |               |                   |**+1**|     |
|Capacitor   |_100 nF_|**1**   |  |  |               |                   |      |2    |
|E.Capacitor |_10 µF_|**2**    |  |  |               |                   |      |1    |
|E.Capacitor |_220 µF_|**1**   |  |  |               |                   |      |1    |
|E.Capacitor |_100 µF_|**1**   |  |  |+2             |+1                 |      |1    |
|E.Capacitor |_470 µF_|**1**   |  |  |+1             |                   |      |1    |
|Capacitor   |_22 nF_|**1**    |  |  |               |                   |      |1    |
|Capacitor   |_68 pF_|**1**    |  |  |               |                   |      |3    |
|Diode       |_1N4148_|**6**   |  |  |               |                   |      |4    |
|LED         |3 mm   |**2**    |  |  |               |                   |      |5    |
|Transistor  |_BC548_|**7**    |-1|-1|+3             |                   |      |4    |
|Resistor    |22 K   |**2**    |  |  |+1             |                   |      |     |
|Resistor    |470    |**4**    |  |-2|               |                   |      |     |
|Resistor    |680    |**2**    |  |-1|               |                   |      |5    |
|Resistor    |_120_  |**5**    |  |-1|-1             |                   |      |6    |
|Resistor    |_27 (0.5 W)_|0   |  |  |               |                   |**+1**|7    |
|Resistor    |_100 K_|**1**    |  |  |               |                   |      |3    |
|Resistor    |12 K   |**2**    |  |-1|               |                   |      |5    |
|Resistor    |8.2 K  |**1**    |  |-1|               |                   |      |     |
|Resistor    |18 K   |**1**    |  |-1|               |                   |      |     |
|Resistor    |1.2 K  |**1**    |  |-1|               |                   |      |     |
|Resistor    |33 K   |**2**    |-1|-2|+1             |                   |      |     |
|Resistor    |3.3 K  |**5**    |-2|-1|+2             |                   |      |8    |
|Resistor    |6.8 K  |**2**    |  |  |+2             |                   |      |     |
|Resistor    |1 K    |**2**    |  |  |+4             |                   |      |9    |
|Resistor    |330    |0        |  |  |**+2**         |                   |      |     |
|Resistor    |5.6 K  |0        |  |  |**+2**         |                   |      |10   |
|Resistor    |    |**5**    |  |-1|-1             |                   |      |?    |
|Resistor    |    |**5**    |  |-1|-1             |                   |      |?    |
|Resistor    |    |**5**    |  |-1|-1             |                   |      |?    |
|Resistor    |    |**5**    |  |-1|-1             |                   |      |?    |
|Resistor    |    |**5**    |  |-1|-1             |                   |      |?    |
|Resistor    |    |**5**    |  |-1|-1             |                   |      |?    |
|Resistor    |    |**5**    |  |-1|-1             |                   |      |?    |
|Resistor    |    |**5**    |  |-1|-1             |                   |      |?    |
|Resistor    |    |**5**    |  |-1|-1             |                   |      |?    |


\*) Standard build is a **Durango·X** _v2.2_ with **SCART** output and no _second video output_, _piezo buzzer_ or any extra **simplifications**.

### Notes

1. Non-critical value, as long as it's kept within the same _order of magnitude_. **Higher** values are usually preferable, although component **footprint** might be the limiting factor.
2. `C2` works as a **low pass filter** for audio output. May be reduced down to **39 nF** or so, if _more treble_ is desired. _Does NOT affect piezo buzzer_ anyway.
3. Nominal value, may be changed in case of [interrupt problems](../../../hard/dx/irq.md).
4. Non-critical. Any **small signal** equivalent device (e.g. _1N914_ diodes, or _2N3904_ transistors) will do, but _make sure about alternative pinouts_.
5. _Colours_ are personal preference, of course, but the proposed resistors expect the `POWER` LED to be a _high efficiency_ type (Gallium Nitride, e.g. blue) whereas the `ERROR` LED may use an older Gallium Arsenide-Phosphide (red) unit. _Resistors `R29 (POWER)` and `R6 (ERROR)` should be adapted to the LED type and preferred brightness_.
6. If the _second video output_ is not fitted, or never to be used **simultaneously** with the main one, `R15` can be up to **330 ohm**. SCART-equipped Durangos may reduce power consumption by upping `R922` up to **220 ohm** or so, although some TVs may not switch reliably into _RGB mode_.
7. Change according to desired _piezo buzzer **volume**_. Could be down to a _zero-ohm **bridge**_, although that might overload `Q3`. Notice relatively high power dissipation!
8. `R3`,`R34` and, to some extent, `R337` are just _strong pull-ups_ and may be chosen from around **1 Kohm** up to 10 Kohm or so.
9. `R32` is for _Emilio's LED_ and may be suited to the desired brightness (down to **680 ohm**). _If you intend to use this pin as a **general purpose output**, you may replace this resistor with a **jumper**_.
10. Theoretical value is **6.2 Kohm** from the _E24-series_, but the E12 standard _5.6 Kohm_ seems acceptable.
11. Theoretical value is **62 Kohm** from the _E24-series_, but the E12 standard _56 Kohm_ seems acceptable.
12. Correct value (as per RS-170 standard) is 75 ohm from the _E24-series_, although the E12 standard **68 ohm** is acceptable.
13. 

## Logic families

!!! warning

	Some sellers on _eBay_, _AliExpress_ and the like, seem to be selling **non-compliant** parts -- they seem to work fine on less demanding circuits, but **fail** whenever they're "pushed" within spec. In the case of the _Durango_ computers, **U15** and **U125** are _particularly sensitive parts_, thus a **reputable source** is recommended or, at the very least, make sure you purchase under a reasonable _return policy_.

The _Durango·X_ computer is designed around **high-speed CMOS** technology. _SRAM_ chips are nearly always of such type, as is the _**65C02** CPU_; the rest of the circuit is made from standard **74HC** parts. Some considerations have to be done:

-	Generally speaking, **74HC** and **74HC*T*** are both suitable and normally interchangeable. However, the use of an _HC**T**_ for `U32` (or `U8` on v1 boards) may affect interrupt performance, [check here for details](../../../hard/dx/irq.md).
-	In case of `U14`, a _non-HC_ **CD4040** may be used without any ill effect. _In some cases_, `U19` can be replaced by a **CD** one as well, although **small glitches** on the screen might be seen.
-	Performance of **`U15`** is **critical**. v1 boards work fine with a _74HC_ unit but, in case of v2, a **74*AC*4040** is **highly recommended** -- some displays may become unstable with the HC part.

!!! warning

	The use of _bipolar **TTL**_ logic circuits (e.g. 74**LS**) is **NOT** recommended. Neither is the use of an **NMOS 6502**, since the software library does not necessarily support it!
 
### Component equivalences

-	In this circuit, _any_ 74HC157 may be replaced by a 74HC**257** without any problems; note that [single-mode Durangos](smod.md) need no '257s at all, and may use '157 or '257 at any position.
-	74HC688 has same pinout and functionality as the **'521** (usually available from _faster_ logic families)

