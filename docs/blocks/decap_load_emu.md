# L1 `decap` and `load_emu` (test-chip support blocks)

## `decap`
20 pF from VOUT to VSS (ideal for now). Tiny Tapeout's area limit (2×2 tiles ≈ 75 000 µm²) sets the
size: 100 pF of MIM would take ~50 000 µm².
**TODO:** `cap_mim_m3_1` array (≈ 100 × 100 µm), plus MOS-cap under it if needed.

## `load_emu`: on-chip Edge-AI workload emulator
TT analog pins carry ≤ 4 mA, so the 10 mA load has to be on-chip.

- Mirror from its own 20 µA reference `ibl` (diode MD0, 4/1 µm).
- Four binary-weighted sinks MSb = 32·2^b × (4/1 µm), each with a series switch MSWb
  (nfet 20·2^b / 0.15 µm, gate = `ldb`).
- I = (ld0 + 2·ld1 + 4·ld2 + 8·ld3) × 0.64 mA, giving **0–9.6 mA**. The digital edges are fast (ns), so
  workload transitions such as sleep → sense → inference → comm can be replayed from `ui_in`.

**Verification:** used in `tb_chip_workload` (profile 0 → 1.28 → 9.6 → 5.1 → 0 mA).
**TODO:** measure edge rate and current accuracy vs. VOUT (compliance), plus an optional slew-rate
control to emulate softer edges.
