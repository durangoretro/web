---
hide:
  - toc
---
[Home](../../../index.md) > [Getting Started](../../../started.md) > [Building](../../building.md) > [Durango·X](../durango.md) > **Troubleshooting**
___
# Troubleshooting guide

Since the **Durango-X** computer is based on off-the-shelf components, it's a
_rather complex_ circuit. On the other hand, every needed function can be clearly
located into specific components, _A gazillion things can go wrong_, of course,
but with some method and a few observations, any possible fault may be easily figured out.
A **multimeter** is _essential_ for basic probing; an **oscilloscope** (nothing especially fancy)
will be helpful, but not absolutely necessary. A **logic probe** can be quite useful, too.

Before any further investigation, a **visual inspection** may be helpful. Look for:

* **Short-circuits** on the board -- including from pads to _nearby **vias**_.
* Bad **solder joints**.
* **Bent** IC pins -- try _reseating_ any suspect IC.

!!! tip

	For better understanding of this document, you may want to have a look at the
	[Theory of Operation](../../../hard/dx/theory.md), although it's
	not really needed for troubleshooting.

## No signs of life (no LEDs nor picture)

Check **power supply** and power _switch_, if fitted. Measuring the voltage across
the _power pins_ of any IC (_usually_ 14/7, 16/8, 20/10 or 28/14 for +/-) should ideally
read out **between 4.75 and 5.25 volts**, although it should be fine with voltages
_as low as 4.5 V_ (prototypes have been running OK at a mere 4.25 V, even less!).

If measured voltage is way too low, and the power supply is trusted, check _resistance_
between the power pins (being careful with your meter's polarity!). Because of capacitors
charging up, you won't get an instant reading; but it should _asymptotically_ lead to around **9-10 kOhm**. Any _unusually low_ value might be caused, in rare cases, by **C7** or **C6**.

## Power LED lights up, but no sound or picture

* If an oscilloscope or a _very good_ multimeter is available, check for a **~24.5 MHz**
signal at **U15 pin 10** (74HC4040). If no good signal there: suspect **X1**.
* If there is, check for a somewhat asymmetric **~15.7 kHz** signal at **U15 pin 15**.
If not: suspect **U15**. If frequency is _exactly 12 kHz_: suspect **U17** (74HC21) as well.
* Check for a _quite asymmetric_ **~50 Hz** signal at **U19 pin 12**. If not:
suspect **U19** but if _more like 30.6 Hz_: suspect **U17** too.
* Check for **~15.7 kHz** at **U18 pin 6** and for **~50 Hz** at **U20 pin 6**.
Suspect these chips in case of failure. Those signals should show up (inverted)
at **U22 pins 11 and 14**, respectively.
* If an oscilloscope is available, look for a valid `CSYNC` signal at **U23 pin 6** --
or just _some activity_, near (but _not quite at_) 5 volts.

If all of the above signals look OK, it might be a problem in the _analogue_ section
of the video outpuct circuit. Use a multimeter to check the following voltages
(all referenced to **GND**). _They do not need to match **exactly** the specified values_
and will certainly be dependent of the actual _Power Supply voltage_, but any
deviation **over ~10%** is suspicious).

* First of all, verify **R19** (one pin will carry a valid 5 Vpp `CSYNC` signal
while the other should stay around **1 volt**.
* **5 Volts** between **C4**'s pins; check this and the _power supply_ otherwise.
* **1.6 Volts** at the _base_ (centre pin) of **Q4**; if not, suspect **R17, R18 or Q4**.
* **1 Volt** at the _emitter_ (right pin with the _flat_ side towards you) of **Q4**;
if not, and the above is correct, suspect **Q4 or R21**.
* **3 - 3.7 Volts** at the _base_ (centre pin) of **Q5** (actual value depends
on _overall picture brightness_); if not, suspect **R16 or Q5**._This very same
voltage should show up at the **collector** of Q4, leftmost pin_, as they're interconnected.
* **2.3 - 3 Volts** at the _emitter_ (right pin with the _flat_ side towards you)
of **Q5** (actually _~0.7 V below_ the above one); if not, suspect **Q5, R30 or C5**
(and, if the _second composite output_ is mounted, **R31 and C9** as well).

## Monitor detects valid signal, but screen is black

!!! note

	Lack of image (but good sync signals) is _likely_ to be a fault on some of the
	following items but, if nothing seems to fix the problem, check **U2 _SRAM_ and U6** as well.

Check logic level at **U321 pin 11** for currently set video mode: "1" (~5 V)
for HIRES, "0" for colour. If this pin lacks a _stable_ value, suspect **U428 or U321**.
Once the current _video mode_ is determined, check the following:

### HIRES mode

_After checking **R220**_ in the very first place, look for activity at the
following pins, preferably **in this order**:

* **~6.1 MHz** signal at **U16 pin 9** (suspect **U15**) and **U224 pin 7** (suspect **U16**)
* **767 kHz** _square_ wave at **U16 pin 5** (suspect **U15**) and **U321 pin 13** (suspect **U16**)
* Same **767 kHz** at **U22 pin 9** (suspect **U321**)
* **U321 pin 3**, like `CSYNC` but quite more symmetric, _near 2.6 Volts_
(suspect **U16**, maybe **U15 and/or U19**)
* **U22 pin 4**, like the above (suspect **U321**, maybe **U428**)
* **U227 pin 10**, again like the previous signal (suspect **U22**)
* **767 kHz** _asymmetric_ signal at **U224 pin 15**, maybe measuring _near 4.7 Volts_
(suspect **U227 or U15**)
* **U23 pin 9** (suspect **U224** or _R824_ if fitted)
* **U227 pin 9** (suspect **U23 or RV231**)
* **U23 pin 12** (suspect **U227** or _R825_ if fitted) and **pin 11**
(U23 itself or _R220_ is to blame)

### Colour mode

_After checking **R107-114**_ in the very first place, look for activity at the following pins:

* **~1.5 MHz** _square_ wave at **U124 pin 11** and **U321 pin 14**
(suspect **U16** or even **U15**)
* Same signal at **U22 pin 9** (suspect **U321**)
* **U321 pin 5**, like `CSYNC` but quite more symmetric, _near 2.6 Volts_
(suspect **U16**, maybe **U15 and/or U19**)
* **U22 pin 5**, like the above (suspect **U321**)
* **U127 pin 19**, again like the previous signal (suspect **U22 or RV128**)
* **U124 pins 12-19** should show activity in _some_ of them, unless a completely
blank screen is on display -- powering up _without_ cartridge should create
a **random image** in case of doubt, adequate for this test.
* Similar but somewhat faster activity at **U126 pins 1, 4, 9 & 12** (suspect **U125**)
* Pretty much the same at **U127 pins 2-9** (suspect **U126**)
* A similar kind of signal, but _interrupted_ every ~64 µs, should show up at **U127 pins 11-18**.

## Garbage is displayed, but no further activity

* Check `/RESET` signal (**U1** _CPU_ pin 40), upon powerup _should go low for
a split second and then become (and **stay**) high_.
	* If it doesn't, but the computer operates normally after pressing the `RESET` button:
	suspect **C1**, perhaps **R3**.
	* If it stays _low_ all the time: suspect **U8** (74HC132) and/or **C1**.
	* If `RESET` button makes no effect: suspect **U8** (74HC132).
		* In any case, if while holding `RESET` the `ERROR` LED does NOT stay lit:
		suspect **U8** (74HC132) or **U12**(74HC74).
* If an oscilloscope or a _good_ multimeter is available, check for a **~1.5 MHz** signal at `VCLK` (**U1** _CPU_ pin 37). If no good signal there: suspect  **U16** (74HC02), perhaps **U15** (74HC4040).
* Try another cartridge and/or **U2** _SRAM_ (displayed pattern is likely to change between different SRAM pieces). _Running without a **valid** cartridge may display similar symptoms_.
* **U1** _65C02 CPU_ might be dead, too. Look for an irregular signal at **U1** _CPU_ pin 7, **around 450 kHz** (will vary widely) and, if possible, **activity at _address_ pins** (9-20 and 22-25), especially the _lowest_ ones
* If of the above looks OK: suspect **U9** (74HC00). Check **U6** (74HC157) as well.

## Erratic behaviour (LEDs flashing, garbage on screen, chirpy sounds...)

Suspect **U10** (74HC139)

## Software appears to start up, but no keyboard of gamepad effect at all. IRQ test fails.

Check `ERROR` LED. If lit: suspect **U12** (74HC74). Otherwise suspect **U8** (74HC132) or **U14** (74HC4040)

## Poor/no keyboard/gamepad response and/or erratic timing on some software

This is likely to be an [interrupt problem](hardware/irq.md).

## Computer runs OK, but colour programs go instead into greyscale mode

If Durango-X cannot go into **_RGB_ colour mode**, or doesn't stay reliably in it, first of all make certain that **U321 pin 9** is at _logic "1"_ (~5 V). If so, check **Q306** (its _emitter_ should measure at around **4.3 V**) and **R122**. _Some TVs may be quite picky about this resistor's value_, thus you may want to try a **lower value (say, _100 ohms_)**.

!!! warning

	In _RGB mode_, **R122** accounts for almost **one third** of Durango's power consumption. _Lowering_ the resistor's value will draw further power, thus make sure you're using a _properly dimensioned_ Power Supply.

## Marginal picture quality, with choppy pixels, ghost lines...

As the timing of the video circuitry is _very tight_, some adjustments have been provided. See [Video Output Calibration](software/vdu_calib.md) for details.

## Apparently running but chunks of valid image, maybe repeated on the screen; perhaps affecting just one video mode

* Check **U7** and/or **U6**. Depending on affected video mode, check also:
	* **U104/105** for colour mode.
	* **U204/205** for HIRES.

!!! tip

	Swapping ICs between each pair might help detecting the malfunctioning chip. While **U6/U7** are specified as _74HC157_, you may use **74HC257** as well.

## Picture OK, but distorted sound or no sound at all

* Check **U12** and, most importantly, **Q3**. Check **D2, R4, R5, C2 and C3** as well.
* Rarely, **D7** might cause problems; _you may remove it_ with no more effect than losing the _audio feedback_ during Raspberry Pi transfers.
* If the internal _buzzer_ is being used: check **R23** (and the buzzer itself). _Weak power supplies may be troublesome while using the internal buzzer_.

!!! note

	Some cartridges may include **custom sound hardware**. If so, check **D3** or try another sound-enabled cartridge.
