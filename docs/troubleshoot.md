---
hide:
  - navigation
  - toc
---
# Troubleshooting guide

Since the **Durango-X** computer is based on off-the-shelf components, it's a _rather complex_ circuit.
On the other hand, every needed function can be clearly located into specific components, _A zillion things can go wrong_,
of course, but with some method and a few observations, any possible fault may be figured out easily. A **multimeter** is
_essential_ for basic probing; an **oscilloscope** (nothing especially fancy) will be helpful, but not absolutely necessary.
A **logic probe** can be quite useful, too.

Before any further investigation, a **visual inspection** may be helpful. Look for:

* **Short-circuits** on the board.
* Bad **solder joints**.
* **Bent** IC pins -- try _reseating_ any suspect IC.
 
## No signs of life (no LEDs nor picture)

Check **power supply** and power _switch_, if fitted. Measuring the voltage across the _power pins_ of any IC (_usually_ 14/7,
16/8, 20/10 or 28/14 for +/-) should ideally read out **between 4.75 and 5.25 volts**, although it should be fine with voltages
_as low as 4.5 V_ (prototypes have been running OK at a mere 4.25 V, even less!).

If measured voltage is way too low, and the power supply is trusted, check _resistance_ between the power pins (being careful with polarity!). Because of capacitors charging up, you won't get an instant reading; but it should _asymptotically_ lead to around **9-10 kOhm**.

## Power LED lights up, but no sound or picture

* If an oscilloscope or a _very good_ multimeter is available, check for a **~24.5 MHz** signal at **U15 pin 10** (74HC4040). If no good signal there: suspect **X1**.
* If there is, check for a somewhat asymmetric **~15.7 kHz** signal at **U15 pin 15**. If not: suspect **U15**. If frequency is _exactly 12 kHz_: suspect **U17** (74HC21) as well.
* Check for a _quite asymmetric_ **~50 Hz** signal at **U19 pin 12**. If not: suspect **U19** but if _more like 30.6 Hz_: suspect **U17** too.
* Check for **~15.7 kHz** at **U18 pin 6** and for **~50 Hz** at **U20 pin 6**. Suspect these chips in case of failure. Those signals should show up (inverted) at **U22 pins 11 and 14**, respectively.
* If an oscilloscope is available, look for a valid `CSYNC` signal at **U23 pin 6** -- or just _some activity_, near (but _not quite at_) 5 volts.

If all of the above signals look OK, it might be a problem in the _analogue_ section of the video outpuct circuit. Use a multimeter to check the following voltages (all referenced to **GND**). _They do not need to match **exactly** the specified values_ and will certainly be dependent of the current _Power Supply voltage_, but any deviation **over ~10%** is suspicious).

* First of all, verify **R19** (one pin will carry a valid `CSYNC` signal while the other should stay around **1 volt**.
* **5 Volts** between **C4**'s pins; check this and the _power supply_ otherwise.
* **1.6 Volts** at the _base_ (centre pin) of **Q4**; if not, suspect **R17, R18 or Q4**.
* **1 Volt** at the _emitter_ (right pin with the _flat_ side towards you) of **Q4**; if not, and the above is correct, suspect **Q4 or R21**.
* **3.6 Volts** at the _base_ (centre pin) of **Q5**; if not, suspect **R16 or Q5**.
* **3 Volts** at the _emitter_ (right pin with the _flat_ side towards you) of **Q5**; if not, suspect **Q5, R30 or C5** (and, if the _second composite output_ is mounted, **R31 and C9** as well).

## Monitor detects valid signal, but screen is black

!!! note

	Lack of image (but good sync signals) is _likely_ to be a fault on some of the following items but, if nothing seems to fix the problem, check **U2 _SRAM_ and U6** as well.
	
Check logic level at **U321 pin 11** for currently set video mode: "1" (~5 V) for HIRES, "0" for colour. If this pin lacks a _stable_ value, suspect **U428 or U321**. Once the current _video mode_ is determined, check the following:

### HIRES mode

_After checking **R220**_ in the very first place, look for _some activity_ at the following pins, **in this order**:

* **U23 pin 11** (U23 itself or _R220_ is to blame)
* **U23 pin 12** (suspect **U227** or _R825_ if fitted)
* **U227 pin 9** (suspect **U23 or RV231**)
* **U227 pin 10**, like `CSYNC` but quite more symmetric, _near 2.5 Volts_ (suspect **U22**)
* **U22 pin 4**, like the above (suspect **U321**)
* **U321 pin 3**, again like the previous signal (suspect **U16**, maybe **U15 and/or U19**)
* **768 kHz** _square_ wave at **U22 pin 9** (suspect **U321, U16 or U15** in that order)
* **U23 pin 9** (suspect **U224** or _R824_ if fitted)
* **~6.1 MHz** signal at **U224 pin 7** (suspect **U16**)
* **~6.1 MHz** signal at **U16 pin 10** (suspect **U16**) and **pin 9** (suspect **U15**)
* **768 kHz** _asymmetric_ signal at **U224 pin 15** (suspect **U227 or U15**)

### Colour mode

Look for activity at the following pins:

* **~1.5 MHz** _square_ wave at **U124 pin 11** (suspect **U16** or even **U15**)
* Same signal at **U22 pin 9** (suspect **U321**)
* **U127 pin 19**, like `CSYNC` but quite more symmetric, _near 2.5 Volts_ (suspect **U22 or RV128**)
* **U22 pin 5**, like the above (suspect **U321**)
* **U321 pin 5**, again like the previous signal (suspect **U16**, maybe **U15 and/or U19**)
* **U127 pins 11-18** should show activity in _some_ of them, unless a completely blank screen is on display -- powering up _without_ cartridge should create a **random image** in case of doubt, ideal for this test. All these lines will _float_ ocasionally.
* A similar kind of signal (but _never_ floating) should show up at **U127 pins 2-9** (suspect **U126**)
* Pretty much the same at **U126 pins 1, 4, 9 & 12** (suspect **U125**)
* Similar but somewhat slower activity at **U124 pins 12-19**.

## Garbage is displayed, but no further activity

* Check `/RESET` signal (**U1** _CPU_ pin 40), upon powerup _should stay low for a split second and then become (and **stay**) high_.
	* If it doesn't, but the computer operates normally after pressing the `RESET` button: suspect **C1**, perhaps **R3**.
	* If `RESET` button shows no effect _(including the `ERROR` LED lit while held)_: suspect **U8** (74HC132).
* If an oscilloscope or a _good_ multimeter is available, check for a **~1.5 MHz** signal at `VCLK` (**U1** _CPU_ pin 37). If no good signal there: suspect  **U16** (74HC02), perhaps **U15** (74HC4040).
* Try another cartridge and/or **U2** _SRAM_. If no better: suspect **U9** (74HC00). Check **U6** (74HC157) as well.

## Erratic behaviour (LEDs flashing, garbage on screen, chirpy sounds...)

Suspect **U10** (74HC139)

## Software appears to start up, but no keyboard of gamepad effect at all

Check `ERROR` LED. If lit: suspect **U12** (74HC74). Otherwise suspect **U8** (74HC132) or **U14** (74HC4040)

## Poor/no keyboard/gamepad response and/or erratic timing on some software

This is likely to be an [interrupt problem](hardware/irq.md).

