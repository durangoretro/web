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

If you want to build [the older v1 PCB](), check [this BOM instead!](bom1.md) 

|Class       |Type   |Qty. (\*)|·S|·R|Component video|Second video output|Buzzer|Notes|
|------------|-------|---------|--|--|---------------|-------------------|------|-----|
|Piezo Buzzer|passive|**0**    |  |  |               |                   |**+1**|     |
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
|Resistor    |_27 (0.5 W)_|**0**| |  |               |                   |**+1**|7    |
|Resistor    |_100 K_|**1**    |  |  |               |                   |      |3    |
|Resistor    |12 K   |**2**    |  |-1|               |                   |      |5    |
|Resistor    |8.2 K  |**1**    |  |-1|               |                   |      |     |
|Resistor    |18 K   |**1**    |  |-1|               |                   |      |     |
|Resistor    |1.2 K  |**1**    |  |-1|               |                   |      |     |
|Resistor    |33 K   |**2**    |-1|-2|+1             |                   |      |     |
|Resistor    |3.3 K  |**5**    |-2|-1|+2             |                   |      |8    |
|Resistor    |6.8 K  |**2**    |  |  |+2             |                   |      |     |
|Resistor    |1 K    |**2**    |  |  |+4             |                   |      |9    |
|Resistor    |330    |**0**    |  |  |**+2**         |                   |      |     |
|Resistor    |5.6 K  |**0**    |  |  |**+2**         |                   |      |10   |
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

## Notes

1. Non-critical value, as long as it's kept within the same _order of magnitude_. **Higher** values are usually preferable, although component **footprint** might be the limiting factor.
2. `C2` works as a **low pass filter** for audio output. May be reduced down to **39 nF** or so, if _more treble_ is desired. _Does NOT affect piezo buzzer_ anyway.
3. Nominal value, may be changed in case of [interrupt problems](../../../hard/dx/irq.md).
4. Non-critical. Any **small signal** equivalent device (e.g. _1N914_ diodes, or _2N3904_ transistors) will do, but _make sure about alternative pinouts_.
5. _Colours_ are personal preference, of course, but the proposed resistors expect the `POWER` LED to be a _high efficiency_ type (Gallium Nitride, e.g. blue) whereas the `ERROR` LED may use an older Gallium Arsenide-Phosphide (red) unit. _Resistors `R29 (POWER)` and `R6 (ERROR)` should be adapted to the LED type and preferred brightness_.
6. If the _second video output_ is not fitted, or never to be used **simultaneously** with the main one, `R15` can be up to **330 ohm**. SCART-equipped Durangos may reduce power consumption by upping `R922` up to **220 ohm** or so, although some TVs may not switch into _RGB mode_ reliably.
7. Change according to desired _piezo buzzer **volume**_. Could be down to a _zero-ohm **bridge**_, although it might overload `Q3`. Notice relatively high power dissipation!
8. `R3`,`R34` and, to some extent, `R337` are just _strong pull-ups_ and may be down to around **1 Kohm** up to 10 Kohm or so.
9. `R32` is for _Emilio's LED_ and may be suited to the desired brightness (down to **680 ohm**). _If you intend to use this pin as a **general purpose output**, you may replace this with a jumper_.
10. Theoretical value is **6.2 Kohm** from the _E24-series_, but the E12 standard _5.6 Kohm_ seems acceptable.

## Logic families

The _Durango·X_ computer is designed around **high-speed CMOS** technology. _SRAM_ chips are nearly always of such type, as is the _**65C02** CPU_; the rest of the circuit is made from standard **74HC** parts. Some considerations have to be done:

-	Generally speaking, **74HC** and **74HC*T*** are both suitable and normally interchangeable. However, the use of _HCT_ on `U3?` (or `U1?` in v1 boards) may affect interrupt performance, [check here for details](../../../hard/dx/irq.md).
-	In case of `U14`, a _non-HC_ **CD4040** may be used without any ill effect. _In some cases_, `U19` can be **CD** as well, although **small glitches** on the screen might be seen.
-	Performance of `U15` is **critical**. v1 boards usually work fine with a _74HC_ unit but, in case of v2, a **74*AC*4040** is **highly recommended** -- some displays may become unstable with the HC part.
