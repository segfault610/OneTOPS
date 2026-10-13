# OneTOPS: Workload-Aware Capacitorless FVF LDO (sky130)

Output-capacitorless LDO with a flipped-voltage-follower (FVF) loop and a 4-bit DVS reference,
for local supply regulation of bursty Edge-AI / AIoT loads. The proposal is
`docs/3)Revised_EdgeAI_Capacitorless_LDO_Proposal-2.pdf`.

## PDK decision

| Option | Status |
|---|---|
| **SkyWater sky130A** (open) | **Used.** Installed at `/usr/local/share/pdk`; ngspice models, xschem symbols, Magic/netgen. Tapeout via **Tiny Tapeout** (sky130 / ChipFoundry shuttles). |
| ICsprout55 | Digital-only preview PDK: **no SPICE models** (README "Todo"; repo issue #1). Can't be used for the analog design. |
| SCL 1.2 µm / 180 nm (proposal) | Not available on this machine; NDA. |
| TSMC 22 nm / GF 55 nm (university) | Port target if access is granted. The gm/Id flow and generator are built so porting is mostly a re-sizing job. |

Tool mapping from the proposal: Virtuoso → **xschem**, Spectre → **ngspice-46**,
QuestaSim → **iverilog / Verilator**, Calibre → **Magic / netgen / KLayout**.

## Cell hierarchy (xschem library `xschem/onetops/`)

Every block is its own `.sch` + `.sym`, so it can be placed in the level above like a Virtuoso cell.

| Level | Cell | Function |
|---|---|---|
| L0 | `inv`, `tgate` | 1.8 V inverter, transmission gate |
| L1 | `bias_mirror` | NMOS mirror bank from IB = 20 µA: FVF sink, 100 µA bleeder, PMOS reference, OTA tail |
| L1 | `vset_gen` | Replica loop: 5T OTA + MR so VSET = VREF − Vsg(MR). VREF input is high-impedance |
| L1 | `ota5t` | 5-transistor OTA (NMOS in, LVT PMOS mirror) |
| L1 | `fvf_core` | FVF control PMOS MC (LVT, 100/1 µm) |
| L1 | `pass_pmos` | Pass device, std-Vt PMOS 70×10/0.35 µm. High \|Vth\| keeps it off at the FVF gate clamp |
| L1 | `comp_rc` | Miller compensation Rz + Cc (gate X → VOUT) |
| L1 | `lg_probe` | Tian loop-gain probe (transparent unless `acmag` is altered) |
| L1 | `mux2_tg`, `rdac4` | 4-bit R-string DAC + TG mux tree: VREF = 1.00 V + 30 mV × code |
| L1 | `decap`, `load_emu` | 20 pF on-chip decap; on-chip 4-bit 0–9.6 mA workload emulator |
| L2 | `ldo_core` | Complete FVF regulation loop (VREF in) |
| L3 | `ldo_top` | DVS LDO IP: `rdac4` + `ldo_core` |
| L4 | `chip_top` | Tiny Tapeout test chip: `ldo_top` + decap + `load_emu` |

The schematics are **generated** by `scripts/gen_xschem.py`, and its `SIZES` dict is the single
source of truth for device sizes. Edits made by hand in xschem are overwritten on the next
generation, so either change `SIZES` or stop regenerating that cell.
Connectivity is by net labels on short stubs at every terminal, so you can rearrange or draw wires freely.

Digital: `rtl/dvs_ctrl.sv` is a slew-limited (1 LSB / `STEP_DIV` clocks) DVS controller with a
workload-hint pre-boost (+3 LSB) and a `boost_en` output. Its testbench is `rtl/tb/tb_dvs_ctrl.sv`.

## How to run

```bash
cd /media/additional_space/OneTOPS
python3 scripts/gen_xschem.py               # (re)generate cells, symbols, testbenches
scripts/run_tb.sh all                       # netlist with xschem + simulate -> results/<tb>.log
scripts/run_tb.sh tb_ldo_core_ac            # a single testbench
scripts/run_corners.sh                      # 5 corners x {-40,27,125} C x VIN {1.62,1.8,1.98}
xschem xschem/onetops/ldo_core.sch          # browse/edit (./xschemrc is picked up automatically)
cd rtl && iverilog -g2012 -o ../results/tb_dvs_ctrl.vvp dvs_ctrl.sv tb/tb_dvs_ctrl.sv && vvp ../results/tb_dvs_ctrl.vvp
cd sim/char && ngspice -b gmid.spice && python3 ../../scripts/gmid_table.py   # gm/Id tables
```

Testbenches (`xschem/onetops_tb/`): `tb_bias_mirror`, `tb_vset_gen`, `tb_rdac4` (L1);
`tb_ldo_core_dc/ac/tran` (L2); `tb_ldo_top_dvs` (L3); `tb_chip_workload` (L4).

## Rev B status (TT, 27 °C, VIN = 1.8 V, C_L = 20 pF on-chip, unless noted)

| Metric | Result | Note |
|---|---|---|
| VOUT range (DVS) | 1.00 – 1.45 V, 16 codes, monotonic | DAC step 30.0 ± 0.02 mV |
| DC accuracy | +12 … +15 mV systematic | MC/MR Vds mismatch + 5T OTA offset: **to fix** |
| Load regulation | 1.0 mV/mA (0–10 mA) | |
| Line regulation | 28 mV/V @ 10 mA | weak: single-stage FVF loop gain |
| Dropout | ~400 mV @ 10 mA | |
| Iq | 221 µA | 100 µA of it is the stability bleeder → adaptive-bias target |
| Loop gain / PM | 59–66 dB; PM ≥ 55.8° (10 µA–10 mA), **≥ 55.2° over 45 PVT corners** | |
| PSRR | −31 dB @ 1 kHz, −20 dB @ 1 MHz | FVF limit ≈ 1/(g_mc·R_X) |
| Load step 0.1↔10 mA, 100 ns edges | −171 / +113 mV (PVT worst −245 / +170 mV) | slew-limited at gate node X |
| Workload profile, 10 ns edges (L4) | **−537 mV** dip at inference burst, +228 mV at sleep | baseline the boost path must beat |

Rev A (C_L = 100 pF, Cc = 12 pF) gave −295 / +147 mV. Undershoot hardly depends on C_L, because
the 20 µA sink slews the gate node X, so the next block to build is the **transient-boost path**.

## Tiny Tapeout constraints (check the current shuttle docs)

- Analog area ≤ 2×2 tiles ≈ 334 × 225 µm, which is why C_L is 20 pF and Cc is 4 pF.
- Analog pins: < 500 Ω, < 5 pF, **≤ 4 mA**, so the 10 mA load must be on-chip (`load_emu`) and `ua[*]` is used only for sensing / bias / trims.
- Supply VDPWR = 1.8 V, which the design already uses as VIN.

## Next steps

1. Transient-boost path (AC-coupled VOUT dip detector → extra gate pull-down / pull-up at X) and adaptive bias (load-tracking IB, to remove the fixed 100 µA bleeder).
2. Fix the +12–15 mV DC offset (match MC/MR Vds, cascode the replica, or increase OTA gain).
3. On-chip bias (beta-multiplier) and VHI/VLO reference (bandgap or pin trims).
4. Replace ideal R/C with sky130 devices (`res_xhigh_po`, `cap_mim_m3_1`); Monte-Carlo mismatch.
5. AMS co-simulation of `dvs_ctrl` with the analog top (ngspice `d_cosim` / Verilator).
6. Layout (Magic/KLayout) → DRC/LVS (netgen) → PEX → Tiny Tapeout analog template (`tt_um_*` wrapper).

## Layout of this repo

```
docs/            proposal
scripts/         gen_xschem.py, run_tb.sh, run_corners.sh, gmid_table.py
xschem/onetops   cell library (.sch/.sym)      xschem/onetops_tb  testbenches
sim/char         gm/Id + pass-device characterization netlists
sim/xschem_netlist  generated netlists (+ .spiceinit)
sim/ref_a0_flat  superseded flat Rev A0 netlists (golden reference, Tian-probe check)
rtl/             dvs_ctrl.sv + tb/
results/         logs, gm/Id tables, corner summaries
```
# OneTOPS
