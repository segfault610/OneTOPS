# L2 `ldo_core`: complete FVF regulation loop

**Ports:** vref, ibn (20 µA in), ben (boost enable), vout, vin, vss.
**Contains:** `bias_mirror`, `vset_gen`, `fvf_core`, `lg_probe`, `pass_pmos`, `comp_rc`, `tr_boost`, `ab_sense` (Rev D).

## Results, Rev D (TT, 27 °C, VIN 1.8 V, VREF 1.2 V, C_L = 20 pF)

| Testbench | Metric | Value |
|---|---|---|
| `tb_ldo_core_dc` | VOUT @ 1 mA | 1.2155 V (+15.5 mV vs VREF) |
| | Load regulation 0–10 mA | 1.07 mV/mA |
| | Line regulation @ 10 mA | 23.8 mV/V |
| | Iq (no load) | **163 µA** |
| `tb_ldo_core_ac` | Loop gain DC | 59.2–66.0 dB |
| | UGF | 5.1 MHz (10 µA) … 235 MHz (10 mA) |
| | PM | 84.7° (10 µA), 88.0°, 91.2°, 90.6°, 91.3° (10 mA) |
| | PSRR @ 1 kHz | −29 … −32 dB |
| | PSRR @ 1 MHz | −10.2 dB (10 µA) … −22.3 dB (10 mA) |
| `tb_ldo_core_tran` | 0.1↔10 mA, 100 ns, boost on | −118 / +130 mV |
| | 0.1↔10 mA, 10 ns, boost on | −254 / +250 mV |
| | boost off (`ben` = 0) | −267 / +128 mV (100 ns), −514 / +248 mV (10 ns) |

## PVT (`scripts/run_corners.sh` + `scripts/corner_summary.py`, 45 points × 5 loads)
- Worst valid PM: **25.2°** (fs, 125 °C, 1.8 V, 10 µA); next 28.2° (same corner, 100 µA), then 46.6° (ff, 125 °C).
  Every other corner/load is ≥ 66.6°.
- **6 invalid points** (ff/fs, 125 °C, 1.98 V, loads ≤ 1 mA): regulation lost to pass-device leakage (open issue 1).
- Worst with boost on: undershoot 150 mV (100 ns) / 321 mV (10 ns); overshoot 162 / 313 mV.

Iq breakdown (≈ 163 µA): ref 20, X sink 5, replica (MPD 5 + MPS 5), OTA tail 40, bleeder MND 40,
UB (20 + 10), OBX ≈ 10–20, ab_sense ≈ 0 at no load.

Rev C for reference: Iq 270 µA, PM 74.8° @ 10 µA, −98 / +107 mV (100 ns), −234 / +260 mV (10 ns), worst valid PVT PM 46.8°.

**TODO:** open issues 1, 3, 4 and 5 in `docs/PROGRESS.md`; startup behavior (VIN ramp); VREF-step response.
