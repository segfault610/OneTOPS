# L0 primitives: `inv`, `tgate`, and L1 `mux2_tg`

| Cell | Ports | Devices |
|---|---|---|
| `inv` | a → y; vdd, vss | pfet_01v8 2/0.15 µm, nfet_01v8 1/0.15 µm |
| `tgate` | a ↔ b, en, enb; vdd, vss | nfet_01v8 1/0.15 + pfet_01v8 2/0.15 (on when en = 1) |
| `mux2_tg` | i0, i1 → y; s, sb | two `tgate`s: s = 0 → i0, s = 1 → i1 |

**Notes:** the DAC taps sit at 1.0–1.45 V. That is above the NMOS's useful range with a 1.8 V
gate, so the PMOS half of each TG does most of the conducting. They only drive the high-impedance
OTA input, so on-resistance is irrelevant at DC.

**Verification:** exercised inside `tb_rdac4` (all 16 codes) and `tb_ldo_top_dvs`. `inv` also drives
the `ben` → `benb` gate in `tr_boost`.

**TODO:** none at schematic level; minimum-size layout.
