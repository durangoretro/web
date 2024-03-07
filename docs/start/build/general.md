[Site map](../../sitemap.md))
[Home](../../index.md) > [Getting Started](../../started.md) > [Building _Durango·X_](../building.md) > **General advice**

---
# General advice for assembly

!!! warning

	This a **VERY COMPLEX** project (especially the _computer_ board, now with **over 1000 pads** to be soldered). This is **NOT** an ideal project to learn soldering techniques! You've been warned...
	In any case, **take your time**, read throughfully all the directions FIRST, then start building step-by-step as indicated -- and be **patient**!.

!!! danger

	**Soldering** is a risky activity! From **severe burns** to **toxic fumes inhalation** and MANY other hazards! _Make sure you follow **ALL of the Safety Advice** stated on this document_ BEFORE attempting any soldering!

## Tools and materials

-	Obviously, you'll need a [**soldering iron**](https://www.amazon.com/Hakko-FX8801-01-Soldador-punta-soldadura/dp/B00N3M318A/). Doesn't need to be a fancy one, but you'll definitely need a **very fine tip** -- some people prefer the _chisel-shaped_ ones. **Temperature regulation** is not essential, but might be helpful -- some pads are connected to broad _ground planes_, which do "stole" quite a bit of heat from the iron. In case a _fixed power_ iron is used, anything between **11 and 30 Watts** seems suitable.
-	About **solder (tin)** itself, since these are very _dense_ boards, **fine (~0.5 mm) solder wire** is recommended; however, thicker wire **(~1 mm)** may be useful for bigger joints (connectors etc). _Depending on your local regulations and health concerns_, you might use **leaded or lead-free** solder; the latter will need somewhat _higher temperatures_ and may require some extra experience (this is NOT a project for newbies, anyway). _Most solder wire nowadays include a **flux** core for easier soldering_.
	-	If **leaded solder** is to be used, make certain proper **safety procedures** are used: the use of **gloves** is recommended and, of course, do **wash** your hands throughly after a soldering session.
-	_In any case_, **avoid inhaling fumes** (actually from the _flux_ core inside most soldering wires) by working in a **well ventilated area** or using a suitable [**fume extractor**](https://www.amazon.com/Extractor-Absorber-Portable-Filter-Soldering-Fan-Extraction-Prevention/dp/B099ZN8TRJ/)! _This is a MUCH bigger concern than the use of leaded solder_, by the way.
-	[**Flux**](https://www.amazon.com/JBC-548074021-Flux-soldadura-Fl-15/dp/B00CIOVF8W/) is not essential, but sometimes helpful as it cleans the soldering surfaces. **Fumes are harmful**, thus check the _ventilation_ advice above.
-	On projects of such complexity, _errors_ are to be expected... Some way to **desolder** components is really helpful:
	-	A [**desoldering pump**](https://www.amazon.com/Weller-7874B-ESD-Safe-Desoldering-Aluminum/dp/B00DKYNKPK) is a cheap and relatively efficient way for casual desoldering.
 	-	A [**desoldering iron**](https://www.amazon.com/RadioShack-45-Watt-Desoldering-Iron/dp/B007Z7MNEM/) combines a regular iron with a (usually bulb-operated) pump, for convenience.
	-	[**Solder wick**](https://www.amazon.com/MG-Chemicals-limpieza-Desoldering-longitud/dp/B008O9WMNM/) is somewhat slower, but usually gives the best finish. _Adding liquid flux to the braid may improve performance_, especially when using lower-priced wicks.
	-	For _higher volume_ and **utmost convenience**, a [**desoldering station**](https://eleshop.eu/zd-8915-desoldering-station.html) is best -- at a price.

## Soldering advice

Besides following all of the **safety advice**, it is assumed that _you already have some experience with soldering_, as this is NOT a project for newbies... In any case, here are some general advice:

-	Place one or more components on the board (**component side**, where the outlines and _values_ are silkscreened). Since soldering is done _on the opposite side_ (where the _component designators_ are the only silkscreen) _you need some way to preclude components from **falling off** the board_: adhesive tape, _blue tack_ or even a suitable rag are helpful. **Do NOT _bend_ component leads** as tempting as it may look, since that will make future repairs WAY more difficult.
-	_Take your time_ on each solder joint! The usual procedure is:
		1.	Put the soldering iron _heating both the **pad** and the component **lead**_ for a couple of seconds.
		1.	Apply the solder wire to the heated pad -- _never_ on the iron tip! It should melt and flow easily around the pad, perhaps a tiny movement of the soldering iron might help.
			-	Some pads are connected thru `Vcc` or `GND` to broad _ground planes_. Depending on your soldering iron and the particular tip, these pads might need a few seconds more to heat up properly.
			-	If solder does not "embrace" the pad, but forms a "ball" besides the component lead, you probably need some **cleaning** on the surfaces. A previous wipe with **Iso-Propyl Alcohol** is useful in these cases, as is the use of **flux** before soldering.
		1.	After removing the solder wire, **keep the iron for a couple of seconds** to let the solder flow completely. _Power and ground pins may need a longer time here_; as a rule of thumb, keep the iron _after_ soldering as long as it was preheating the pad _before_.
		1.	Check (at least from time to time) the **quality** of your solder joint: it should look _shiny_, not matte. **Reflowing the solder joint** (repeating the step above) will usually fix a rushed soldering work and may avoid future malfunction. _Beware of **short circuits**_ between nearby pads!
-	For components with _several pins (e.g. integrated circuits, sockets, resistor packs etc) it's best

## Build procedure

1.	First of all, [get the desired PCB(s)](pcb.md). _Take note of the **version number** on the silkscreen_, as well as the desired _build option_ (if available), since both the _BOM_ and required **fixes** may change between revisions! Don't forget to read the appropriate **_Hacks & Fixes_** document linked on each _step-by-step_ page.
1.	Get the components as stated on the _BOM_, having into account the **selected option** and **revision number**, if available!
1.	Proceed with **soldering**, _following each and every **safety advice**_ as stated above! For best results, fit the components in **reverse _height_ order** -- that is, place **shallower components _first_**, and let the _tallest_ ones for the end. Generally speaking this order results in:
	1.	**Horizontally** mounted axial components, like _resistors and diodes_ (e.g. on the _Keyboard_ PCB)
    1.	IC sockets and _resistor packs_. Very _**small** capacitors_ are likely to be fitted now as well.
	1.	_Pin sockets_ and **small connectors**. Note that the _expansion_ connector on the Durango PCB must be mounted **absolutely flush!!!**
    1.	**Vertically** mounted components: resistors, diodes, transistors and _small_ electrolytic capacitors.
    	-	**Beware of _polarity_!** Most _resistor packs_ have a **dot** on the _common_ pin, _diodes and electrolytic caps_ have a **band** near the _negative_ pin; for _transistors_, check the **outline** on the silkscreen. On _LEDs_, the negative side is the shorter **lead**; usually they have a flatter capusule near that lead.
	1.	_Pin headers_ are usually fitted now, depending on height.
  	1.	_Power resistors_ (like `R27` on the Durango·X PCB, if fitted) are somewhat taller and thus mounted afterwards. Ditto for taller capacitors -- just sort everything by height.
	1.	_**Big** connectors_ usually go last.
