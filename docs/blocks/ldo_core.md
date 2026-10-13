# L2 `ldo_core`: complete FVF regulation loop

**Ports:** vref, ibn (20 µA in), ben (boost enable), vout, vin, vss.
**Contains:** `bias_mirror`, `vset_gen`, `fvf_core`, `lg_probe`, `pass_pmos`, `comp_rc`, `tr_boost`.

## Results, Rev C (TT, 27 °C, VIN 1.8 V, VREF 1.2 V, C_L = 20 pF)

| Testbench | Metric | Value |
|---|---|---|
| `tb_ldo_core_dc` | VOUT @ 1 mA | 1.2164 V (+16 mV vs VREF) |
| | Load regulation 0–10 mA | 1.0 mV/mA |
| | Line regulation @ 10 mA | 27.9 mV/V |
| | Iq (no load) | 270 µA |
| | Dropout @ 10 mA (Rev A0 flat) | ≈ 400 mV |
| `tb_ldo_core_ac` | Loop gain DC | 58.9–65.9 dB |
| | UGF | 13 MHz (10 µA) … 238 MHz (10 mA) |
| | PM | 74.8° (10 µA), 79.9°, 88.9°, 90.9°, 92.4° (10 mA) |
| | PSRR | −31 dB @ 1 kHz, −20 dB @ 1 MHz |
| `tb_ldo_core_tran` | 0.1↔10 mA, 100 ns, boost on | −97 / +106 mV |
| | 0.1↔10 mA, 10 ns, boost on | −221 / +260 mV |
| | boost off (`ben` = 0) | −170 / +105 mV (100 ns), −472 / +259 mV (10 ns) |

## PVT (`scripts/run_corners.sh` + `scripts/corner_summary.py`, 45 points × 5 loads)
- Worst valid PM: **46.8°** (fs, 125 °C, 1.8 V, 10 µA).
- **5 invalid points** (ff/fs, 125 °C, 1.98 V, loads ≤ 100 µA, plus fs at 1 mA): regulation is lost from
  pass-device leakage (open issue 1).
- Worst undershoot with boost on: 125 mV (100 ns), 282 mV (10 ns), both at ss/125 °C/1.62 V.
- Worst overshoot with boost on: 139 mV (100 ns), 321 mV (10 ns).

Iq breakdown (≈ 270 µA): ref 20, X sink 20, replica (MPD 20 + MPS 20), OTA tail 40,
bleeder MND 100, UB (20 + 10), OBX ≈ 10–20.

**TODO:** open issues 1, 3, 4 and 5 in `docs/PROGRESS.md`; startup behavior (VIN ramp); VREF-step response.
