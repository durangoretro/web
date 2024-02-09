[Home](../../index.md) > [Getting Started](../../started.md) > [Building _Durango·X_](../building.md) > **Assembly guide (keyboard)**
___
# Assembly guide (keyboard/gamepads interface)

## [Building options](kbd/options.md)

_Whithin the same board_, you may choose from two building options:

- NES gamepad version
- Megadrive/Genesis/Atari 2600 version

For improved typing experience, you may consider adding the [keyboard overlay](../../hard/acc.md).

## [BOM](kbd/bom.md)

This is a _modular_ board which not only allows the choice of gamepad interface, but also makes the keyboard **optional**. Much like the [main computer board](), a _prefix_ on component designators indicate what option that component is needed:

- **Single-digit designator:** _common_ components needed for _all configurations_.
- **`1x` (`10` to `19`) designators:** if _keyboard_ is required.
- **`2x` (`20` to `29`) designators:** for _NES keypads_ only!
- **`3x` (`30` to `39`) designators:** for _Megadrive/Genesis/VCS keypads_ only!

!!! warning

	Unlike most multi-option boards on the Durango ecosystem, some components for the NES or Megadrive options are **NOT compatible** and _must **NOT** be fitted together_, otherwise malfunction (or even component damage!) may occur.

## [Step by step](kbd/steps.md)

As usual, follow all the [usual recommendations](general.md).  **Exert special caution when mounting the connection _to computer_ (`J3`)**, although this board can be used _externally_ (i.e., not sitting atop the Durango·X main PCB) by using an **IDC-16 cable**.

!!! bug

	Versions of this board _prior to v1.3_ had a bug **affecting the MD/Genesis/VCS option**. A workaround is described for these boards but _it swaps the functionality of the `START` and `C` (a.k.a. `SELECT`) buttons. **NES version was never affected** but v1.3 is anyway recommended because of the improved silkscreen.
 
