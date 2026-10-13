# L1 `ab_sense`: adaptive (load-tracking) bias (Rev D)

**Idea (after Zhan & Ki, TCAS-I 2010, adapted to the FVF):**
- Light-load phase margin needs UGF ≈ g_mc/(2π·Cc) to stay below the output pole g_mp/(2π·C_L), and g_mp collapses at light load.
- Rev C kept g_mp up with a fixed 100 µA bleeder. Rev D instead makes **MC's bias track the load**: small at light load (a slower, stable loop and low Iq), larger at heavy load (fast).

**Ports:** g (pass gate), o_x (sink at node X), o_rep (sink in the VSET replica path), vin, vss.

| Device | Type | W/L (µm) | Role |
|---|---|---|---|
| MS | pfet_01v8 | 1.4/0.35 | pass replica, 1/500 of the 700 µm pass device (same gate, source) → I_load/500 |
| MSD | nfet_01v8 | 4/1 | diode for the sensed current |
| MSX | nfet_01v8 | 4/1 | adds I_load/500 to the X-node sink, so MC current = 5 µA + I_load/500 |
| MSR | nfet_01v8 | 4/1 | adds the same current to the replica (`vset_gen` i_pd), so VSET tracks and VOUT doesn't shift |

At the same time, `bias_mirror` base outputs o_fvf and o_pd drop from 20 to 5 µA, and the
`tr_boost` bleeder MND drops from 100 to 40 µA.

## Results: Rev C → Rev D (TT, C_L = 20 pF)

| Metric | Rev C | **Rev D** |
|---|---|---|
| Iq | 270 µA | **163 µA** |
| PM @ 10 µA / 10 mA | 74.8° / 92.4° | **84.7°** / 91.3° |
| Line regulation @ 10 mA | 27.9 mV/V | **23.8 mV/V** |
| Load regulation | 1.0 mV/mA | 1.07 mV/mA |
| 100 ns step (boost on) | −98 / +107 mV | −118 / +130 mV |
| 10 ns step (boost on) | −234 / +260 mV | −254 / **+250 mV** |
| Workload dip (L4) | 329 mV | 334 mV |
| PSRR @ 1 MHz, 10 µA / 10 mA | −20.6 / −20.0 dB | −10.2 / −22.3 dB |
| Worst valid PVT PM | 46.8° | **25.2°** (fs, 125 °C, 1.8 V, 10 µA) |

**Trade-offs found:**
- **Light-load PSRR at 1 MHz** drops about 10 dB, because MC is biased lower.
- **Hot fs/ff light-load PM** drops (25–47° at 125 °C, 1.8 V). That is the onset of the pass-leakage
  regime (open issue 1) moving in now that the bleeder is smaller. Raising the bleeder to 80 µA only gives 33°.
  The intended fix is the hot-leakage clamp / gate driver, not a bigger bleeder.
- A longer-L pass (0.5 / 0.7 µm) to cut leakage was tried and rejected. VOUT at fs/125 °C/1.98 V only
  improved 1.41 → 1.35 V, while the 10 ns undershoot grew 254 → 330 mV.

**TODO:** MS placement/matching in layout; check the sense ratio's accuracy vs. Vds mismatch (MS Vsd ≈ 1.1 V vs. pass ≈ 0.6 V); consider a cascoded sense.
