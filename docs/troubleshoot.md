---
template: overrides/home.html
---
# Troubleshooting guide

Since the **Durango-X** computer is based on off-the-shelf components, it's a _rather complex_ circuit.
On the other hand, every needed function can be clearly located into specific components, _A zillion things can go wrong_,
of course, but with some method and a few observations, any possible fault may be figured out easily. A **multimeter** is
_essential_ for basic probing; an **oscilloscope** (nothing especially fancy) will be helpful, but not absolutely necessary.

## No signs of life (no LEDs nor picture)

Check **power supply** and power _switch_, if fitted. Measuring the voltage across the _power pins_ of any IC (_usually_ 14/7,
16/8, 20/10 or 28/14 for +/-) should ideally read out **between 4.75 and 5.25 volts**, although it should be fine with voltages
_as low as 4.5 V_ (prototypes have been running OK at a mere 4.25 V, even less!)

## Power LED lights up, but no sound or picture

