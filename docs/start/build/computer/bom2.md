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


## Resistors


| Class    | Type          | Qty | Notes                      |
|----------|---------------|-----|----------------------------|
| Resistor | 120           | 5   |            6,13            |
| Resistor | 330           | 2   |                            |
| Resistor | 470           | 4   |                            |
| Resistor | 680           | 2   |             5              |
| Resistor | 100K          | 1   |             3              |
| Resistor | 10K ajustable | 2   | PIHER PT-6-V package.      |
| Resistor | 12K           | 2   |             5              |
| Resistor | 18K           | 1   |                            |
| Resistor | 1K            | 6   |             9              |
| Resistor | 1K2           | 1   |                            |
| Resistor | 220K          | 2   |             14             |
| Resistor | 22K           | 3   |                            |
| Resistor | 27 .5W        | 1   |             12             |
| Resistor | 47K           | 1   |                            |
| Resistor | 33K           | 3   |                            |
| Resistor | 39K           | 1   |                            |
| Resistor | 3K3           | 7   |             8              |
| Resistor | 3K3x8 9-pin   | 1   |            15              |
| Resistor | 4K7           | 2   |                            |
| Resistor | 4K7x4 5-pin   | 1   |             16             |
| Resistor | 56K           | 1   |             11             |
| Resistor | 5K ajustable  | 1   | PIHER PT-6-V package 5KOhm |
| Resistor | 5K6           | 2   |              10            |
| Resistor | 6K8           | 4   |                            |
| Resistor | 75            | 4   |              12            |
| Resistor | 8K2           | 1   |                            |


## Capacitors

| Class     | Type       | Qty (\*) | Notes |
|-----------|------------|----------|-------|
| Capacitor | 10 uF 25v  | 2        | 1     |
| Capacitor | 100 nF     | 1        | 2     |
| Capacitor | 100 uF 10v | 4        | 1     |
| Capacitor | 22 nF      | 1        | 1     |
| Capacitor | 220 uF 50v | 1        | 1     |
| Capacitor | 470 uF 10v | 2        | 1     |
| Capacitor | 68 pF      | 1        | 3     |

## Transistors and Diodes

| Class      | Type      | Qty (\*) | Notes |
|------------|-----------|----------|-------|
| Passive    | Buzzer    | 1        |       |
| Diode      | 1N4148    | 6        | 4     |
| Transistor | BC548     | 11       | 4     |
| Diode Led  | Red Led   | 1        | 5     |
| Diode Led  | Green Led | 1        | 5     |

## Sockets DIP

| Class      | Type                    | Qty (\*) | Notes |
|------------|-------------------------|----------|-------|
| DIP Socket | 14 pin DIP Socket       | 9        |       |
| DIP Socket | 16 pin DIP Socket       | 16       |       |
| DIP Socket | 20 pin DIP Socket       | 5        |       |
| DIP Socket | 28 pin DIP Socket       | 1        |       |
| DIP Socket | 28 pin DIP Socket small | 1        |       |
| DIP Socket | 40 pin DIP Socket       | 1        |       |


## Integrated Circuits


| Class              | Type     | Qty (\*) | Notes |
|--------------------|----------|----------|-------|
| Static Memory      | 62256    | 1        |       |
| MicroProcessor     | 65C02    | 1        |       |
| Integrated Circuit | 74HC00   | 1        |       |
| Integrated Circuit | 74HC02   | 1        |       |
| Integrated Circuit | 74HC139  | 1        |       |
| Integrated Circuit | 74HC157  | 4        |       |
| Integrated Circuit | 74HC166  | 1        |       |
| Integrated Circuit | 74HC174  | 1        |   19  |
| Integrated Circuit | 74HC175  | 1        |       |
| Integrated Circuit | 74HC20   | 1        |       |
| Integrated Circuit | 74HC21   | 1        |       |
| Integrated Circuit | 74HC245  | 3        |       |
| Integrated Circuit | 74HC257  | 4        |   20  |
| Integrated Circuit | 74HC30   | 1        |       |
| Integrated Circuit | 74HC32   | 1        |       |
| Integrated Circuit | 74HC367  | 1        |   19  |
| Integrated Circuit | 74HC4040 | 3        |   21  |
| Integrated Circuit | 74HC574  | 1        |       |
| Integrated Circuit | 74HC688  | 1        |       |
| Integrated Circuit | 74HC74   | 1        |       |
| Integrated Circuit | 74HC85   | 2        |       |
| Integrated Circuit | 74HC86   | 2        |       |

## Sockets and Connectors

| Class          | Type                         | Qty (\*) | Notes                    |
|----------------|------------------------------|----------|--------------------------|
| Edge Connector | Edge 36 pin                  | 1        | Cartridge Edge Connector |
| DIP Socket     | IDC-6                        | 1        |                          |
| Socket         | IDC-16                       | 1        | KeyBoard Connector       |
| Pin Header     | 2 Pin header Jumper (Yellow) | 1        |                          |
| Pin Header     | 2 Pin header Jumper (Blue)   | 1        |                          |
| Pin Header     | 4 Pin header Jumper (Black)  | 1        | nanoLink                 |
| Pin Header     | 2 Pin header Jumper (Red)    | 1        |                          |
| Pin Header     | 2 Pin header Jumper (Green)  | 1        |                          |
| Pin Header     | pin socket 90º 2x8           | 1        |                          |
| Pin Header     | pin socket 17 Pin DEBUG      | 1        |                          |
| SCART Header   | SCART                        | 1        | SCART Video RGB Output   |
| Power Header   | USB-B                        | 1        | USB 5V                   |

## Other Components

| Class   | Type           | Qty (\*) | Notes                          |
|---------|----------------|----------|--------------------------------|
| Cristal | 28 MHz DIP-14  | 1        | Only for V2.x use 24Mhz for v1 |
| Passive | Passive Buzzer | 1        |                                |
| Swtich  | Small Switch   | 1        | Can be used a 2 Pin Header     |
| Button  | Button 6x6x21  | 2        |                                |

## Assembly Components

| Class    | Type          | Qty (\*) | Notes   |
|----------|---------------|----------|---------|
| Assembly | feet M3x10    | 4        |         |
| Assembly | separator 4mm | 4        |         |
| Assembly | screw M3x10   | 4        | overlay |
| Assembly | screw M3x8    | 4        |         |
| Assembly | tuerca M3     | 4        | overlay |

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

