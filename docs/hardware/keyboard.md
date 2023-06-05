# Keyboard and Controller pad interface

<figure markdown>
![Durango KeyBoard & Gamepad Board](../assets/img/keyboard.png)
<figcaption>Durango KeyBoard & Gamepad Board</figcaption>
</figure>

Using the "Expansion connector" you can daisy-chain up to 16 devices; some peripherals may integrate several of these devices, like the **Keyboard and Gamepad controller** interface board intended as standard.

## Gamepads

This board provides a **40-key keyboard** and **_two_ gamepad ports**, which are available in _two flavours_:

* NES Flavour; you can connect up to two NES controllers pad using NES connectors.
* MD/Atari flavour; you can connect up to two Mega Drive/Genesis/Atari controllers using DE-9 connectors.

!!! bug

	Current revision (v1 2022·11) of the _Keyboard/Gamepad Interface_ has **two known bugs**:
	
	* The keyboard silkscreen shows `(` where `)` should be.
	* The **Mega Drive** version controller does _not_ work; a [workaround](md_fix.md) has been made, but it swaps the `START` and `C` buttons.
	
	_All of these will be fixed in the next revision (most likely v1.3)_

## Keyboard

The keyboard interface is _electrically compatible with the **Sinclair ZX Spectrum**_ keyboard matrix; room for the 5-pin and 8-pin sockets is provided in the board, allowing the use of a Sinclair _or any other compatible **5x8 matrix** keyboard_. With suitable connectors, the keys on the board may be connected to a ZX Spectrum, too!

### Layout

Not only the electrical connections, but the _key layout_ closely follows that of the **ZX Spectrum** as well, thus will seem familiar to former users of the famous British computer; younger people may find it a bit _idiosyncratic_, though.

Notable differences are:

* Access to _localised **Spanish** characters_. Most notably, the `;` character had to be moved to the `ALT`+`S` combo.
* More conventional `SHIFT` and `ALT` modifiers, instead of the original _CAPS SHIFT_ and _SYMBOL SHIFT_.
* `CONTROL` key is replaced by a **CONTROL _mode_** via `SHIFT`+`9` key combo (similarly to the Spectrum's _GRAPHIC_ mode).

Other than that, key silkscreen follows the usual conventions: use `SHIFT` for capitals and the _upper_ character, use `ALT` for the character at _right_. There's no `CAPS LOCK` nor _dead keys_.

### Overlay

For convenience, improved tactile feel and larger silkscreen, an _optional_ **overlay** board has been designed, and will fit suitable holes on the keyboard PCB.

<figure markdown>
![Durango Keyboard overlay](../assets/img/overlay.jpg)
<figcaption>Render of Durango Keyboard Overlay</figcaption>
</figure>
