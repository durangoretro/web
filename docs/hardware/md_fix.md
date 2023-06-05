# Keyboard/Gamepad Interface v1 fix

## For Mega Drive version ONLY

While the _NES flavour_ of the [Keyboard/Gamepad Interface board](keyboard.md) works flawlessly, a **bug** is present on the _v1_ revision of this board. Please use the _workaround_ described below:

!!! warning

	This workaround is for the **Mega Drive** version of the Interface; do **NOT** apply these mods to the _NES_ version.

* Disconnect **pin 11 of U9** in the Interface board (either _bending_ or _cutting_ the IC's leg, or by _removing_ the corresponding _socket pin_ -- **this pin should be NOT in contact with the board**.
* On the _back_ of the board, make a bridge between **pins 11 and 12 of U9**, as shown on the pictures below.

<figure markdown>
![Mega Drive interface fix](../assets/img/md_fix2.jpg)
<figcaption>Bent pin 11 on U9 (74HC86)</figcaption>
</figure>
<figure markdown>
![Mega Drive interface fix](../assets/img/md_fix1.png)
<figcaption>Solder bridge between pins 11 and 12</figcaption>
</figure>
