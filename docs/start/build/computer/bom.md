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

	If you are building _Durango**·R**_ (HIRES mode only), since it generates no colour signal at all, it makes **no sense** to select the _Component Video_ option. If SCART is not available, use the **second video output** option for a suitable _monochrome_ signal thru an RCA jack. You may delete `C5` and `R30` as these provide the SCART output only.

If you want to build [the older v1 PCB](), check [this BOM instead!](bom1.md) 


!!! note

	Assume all ICs are in DIP package, resistors are rated **1/4 W** and capacitors **10 V** or higher, _unless noted otherwise_.

|Class       |Type   |Qty. (\*)|·S|·R|Component video|Second video output|Buzzer|Notes|
|------------|-------|---------|--|--|---------------|-------------------|------|-----|
|Piezo Buzzer|passive|0        |  |  |               |                   |**+1**|     |
|Capacitor   |_68 pF_|**1**    |  |  |               |                   |      |3    |
|Capacitor   |_22 nF_|**1**    |  |  |               |                   |      |1    |
|Capacitor   |_100 nF_|**1**   |  |  |               |                   |      |2    |
|E.Capacitor |_1 µF_ |_0_      |  |  |               |                   |      |13   |
|E.Capacitor |_10 µF_|**2**    |  |  |               |                   |      |1    |
|E.Capacitor |_100 µF_|**1**   |  |  |+2             |+1                 |      |1    |
|E.Capacitor |_220 µF_|**1**   |  |  |               |                   |      |1    |
|E.Capacitor |_470 µF_|**1**   |  |  |+1             |                   |      |1    |
|Diode       |_1N4148_|**6**   |  |  |               |                   |      |4    |
|LED         |3 mm   |**2**    |  |  |               |                   |      |5    |
|Transistor  |_BC548_|**7**    |-1|-1|+3             |                   |      |4    |
|Resistor    |_27_ **(0.5 W)**|0| |  |               |                   |**+1**|7    |
|Resistor    |75     |**1**    |  |  |**+2**         |+1                 |      |12   |
|Resistor    |_120_  |**4**    |  |-1|-1             |                   |      |6, 13|
|Resistor    |330    |0        |  |  |**+2**         |                   |      |     |
|Resistor    |470    |**4**    |  |-2|               |                   |      |     |
|Resistor    |680    |**2**    |  |-1|               |                   |      |5    |
|Resistor    |1 K    |**2**    |  |  |+4             |                   |      |9    |
|Resistor    |1.2 K  |**1**    |  |-1|               |                   |      |     |
|Resistor    |3.3 K  |**5**    |-2|-1|+2             |                   |      |8    |
|Resistor    |5.6 K  |0        |  |  |**+2**         |                   |      |10   |
|Resistor    |6.8 K  |**2**    |  |  |+2             |                   |      |     |
|Resistor    |8.2 K  |**1**    |  |-1|               |                   |      |     |
|Resistor    |12 K   |**2**    |  |-1|               |                   |      |5    |
|Resistor    |18 K   |**1**    |  |-1|               |                   |      |     |
|Resistor    |22 K   |**2**    |  |  |+1             |                   |      |     |
|Resistor    |33 K   |**2**    |-1|-2|+1             |                   |      |     |
|Resistor    |39 K   |0        |  |  |**+1**         |                   |      |     |
|Resistor    |47 K   |0        |  |  |**+1**         |                   |      |     |
|Resistor    |56 K   |0        |  |  |**+1**         |                   |      |11   |
|Resistor    |82 K   |0        |  |  |**+1**         |                   |      |     |
|Resistor    |_100 K_|**1**    |  |  |               |                   |      |3    |
|Resistor    |_220 K_|0        |**+2**| |            |                   |      |14   |
|Res. network|8x _3.3 K_|**1** |  |  |               |                   |      |15   |
|Res. network|4x _4.7 K_|**1** |  |  |               |                   |      |16   |
|Variable Res.|5 K   |**1**    |  |-1|               |                   |      |17   |
|Variable Res.|_10 K_|**2**    |-1|-1|               |                   |      |17, 18|
|**Microprocessor**|65C02 |**1**|  |  |              |                   |      |     |
|**Static RAM**|62256|**1**     |  |  |              |                   |      |     |
|Integrated circuit|74HC00|**1**|  |  |              |                   |      |     |
|Integrated circuit|74HC02|**1**|  |  |              |                   |      |     |
|Integrated circuit|74HC20|**1**|-1|  |              |                   |      |     |
|Integrated circuit|74HC21|**1**|  |  |              |                   |      |     |
|Integrated circuit|74HC30|**1**|  |  |              |                   |      |     |
|Integrated circuit|74HC32|**1**|  |  |              |                   |      |     |
|Integrated circuit|74HC74|**1**|  |  |              |                   |      |     |
|Integrated circuit|74HC85|**2**|  |  |              |                   |      |     |
|Integrated circuit|74HC86|**2**|  |-1|              |                   |      |     |
|Integrated circuit|74HC139|**2**|  |  |             |                   |      |     |
|Integrated circuit|74HC157|**4**|-1|-2|             |                   |      |     |
|Integrated circuit|74HC166|**1**|-1|  |             |                   |      |     |
|Integrated circuit|74HC174|**1**|  |  |             |                   |      |19   |
|Integrated circuit|74HC175|**1**|  |  |             |                   |      |     |
|Integrated circuit|74HC245|**3**|  |-1|             |                   |      |     |
|Integrated circuit|74HC257|**4**|-2|-2|             |                   |      |20   |
|Integrated circuit|74HC367|**1**|  |  |             |                   |      |19   |
|Integrated circuit|74HC574|**1**|-1|  |             |                   |      |     |
|Integrated circuit|74HC688|**1**|  |  |             |                   |      |     |
|Integrated circuit|74AC4040|**1**| |  |             |                   |      |21   |
|Integrated circuit|74HC4040|**2**| |  |             |                   |      |21   |

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
13. `C10` was originally 1 µF, but fitting it does actually _impair_ NMI debouncing and should **not** be used. In this case, `R35` can be safely replaced by a _jumper_ as well.
14. These are just _weak pull-ups/pull-downs_ and may be chosen from around **1 Kohm** up to 330 Kohm or so. Even if they're only needed for the _Durango·S_ variant, fitting them won't harm in any case!
15. _Strong pull-downs_ in **SIP-9** package. _This is the nominal value_ but could be modified slightly without any ill effect.
16. _Strong pull-ups_ in **SIP-5** package. _Nominal_ value is 3.3 Kohm, but 4.7 has worked fine always.
17. **PIHER PT-6-V** package.
18. Originally specified as _5 K_, the new value allows for a broader adjustment margin.
19. Could be ommited in certain configurations, see options.
20. [Single-mode Durangos](smod.md) (·S, ·R) may use `74HC157` instead.
21. Although _HC_ versions may serve well in any case, the faster **AC** version is recommended for `U15`, while `U14` may be safely replaced by a slower _non-HC_ **CD4040**. In some cases, `U19` could be of this slower type as well, but display may become slightly _glitchy_.

## Logic families

!!! warning

	Some sellers on _eBay_, _AliExpress_ and the like, seem to be selling **non-compliant** parts -- they seem to work fine on less demanding circuits, but **fail** whenever they're "pushed" within spec. In the case of the _Durango_ computers, **U15** and **U125** are _particularly sensitive parts_, thus a **reputable source** is recommended or, at the very least, make sure you purchase under a reasonable _return policy_.

The _Durango·X_ computer is designed around **high-speed CMOS *(HC)*** technology. _SRAM_ chips are nearly always of such type, as is the *65**C**02* CPU_; the rest of the circuit is made from _standard **74HC**_ parts. Some considerations have to be done:

-	Generally speaking, **74HC** and **74HC*T*** are both suitable and normally interchangeable. However, the use of an _HC**T**_ for `U32` (or `U8` on v1 boards) may affect interrupt performance, [check here for details](../../../hard/dx/irq.md).
-	In case of `U14`, a _non-HC_ **CD4040** may be used without any ill effect. _In some cases_, `U19` can be replaced by a _non-HC_ unit as well, although **some glitches** on the screen might be seen.
-	Performance of **`U15`** is **critical**. v1 boards work fine with a _74HC_ unit but, in case of v2, a **74*AC*4040** is **highly recommended** -- some displays may become unstable with the HC part.
-	Again, **`U125`'s** performance is **critical** for optimum display quality. Some _questionable_ parts may not be up to the official performance level, thus beware! Any other use of the `74HC157` seems more tolerant, though.

!!! warning

	The use of _bipolar **TTL**_ logic circuits (e.g. 74**LS**) is **NOT** recommended. Neither is the use of an **NMOS 6502**, since the [software library](../../../software.md) does not necessarily support it!
 
### Component equivalences

-	The 74HC00 may be replaced by a 74HC**132** (v1 had one of these too), but the opposite is _not_ true.
-	In this circuit, _any_ 74HC157 may be replaced by a 74HC**257** without any problems; note that [single-mode Durangos](smod.md) need no '257s at all, and may use '157 or '257 at any position.
-	74HC688 has same pinout and functionality as the **'521** (usually available from _faster_ logic families) and should be interchangeable.
-	**Transistors** and **diodes** are _not_ critical, and any _small signal_ reference may be used instead -- as long as you keep the **pinout** in mind.

