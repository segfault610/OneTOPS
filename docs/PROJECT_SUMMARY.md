# OneTOPS: Project Summary

**Workload-aware, digitally assisted, output-capacitorless LDO with adaptive transient boost for Edge-AI loads**
Team OneTOPS 2026-27, SENSE. Mentors: Dr. Jyotishman Saikia (primary), Dr. Vaegae Naveen Kumar (co-mentor).

## 1. What we are building

Edge-AI and AIoT chips switch between sleep, sensing, inference and communication. The supply
current jumps by 10× or more within nanoseconds. A local **low-dropout regulator (LDO)** next to the
compute block has to hold its supply steady through those jumps, using no large off-chip capacitor
("capacitorless" / OCL) and very little standby current.

Our regulator has four parts:

| Part | Role |
|---|---|
| **FVF regulation loop** (`ldo_core`) | Flipped-voltage-follower control device + large PMOS pass device: a fast single-stage loop, stable with only ~20 pF on-chip |
| **Adaptive bias** (`ab_sense`) | Loop bias tracks load current (1/500 pass replica): low Iq and stable at light load, fast at heavy load |
| **Transient boost** (`tr_boost`) | Capacitively detects a VOUT dip/spike and briefly injects mA-level current into the pass-device gate. It is off (dead zone) at rest |
| **4-bit DVS reference** (`rdac4` + `dvs_ctrl`) | Output programmable 1.00–1.45 V in 30 mV steps, slew-limited, with a *workload hint* that pre-raises VOUT before an AI burst |
| **On-chip workload emulator** (`load_emu`) | 0–9.6 mA digitally switched load, so silicon can be tested with Edge-AI-like current profiles |

It is *not* an AI accelerator. It is the power-delivery block that sits beside one.

## 2. PDK choice

| PDK | Analog models | Status for us |
|---|---|---|
| **SkyWater sky130** (130 nm, open) | Yes (BSIM4, ngspice) | **Chosen.** Installed locally; free, open tool flow; tapeout through **Tiny Tapeout** |
| ICsprout55 (55 nm, open preview) | **No SPICE models** (digital-only; analog "no release date") | Not usable for the LDO; could host digital logic only |
| GF 55 nm / TSMC 22 nm (university options) | Yes, under NDA | Possible later port. The flow below is PDK-agnostic (gm/Id + generator) |
| SCL 180 nm (original proposal) | Under NDA | Not available to us right now |
| IHP SG13G2 (130 nm, open) | Yes | Considered as a 1.2 V "GF55-like" proxy; not pursued for now |

Sky130 facts that shaped the design:
- 1.8 V core devices: VIN = 1.8 V, VOUT 1.0–1.45 V.
- Std-Vt PMOS |Vth| ≈ 1 V, LVT PMOS ≈ 0.45 V. The pass device is std-Vt, so it stays off at the FVF clamp.
- MIM caps ~2 fF/µm².

## 3. Tiny Tapeout as the tapeout route

| TT constraint | Design consequence |
|---|---|
| Analog area ≤ 2×2 tiles (≈ 334 × 225 µm) | Output cap reduced to 20 pF, Miller cap to 4 pF |
| Analog pins: < 500 Ω, < 5 pF, ≤ 4 mA | 10 mA load must be **on-chip** (`load_emu`); pins only for sensing / bias / trims |
| 1.8 V digital supply (VDPWR) | Used directly as VIN |
| Digital pins `ui_in` / `uo_out` | Drive DVS code, boost enable (`ben`), load pattern, workload hint |

Check the shuttle page for current dates and pricing before committing.

## 4. Workflows

The proposal's Cadence flow maps onto open-source tools:

| Proposal (commercial) | Our flow (open) | Where |
|---|---|---|
| Virtuoso schematic | **xschem** (hierarchical cells + symbols) | `xschem/onetops/`, `xschem/onetops_tb/` |
| Spectre | **ngspice-46** (KLU) | `scripts/run_tb.sh`, `sim/` |
| Device characterization | ngspice gm/Id sweeps + Python tables | `sim/char/`, `scripts/gmid_table.py` |
| PVT / stb analysis | Corner sweep script + **Tian loop-gain probe** | `scripts/run_corners.sh`, `lg_probe` cell |
| SystemVerilog / QuestaSim | **iverilog** (sim) + **Verilator** (lint) | `rtl/` |
| AMS co-simulation (Verilog-AMS substitute) | **ngspice XSPICE `d_cosim` + Verilator**: real RTL inside the analog transient | `scripts/build_ams.sh`, `tb_ams_dvs_ctrl` |
| Analog behavioral models (Verilog-A) | OpenVAF → OSDI in ngspice *(proposed; needs OpenVAF installed)* | — |
| Layout / DRC / LVS / PEX | **Magic / KLayout / netgen** *(planned)* | — |
| Tapeout | **Tiny Tapeout** analog template (`tt_um_*`) *(planned)* | — |

### 4.1 Analog design loop

```
gm/Id tables (sim/char)  ->  sizing in SIZES (scripts/gen_xschem.py)
        -> python3 scripts/gen_xschem.py        # writes every .sch/.sym + testbenches
        -> scripts/run_tb.sh <tb>|all            # xschem netlists hierarchically, ngspice simulates
        -> scripts/run_corners.sh                # 45 PVT points
        -> python3 scripts/corner_summary.py     # worst case; flags loops that lost regulation
        -> update docs/blocks/<block>.md and docs/PROGRESS.md, git commit
```

**Abstraction levels:** each level has its own testbench, so a block is characterized before
it is integrated.

| Level | Cells | Characterized by |
|---|---|---|
| L0 | `inv`, `tgate` | (used inside L1) |
| L1 | `bias_mirror`, `vset_gen`, `ota5t`, `fvf_core`, `pass_pmos`, `comp_rc`, `lg_probe`, `tr_boost`, `ab_sense`, `mux2_tg`, `rdac4`, `decap`, `load_emu` | `tb_bias_mirror`, `tb_vset_gen`, `tb_rdac4` |
| L2 | `ldo_core` (full regulation loop) | `tb_ldo_core_dc / _ac / _tran` |
| L3 | `ldo_top` (DVS LDO IP) | `tb_ldo_top_dvs` |
| L4 | `chip_top` (TT test chip) | `tb_chip_workload`, `tb_ams_dvs_ctrl` (with RTL) |

The schematics are **generated**. `SIZES` in `scripts/gen_xschem.py` is the single source of truth,
so hand edits in xschem are overwritten on regeneration. Edit `SIZES` (or the cell's `gen_*`
function), then regenerate.

### 4.2 Digital loop

`rtl/dvs_ctrl.sv` → `iverilog -g2012` with the self-checking `rtl/tb/tb_dvs_ctrl.sv` → `verilator --lint-only -Wall`.

## 5. Where to read more

- `docs/PROGRESS.md`: revision history, current status vs. proposal phases, open issues
- `docs/blocks/`: one page per block (function, sizing, results, TODO)
- `docs/LITERATURE_SURVEY.md`: papers to read, grouped by topic
- `docs/guides/`: how to run, demo and modify everything (GUI and CLI)
- `README.md`: quick start
