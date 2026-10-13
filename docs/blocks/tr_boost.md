# L1 `tr_boost`: transient-boost path (Rev C)

**Problem it solves:** in the baseline, a load step-up dips VOUT and turns MC off, so gate node X is
discharged only by the 20 µA sink (slew ≈ 20 µA / (Cc + C_gate) ≈ 2 V/µs). Undershoot therefore
hardly depended on C_L (Rev B: 295 mV at 100 pF vs 287 mV at 10 pF).

**Ports:** ibn (bias gate), ben (enable), i_bu, i_dz (bias currents from `bias_mirror`), x, vin, vout, vss.

## Three paths

| Path | What it does | Devices | Quiescent |
|---|---|---|---|
| **UB** (undershoot booster) | Cbu (0.5 pF) couples VOUT onto the gate of PMOS sensor MPB1, which is biased in weak inversion through Rbu = 1 MΩ from diode MPB0. A dip raises MPB1's current exponentially. A **dead zone** (20 µA sink `i_dz` vs 10 µA idle) keeps the pull-down off at rest; beyond it, MNB0 → MNB1 (×20) pulls X down through the `ben` switch | MPB0 LVT 40/0.5, MPB1 LVT 20/0.5, MNB0/1 2/0.5 (×20), MSW 10/0.15 | 20 µA (MPB0) + 10 µA |
| **OB** (dynamic bleeder) | The 100 µA minimum-load bleeder MND (5 × 4/1) has its gate AC-coupled to VOUT (Cbo 0.5 pF, Rbo 1 MΩ from `ibn`), so an overshoot raises its sink current. A side effect is that it damps the output pole: TT PM rises from 55.8° to 74.8° | MND nfet 4/1 ×5 | 100 µA (it *is* the bleeder) |
| **OBX** (X pull-up) | NMOS sensor MNS1 on the same coupled gate, a 20 µA PMOS dead zone, then MPO0 → MPO1 (×20, **std-Vt**) pull X up through the PMOS switch (gate = ben inverted) | MNS1 2/1, MPDZ LVT 40/0.5, MPO0/1 pfet 4/0.5 (×20), MPSW 20/0.15, `inv` | ~10 µA |

Flags `SIZES["boost"] = {ub, ob, obx}` remove paths for A/B studies. The `ben` pin disables UB
and OBX on silicon (OB always acts, because it is the bleeder).

## Results (TT, C_L = 20 pF, 0.1 ↔ 10 mA)

| | ben = 0 | **ben = 1** |
|---|---|---|
| Undershoot, 100 ns edge | 170 mV | **97 mV** |
| Undershoot, 10 ns edge | 472 mV | **221 mV** |
| Overshoot, 100 ns / 10 ns | 105 / 259 mV | 106 / 260 mV |
| L4 workload dip (1.3 → 9.6 mA, 10 ns) | 536 mV | **258 mV** |
| PVT worst undershoot 100 / 10 ns | 245 / 561 mV | **125 / 282 mV** |

## Lessons learned
- **The first OBX used LVT PMOS for the ×20 mirror.** At 125 °C its 80 µm of LVT leaked more than
  20 µA into X, pinned X high and broke regulation (VOUT = 1.06 V at 1 mA, fs/125 °C). Switching to
  std-Vt fixed it. Any device that must be *off* at rest on node X has to be std-Vt.
- Overshoot is C_L-limited, not X-limited. The waveform shows the pass gate cut off within about 15 ns,
  while VOUT peaks inside the 10 ns edge, so OBX buys only about 3 %.

**TODO:** replace the 1 MΩ resistors with pseudo-resistors or poly; Monte-Carlo on both dead zones
(offset vs. false triggering); couple the workload hint into UB as a feed-forward pre-charge; measure
the Iq cost vs. benefit for the paper.
