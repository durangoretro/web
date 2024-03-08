---
hide:
  - toc
---
[Site map](../../../sitemap.md))
[Home](../../../index.md) > [Getting Started](../../../started.md) > [Building](../../building.md) > [Durango·X](../durango.md) > **BOM**

---
# Bill Of Materials (v2.x)

Once you've got the [PCB](), it's time to gather all the necessary **components**. _Make sure you decide on a particular [configuration](options.md)_ as some components differ according to the chosen option.

If you want to build [the older v1 PCB](), check [this BOM instead!](bom1.md) 

|Class       |Type   |Qty. (\*)|·S|·R|Component video|Second video output|Buzzer|Notes|
|------------|-------|---------|--|--|---------------|-------------------|------|-----|
|Piezo Buzzer|passive|0        |  |  |               |                   |+1    |     |
|Capacitor   |_100 nF_|1       |  |  |               |                   |      |1    |
|E.Capacitor |_10 µF_|2        |  |  |               |                   |      |     |
|E.Capacitor |_220 µF_|1       |  |  |               |                   |      |2    |
|E.Capacitor |_100 µF_|1       |  |  |+2             |+1                 |      |3    |
|E.Capacitor |_470 µF_|1       |  |  |+1             |                   |      |     |
|Capacitor   |_22 nF_|1        |  |  |               |                   |      |4    |
|Capacitor   |_68 pF_|1        |  |  |               |                   |      |5    |
|Diode       |_1N4148_|6       |  |  |               |                   |      |6    |
|LED         |3 mm   |2        |  |  |               |                   |      |7    |
|Transistor  |_BC548_|7        |-1|-1|+3             |                   |      |6    |
|Resistor    |22 K   |2        |  |  |+1             |                   |      |     |
|Resistor    |470    |4        |  |-2|               |                   |      |     |
|Resistor    |680    |2        |  |-1|               |                   |      |8    |


\*) Standard build is a **Durango·X** _v2.2_ with **SCART** output and no _second video output_, _piezo buzzer_ or any extra **simplifications**.
