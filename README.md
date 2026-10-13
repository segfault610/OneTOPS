# OneTOPS: Workload-Aware Capacitorless FVF LDO (sky130)

Output-capacitorless LDO with a flipped-voltage-follower (FVF) loop and a 4-bit DVS reference,
for local supply regulation of bursty Edge-AI / AIoT loads, with a capacitive transient-boost path.
The proposal is `docs/3)Revised_EdgeAI_Capacitorless_LDO_Proposal-2.pdf`.

**Documentation:** [project summary (workflows, PDKs)](docs/PROJECT_SUMMARY.md) ·
[overall progress & open issues](docs/PROGRESS.md) · [per-block pages](docs/blocks/README.md) ·
[literature survey](docs/LITERATURE_SURVEY.md) ·
[**user guides**](docs/guides/README.md)

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
| L1 | `bias_mirror` | NMOS mirror bank from IB = 20 µA: FVF sink and replica base (5 µA), OTA tail, boost bias / dead zone |
| L1 | `vset_gen` | Replica loop: 5T OTA + MR so VSET = VREF − Vsg(MR). VREF input is high-impedance |
| L1 | `ota5t` | 5-transistor OTA (NMOS in, LVT PMOS mirror) |
| L1 | `fvf_core` | FVF control PMOS MC (LVT, 100/1 µm) |
| L1 | `pass_pmos` | Pass device, std-Vt PMOS 70×10/0.35 µm. High \|Vth\| keeps it off at the FVF gate clamp |
| L1 | `comp_rc` | Miller compensation Rz + Cc (gate X → VOUT) |
| L1 | `lg_probe` | Tian loop-gain probe (transparent unless `acmag` is altered) |
| L1 | `ab_sense` | Adaptive bias: 1/500 pass replica adds I_load/500 to the MC and replica bias (Rev D) |
| L1 | `tr_boost` | Transient boost: AC-coupled undershoot booster (dead zone, ×20 X pull-down), dynamic 100 µA bleeder, X pull-up; `ben` enable |
| L1 | `mux2_tg`, `rdac4` | 4-bit R-string DAC + TG mux tree: VREF = 1.00 V + 30 mV × code |
| L1 | `decap`, `load_emu` | 20 pF on-chip decap; on-chip 4-bit 0–9.6 mA workload emulator |
| L2 | `ldo_core` | Complete FVF regulation loop incl. `tr_boost` (VREF, ben in) |
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
scripts/build_ams.sh                        # Verilator-compile dvs_ctrl.sv for d_cosim (AMS co-sim)
scripts/run_tb.sh all                       # netlist with xschem + simulate -> results/<tb>.log
scripts/run_tb.sh tb_ldo_core_ac            # a single testbench
scripts/run_corners.sh                      # 5 corners x {-40,27,125} C x VIN {1.62,1.8,1.98}
python3 scripts/corner_summary.py           # worst case; flags points where regulation is lost
xschem xschem/onetops/ldo_core.sch          # browse/edit (./xschemrc is picked up automatically)
cd rtl && iverilog -g2012 -o ../results/tb_dvs_ctrl.vvp dvs_ctrl.sv tb/tb_dvs_ctrl.sv && vvp ../results/tb_dvs_ctrl.vvp
cd sim/char && ngspice -b gmid.spice && python3 ../../scripts/gmid_table.py   # gm/Id tables
```

Testbenches (`xschem/onetops_tb/`): `tb_bias_mirror`, `tb_vset_gen`, `tb_rdac4` (L1);
`tb_ldo_core_dc/ac/tran` (L2); `tb_ldo_top_dvs` (L3); `tb_chip_workload`, `tb_ams_dvs_ctrl` (L4, RTL co-sim).

## Rev D status (TT, 27 °C, VIN = 1.8 V, C_L = 20 pF on-chip)

| Metric | Result |
|---|---|
| VOUT (DVS) | 1.00–1.45 V, 16 codes, monotonic; **+12…15 mV offset** |
| Load / line regulation | 1.07 mV/mA / 24 mV/V |
| PM | 84.7° (10 µA) … 91° (10 mA); worst valid over PVT 25.2° (hot fs, light load: issue 1) |
| PSRR | −29…−32 dB @ 1 kHz; −10 dB (light load) … −22 dB (10 mA) @ 1 MHz |
| Iq | **163 µA** (Rev C: 270 µA), via adaptive bias |
| 0.1↔10 mA step, boost on (off) | 100 ns: −118 / +130 mV (−267 / +128); 10 ns: −254 / +250 mV (−514 / +248) |
| Edge-AI workload dip (L4, 10 ns) | **334 mV** with boost vs 534 mV without (AMS run with the real `dvs_ctrl`: 345 mV) |

**Top open issue:** at 125 °C on fs/ff corners with light load, pass-device leakage exceeds the bleeder.
VOUT drifts up at 1.98 V, and PM drops to 25° at 1.8 V. Details, rejected fixes and the rest of the list
are in [docs/PROGRESS.md](docs/PROGRESS.md).

## Tiny Tapeout constraints (check the current shuttle docs)

- Analog area ≤ 2×2 tiles ≈ 334 × 225 µm, which is why C_L is 20 pF and Cc is 4 pF.
- Analog pins: < 500 Ω, < 5 pF, **≤ 4 mA**, so the 10 mA load must be on-chip (`load_emu`) and `ua[*]` is used only for sensing / bias / trims.
- Supply VDPWR = 1.8 V, which the design already uses as VIN.

## Next steps

Hot-leakage fix (shunt clamp or gain-stage gate driver), DC offset fix,
on-chip references, real sky130 passives, Verilog-A behavioral models, layout → DRC/LVS/PEX → TT wrapper.
See [docs/PROGRESS.md](docs/PROGRESS.md).

## Layout of this repo

```
docs/            proposal, PROJECT_SUMMARY, PROGRESS, LITERATURE_SURVEY, blocks/
scripts/         gen_xschem.py, run_tb.sh, run_corners.sh, corner_summary.py, gmid_table.py
xschem/onetops   cell library (.sch/.sym)      xschem/onetops_tb  testbenches
sim/char         gm/Id + pass-device characterization netlists
sim/xschem_netlist  generated netlists (+ .spiceinit)
sim/ref_a0_flat  superseded flat Rev A0 netlists (golden reference, Tian-probe check)
rtl/             dvs_ctrl.sv + tb/
results/         logs, gm/Id tables, corner summaries
```
