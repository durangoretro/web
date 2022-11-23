---
template: overrides/home.html
---
# Getting Started

Here you cand find information about how to Start with the Durango Computer

## Built your own Durango

IF you want to Create a new Durango Computer, you need to download the Blueprints and obtain the components; you can find the blueprints in the next link.

[https://github.com/zuiko21/minimOS/tree/master/hard/kicad/durango/full](https://github.com/zuiko21/minimOS/tree/master/hard/kicad/durango/full)

To open the blueprints, you need the [Kicad](https://www.kicad.org/) application.

You will need the Symbols library for this project:

[https://github.com/zuiko21/minimOS/tree/master/hard/kicad/symbols](https://github.com/zuiko21/minimOS/tree/master/hard/kicad/symbols)

You can see in Kicad an image similar to:

<figure markdown>
![Durango Computer](assets/img/durango1.jpg)
<figcaption>Durango PCB with components</figcaption>
</figure>


## Bill of Materials
### Durango Main Board
#### Sockets
* 14 pins (x9)
* 16 pins (x19)
* 20 pins (x5)
* 28 pins (x1)
* 40 pins (x1)

#### Analog devices
* 10  uF (x2)
* 100 nF (x2)
* 100 uF (x3)
* 470 uF (x1)
* 68  pF (x1)
* 1N4148 (x5)
* BC548  (x6)

#### Integrateds
* 24.576 MHz (x1)
* 62C02    (x1)
* 27C256   (x1)
* 74HC157  (x4)
* 74HC132  (x1)
* 74HC00   (x1)
* 74HC139  (x2)
* 74HC688  (x1)
* 74HC74   (x1)
* 74HC32   (x1)
* 74HC4040 (x3)
* 74HC02   (x1)
* 74HC21   (x1)
* 74HC85   (x2)
* 74HC175  (x1)
* 74HC86   (x2)
* 74HC245  (x3)
* 74HC257  (x4)
* 74HC574  (x1)
* 74HC166  (x1)
* 74HC20   (x1)
* 74HC174  (x1)
* 74HC367  (x1)

### Others
* Red LED (x1)
* Green LED (x1)
* Buzzer (x1)
* Button (x2)

### Keyboard & Gamepads Board

The KeyBoard & GamePads Board, allow to use a integrated KeyBoard and connect GamePads (MegaDrive/Atari 2600 or NES GamePads Compatible).

<figure markdown>
![Durango KeyBoard & Gamepad Board](assets/img/keyboard.jpg)
<figcaption>Durango KeyBoard & Gamepad Board</figcaption>
</figure>

Here you can find the Cartidge for built each Rom:

[https://github.com/zuiko21/minimOS/tree/master/hard/kicad/durango/cartridges/cart28p](https://github.com/zuiko21/minimOS/tree/master/hard/kicad/durango/cartridges/cart28p)


## Built Software for Durango

If you want to built your own Durango Software (like Games or applications), you don't need a Durango to Built Software.

We built some Tools for improve the development of software with Durango. Like:

* Emulator
* Friendly Use C Library (Durango Lib)
* Durango Docker Image
* Visual Studio Code Extensión (Durango Code)

You can use the Durango Emulator (Perdita), to test your ROMs and play Durango Games; or use the development tools for create your own Durango Applications.

You can find them in the [Development & Tools section](/tools/development/).
