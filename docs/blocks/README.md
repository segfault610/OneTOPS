# Block documentation index

Each page covers one cell: function, ports, sizing, design rationale, verification results,
status and TODO. Sizes are copied from `SIZES` in `scripts/gen_xschem.py` (the source of truth).
Status key: ✅ verified at its level · 🟡 works, known limitation · ⬜ not started

| Level | Block | Page | Status |
|---|---|---|---|
| L0 | `inv`, `tgate`, `mux2_tg` | [primitives.md](primitives.md) | ✅ |
| L1 | `bias_mirror` | [bias_mirror.md](bias_mirror.md) | ✅ |
| L1 | `vset_gen` + `ota5t` | [vset_gen.md](vset_gen.md) | 🟡 offset |
| L1 | `fvf_core` + `pass_pmos` | [fvf_pass.md](fvf_pass.md) | 🟡 hot leakage |
| L1 | `comp_rc` + `lg_probe` | [compensation_probe.md](compensation_probe.md) | ✅ (ideal R/C) |
| L1 | `tr_boost` | [tr_boost.md](tr_boost.md) | ✅ Rev C |
| L1 | `ab_sense` (adaptive bias) | [ab_sense.md](ab_sense.md) | 🟡 Rev D, hot-corner PM |
| L1 | `rdac4` | [rdac4.md](rdac4.md) | ✅ (ideal R) |
| L1 | `decap`, `load_emu` | [decap_load_emu.md](decap_load_emu.md) | ✅ (ideal C) |
| L2 | `ldo_core` | [ldo_core.md](ldo_core.md) | 🟡 |
| L3 | `ldo_top` | [ldo_top.md](ldo_top.md) | 🟡 offset |
| L4 | `chip_top` | [chip_top.md](chip_top.md) | 🟡 |
| RTL | `dvs_ctrl` | [dvs_ctrl.md](dvs_ctrl.md) | ✅ |
| — | hot-leakage clamp / gate driver | — | ⬜ next |
