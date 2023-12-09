[Site map](../sitemap.md))
[Home](../index.md) > [Development & Tools](../tools.md) > **Languages**

---
# Languages to create Durango software

## Assembly

**Assembly** language is, in other words, the only _machine code_ that the 65C02 CPU
understands; but instead of dealing with _binary_ or _hexadecimal_ codes, each
[**opcode**](http://www.6502.org/tutorials/6502opcodes.html) (including the
[65C02 extensions](http://www.6502.org/tutorials/65c02opcodes.html))
is represented by an _abbreviation_ (a.k.a. **mnemonic**) to make things easier
(or, at least, _less difficult_) to human beings.

In order to translate the **source code** (a _text_ file with the desired _mnemonics_
and their _operands_) into the **binary** code to be executed by the CPU, an **assembler**
program is recommended; although it's possible to _manually_ translate mnemonics
into the equivalent _sequence of bytes_, and "poke" them into memory thru a simple
[**monitor utility**](6502/nanomon.md), the use of an assembler is way easier.

!!! note

	Unlike modern CPUs, the 65C02 was **intended** to be programmed in assembly
	**by humans**_, thus the _Programmer's model_ is quite simple, and there are
	no _intrinsics_ to be considered at all.

Assembly _source code_ files usually bear a `.s` extension. Most of the assembly code
for the Durango Project can be assembled with André Fachat's
[XA65 cross assembler](https://www.floodgap.com/retrotech/xa/)
([GitHub repository](https://github.com/fachat/xa65)). However, for simple routines
and learning purposes, the more limited [miniMoDA](6502/minimoda.md) may be used
_in situ_ as well.

!!! tip

	Since this language is _natively understood_ by the CPU, it's **potentially the MOST
	efficient and powerful way**, in both memory usage and, especially, **execution speed**.
	On the other hand, _debugging_ and _development_ may be harsher; but with all the
	[tools](../tools.md) we supply, both [for Durango itself](insitu.md) and
	[for the host computer](tools.md), this is less of an issue.

## BASIC

**BASIC** (for _Beginner's All-purpose Symbolic Instruction Code_) was, by far and large,
the **most popular** language back to the 8-bit _home-computer_ era, to which _Durango·X_
plays homage. In use since 1964, it makes programming _quite simple and accesible_
to newcomers and non-technical people (much like
[Python](https://en.wikipedia.org/wiki/Python_(programming_language)) does today),
even if it's far from being the best in _code structure_ and, especially, _execution speed_,
as this is an **interpreted language**, thus every sentence is translated into
machine code _on the fly_.

### [EhBASIC](http://retro.hansotten.nl/6502-sbc/lee-davison-web-site/enhanced-6502-basic/)

This is the first (and as of December 2023, the _only_ one) port of BASIC for the
**Durango·X** computer. Developed at [6502.org](http://www.6502.org) by the late
[Lee Davidson](http://forum.6502.org/viewforum.php?f=5), it's a barebones, _portable_
version of the 6502 MS-BASIC dialect (the _de facto_ standard in many 8-bit computers,
especially _Commodore_); but [our port](lang/ehbasic.md) adds **support for _Durango·X_
graphics, colour and sound** plus **LOAD and SAVE** capabilities, both for the
[Virtual Serial Port](../assets/bin/basic_vsp.dux) if under _Perdita_ emulation, or even
[on an **actual SD card**](../assets/bin/basic_sd.dux) on _real hardware_ with any supported
storage interface (devCart, FastSPI...). _A **plug-in** architecture makes supporting
new storage devices an **easy** task_.

!!! note

	Unlike most BASICs of the day, which saved programs in a _tokenised_ form,
	our EhBASIC port saves and load in **ASCII** form for easier interaction
	with modern computers.

It's definitely a **quite complex** project, but you can have a look at the
[source code](https://github.com/zuiko21/minimOS/tree/master/forge/eh_basic)
if so desired _(in constant development, may be moved)_.

### [BBC BASIC](https://en.wikipedia.org/wiki/BBC_BASIC)

Allegedly **the best dialect** of this language, originally developed by
[Sophie Wilson](https://en.wikipedia.org/wiki/Sophie_Wilson) for the **BBC's**
ambitious [computer](https://en.wikipedia.org/wiki/BBC_Micro) education project.
However, **this is _not_ yet ported** to the Durango architecture, but we're
willing to do so, as soon as possible. [Contributions welcome](../community.md)!

### [GfA BASIC](https://en.wikipedia.org/wiki/GFA_BASIC)

A _very nice **IDE**_ for this language from a more recent era, originally developed
for the [Atari ST](https://en.wikipedia.org/wiki/Atari_ST) range of computers.
Once again, **this is _not_ yet ported** to Durango, and definitely looks like a
_really ambitious project_, but **quite attractive** as well. As always,
[contributions are welcome](../community.md)!

## [_C_](https://en.wikipedia.org/wiki/C_(programming_language))

A popular **system's programming language** (and the reason behind UNIX's popularity)
which is credited with **fast execution** plus all the advantages of a _compiled_ language.
Even if it's a bit overshadowed nowadays by more _user friendly_ alternatives,
it's a reasonable compromise of **easiness of programming** and **execution efficiency**,
halfway between the fast, but hard _assembly_ and the friendly, but slow _BASIC_.

### [CC65](https://cc65.github.io/)

This is one of the very few _C compilers_ with **6502 CPU suport**. Although the originally
targeted machines were popular computers from the 8-bit era, we are developing
**Durango·X** support, thru an **user-friendly** [_DurangoLib_](lang/durangolib.md)
library.

## [Future developments](lang/other.md)

Of course, we aren't limited to these languages; as with any other computer systems,
_all kind of languages can be ported to Durango·X_, although sometimes its limited
resources could be an issue.

There are strong plans to port [LOGO](https://en.wikipedia.org/wiki/Logo_(programming_language))
to the _Durango·X_ computer, for **educational** purposes.

There's even a _proof-of-concept_ of a **Python**
port, although no further work has been done.
