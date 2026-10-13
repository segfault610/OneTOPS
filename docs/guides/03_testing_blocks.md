# 03: Testing the blocks one level at a time

Run any testbench with `scripts/run_tb.sh <name>` (CLI) or open it in xschem and press
Netlist → Simulate (GUI, with plots). Expected values are Rev C, TT, 27 °C, VIN = 1.8 V.

## L1 blocks

| Testbench | Block under test | What it does | Expected result | Look at |
|---|---|---|---|---|
| `tb_bias_mirror` | `bias_mirror` | Forces each mirror output to a voltage, sweeps o_fvf's Vds 0–1.8 V | o_fvf ≈ 19.7 µA at 0.6 V; 19 µA reached at **Vds ≈ 0.32 V** (compliance) | plot of I vs Vds: flat above ~0.3 V |
| `tb_vset_gen` | `vset_gen` (+ `ota5t`) | Sweeps VREF 0.95–1.5 V, prints VSET and replica error | error +8.2 mV at 0.95 V → +0.7 mV at 1.5 V | `err_mV` plot |
| `tb_rdac4` | `rdac4` (+ `mux2_tg`, `tgate`, `inv`) | Binary counter on d0..d3, 1 µs per code | 16 codes, **30.00 ± 0.02 mV** steps, monotonic | staircase plot |

## L2: the regulation loop (`ldo_core`, includes `tr_boost`)

| Testbench | What it does | Expected result |
|---|---|---|
| `tb_ldo_core_dc` | OP; load sweep 0–10 mA; VIN sweep 1.5–1.98 V (no load → Iq) and 1.3–1.98 V at 10 mA | VOUT = 1.216 V @ 1 mA, load reg 1.0 mV/mA, Iq 270 µA, line reg 28 mV/V |
| `tb_ldo_core_ac` | Tian loop gain + PSRR at 10 µA, 100 µA, 1 mA, 5 mA, 10 mA | T0 59–66 dB; PM 74.8° (10 µA) … 92° (10 mA); PSRR −31 dB @ 1 kHz, −20 dB @ 1 MHz |
| `tb_ldo_core_tran` | 0.1 ↔ 10 mA load step, edges 100 ns and 10 ns, **boost on and off** | on: −98 / +107 mV (100 ns), −234 / +260 mV (10 ns); off: −170 / +105, −472 / +258 mV |

Demonstrating the boost to someone: open `tb_ldo_core_tran` in the GUI and Simulate. Four plot
windows open (boost on/off × 100/10 ns). Compare the VOUT dips; trace `x` is the pass gate, and you
can see the boost yank it down within ns.

## L3: DVS IP (`ldo_top`)

| Testbench | What it does | Expected result |
|---|---|---|
| `tb_ldo_top_dvs` | Counts the DVS code 0 → 15 (5 µs per code) at 5 mA | VOUT 1.015 → 1.463 V, monotonic, error +12…15 mV (known offset) |

## Digital

```bash
cd rtl && iverilog -g2012 -o ../results/tb_dvs_ctrl.vvp dvs_ctrl.sv tb/tb_dvs_ctrl.sv && vvp ../results/tb_dvs_ctrl.vvp
verilator --lint-only -Wall dvs_ctrl.sv
```
Expected: `PASS: dvs_ctrl (42 single-LSB steps checked)` and no lint output.

## Device characterization (when re-sizing)

```bash
cd sim/char && ngspice -b gmid.spice && python3 ../../scripts/gmid_table.py   # -> results/gmid_tables.txt
ngspice -b pass_sizing.spice                                                  # pass-device current density
```
The tables give |Vgs|, Id/W and gm/gds at gm/Id = 6…22 for nfet_01v8, pfet_01v8, pfet_01v8_lvt
at L = 0.15…2 µm.
