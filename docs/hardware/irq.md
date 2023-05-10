# Durango-X IRQ generation

## Caveats

Unlike most computers, where some _dedicated peripheral chip_ works as an **interrupt controller**, _latching_ the interrupt request
until _acknowledged_ by the CPU's ISR (Interrupt Service Routine), **Durango-X** uses a simple counter (U14) plus a few
_Schmitt-trigger_ gates for the generation of a brief pulse (around **10 µs**) for the IRQ input, as long as it's not disabled via
the _Interrupt Enable Port_ at `$DFAx`. Thus, no _acknowledge_ is possible or necessary.

Since the IRQ pulse is not latched, there is an increased risk of losing interrupts whenever some _critical code_ is executed with
interrupts _masked_ (via the `SEI` opcode), as other systems will service the pending request as soon as the interrupt mask is cleared.
This, however, shouldn't be a big deal, as _longer_ critical code may anyway lose some interrupts in other computers as they
usually won't _queue_ IRQs.

The real concern, though, is the **length** of the IRQ pulse, as it's generated in an **analogue** way thru an RC-network and a
Schmitt-trigger gate. Several factors, including component tolerances, may affect actual lenght which, by the way, is by no means
_constant_.

_more to come..._
