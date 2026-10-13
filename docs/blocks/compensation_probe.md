# L1 `comp_rc` and `lg_probe`

## `comp_rc`: Miller compensation
Rz (1 Ω, i.e. none) + Cc **4 pF** from gate node X to VOUT, which splits the X pole from the output pole.

| C_L | Cc | Bleeder | PM @ 10 µA (TT) | Undershoot (100 ns) |
|---|---|---|---|---|
| 100 pF (Rev A) | 12 pF | 100 µA | 48.6° | 295 mV |
| 20 pF | 12 pF | 100 µA | 77.5° | 289 mV |
| 20 pF | 6 pF | 100 µA | 65.3° | 203 mV |
| 20 pF (Rev B) | 4 pF | 100 µA | 55.8° | 171 mV |
| 20 pF | 3 pF | 100 µA | 48.7° | 159 mV |

A smaller Cc means a faster X node (less slewing), at the cost of light-load PM. Adding a nulling
resistor (5–20 kΩ) *hurt* PM at heavy load, so Rz is unused.
**TODO:** replace with `cap_mim_m3_1` (≈ 2 fF/µm² → 4 pF ≈ 45 × 45 µm).

## `lg_probe`: Tian loop-gain probe
Vbrk (series V source) + Iinj (shunt I source), both `ac 0`, so the probe is transparent normally.
The loop gain is T = −1/(1 − 1/(2(I₁V₂ − V₁I₂) + V₁ + I₂)) from a voltage-injection run (1) and a
current-injection run (2). Convention, verified on an analytic 2-pole loop in
`sim/ref_a0_flat/tian_check.spice` (60.0 dB, UGF 787 kHz, PM 52°):
**Vbrk + terminal on the loop-input side (`lin` = pass gate), Iinj injects into `lin`.**
Used by `tb_ldo_core_ac` via `alter @v.xldo.xprobe.vbrk[acmag]` / `@i.xldo.xprobe.iinj[acmag]`.
