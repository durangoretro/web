---
hide:
  - toc
---
[Site map](../../../sitemap.md))
[Home](../../../index.md) > [Getting Started](../../../started.md) > [Building](../../building.md) > [KeyBoard](../keyboard.md) > **BOM**

---
# Bill Of Materials (v1.3)

Once you get the KeyBoard PCB, it's time to gather all the necessary **components**. _Make sure you pick up all the component for a particular configuration_; some components differs due to the chose options and the desired configuration.

!!! note

	Assume all ICs are in DIP package, resistors are rated **1/4 W** and capacitors **10 V** or higher, _unless noted otherwise_.



| Class              | Type                | Qty. (\*) | NES* | MD* | Notes                                     |
|--------------------|---------------------|:---------:|-----|----|-------------------------------------------|
| Res. Network       | 220K - 9 Pin        |     2     | 1   | 2  | Only one needed if Using NES controllers. |
| Res. Network       | 6K8 - 9 Pin         |     1     | 1   | 1  |                                           |
| Diode              | 1N4148              |     8     | 8   | 8  |                                           |
| Button             | Push Button 6x6x7mm |     40    | 40  | 40 |                                           |
| MD Socket          | Dsub9               |     2     | 0   | 2  | Only for MD/atari Controllers             |
| NES Socket         | NES Socket          |     2     | 2   | 0  | Only for NES Controllers                  |
| Socket             | IDC-16              | 2         | 2   | 2  |                                           |
| Socket             | Pin Socket 1x8      | 2         | 2   | 2  |                                           |
| Separator          | M3x18mm             | 4         | 4   | 4  |                                           |
| Integrated circuit | 74HC138             | 1         | 1   | 1  |                                           |
| Integrated circuit | 74HC174             | 2         | 2   | 2  |                                           |
| Integrated circuit | 74HC245             | 3         | 1   | 3  | Only one needed if using NES Controller   |
| Integrated circuit | 74HC595             | 2         | 2   | 0  | Only for NES Controllers                  |
| Integrated circuit | 74HC86              | 1         | 1   | 1  |                                           |

!!! info
    
    The NES or MD columns show the total components needed for this configuration. Check the Board serigraphy for more information.

!!! warning

    Remember to check at the PCB the Components needed for all the configurations check the MD or NES components at the Board.

!!! note

	We recomend that all the IC must be places at DIP IC sockets.


Here you have a Table with the Summary for the DIP Sockets needed.

| Class      | Type              | Qty (\*) | NES | MD | Notes                                         |
|------------|-------------------|----------|-----|----|-----------------------------------------------|
| DIP Socket | 20 Pin DIP Socket | 3        | 1   | 3  | Check at the PCB the MD or NES sockets needed |
| DIP Socket | 16 Pin DIP Socket | 5        | 4   | 4  | Check at the PCB the MD or NES sockets needed |
| DIP Socket | 14 Pin DIP Socket | 1        | 1   | 1  |                                               |