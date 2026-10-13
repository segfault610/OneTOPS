# 04: Simulating the full system, the Edge-AI demo, and mixed-signal co-sim

## A. Whole test chip with a workload profile (`tb_chip_workload`, L4)

`chip_top` = DVS LDO + 20 pF decap + on-chip load emulator. The stimulus replays an Edge-AI duty cycle
with 10 ns load edges:

| t (µs) | event | load |
|---|---|---|
| 0 | sleep | 0 |
| 10 | sensing | 1.28 mA |
| 30 | DVS code 7 → 10 (1.21 → 1.30 V) | |
| 35 | **inference burst** | 9.6 mA |
| 45 | communication | 5.1 mA |
| 50 | DVS code → 4 (1.12 V) | |
| 55 | sleep | 0 |

```bash
scripts/run_tb.sh tb_chip_workload          # or open it in xschem and Simulate (plots VOUT)
```
Expected: inference dip **329 mV with boost, 536 mV without**; overshoot at sleep ~214 mV.

## B. Mixed-signal co-simulation with the real RTL (`tb_ams_dvs_ctrl`)

The `dvs_ctrl.sv` RTL is compiled by Verilator into a shared library that ngspice's XSPICE
`d_cosim` model runs *inside* the analog transient. This is our open-source substitute for a
Verilog-AMS / AMS-Designer co-sim.

```bash
scripts/build_ams.sh                        # -> sim/ams/dvs_ctrl.so (re-run after editing rtl/dvs_ctrl.sv)
scripts/run_tb.sh tb_ams_dvs_ctrl
```

How it is wired (NGSPICE code block of the testbench):

```
analog PWL sources ──adc_bridge──► [clk rst_n code_req[3:0] hint] ──d_cosim(dvs_ctrl.so)──►
[code_out[3:0] boost_en settled] ──dac_bridge (0/1.8 V)──► chip_top d3..d0, ben
```
Port order follows the Verilog port list, and vector bits are listed MSB first.

Scenario: code_req = 7, with a workload hint from 12 to 28 µs. The controller ramps one LSB per
0.8 µs to 10 (+90 mV pre-boost) and enables the boost, the 9.6 mA burst hits at 18 µs, then
code_req = 4 at 30 µs ramps down.
Expected: `req7: code=7 vout=1.226`, `hint: code=10 vout=1.315 burst dip_mV≈341`, `req4: code=4 vout=1.142`.

To co-simulate other RTL: add the module name to the loop in `scripts/build_ams.sh` and instantiate
it with `.model <m> d_cosim simulation=../ams/<m>.so`.

## C. PVT corners

```bash
scripts/run_corners.sh                      # tb_ldo_core_ac + tb_ldo_core_tran over 5 corners x 3 T x 3 VIN (~6 min)
python3 scripts/corner_summary.py           # worst cases; INVALID = loop lost regulation (phase wrap)
```
Rev C worst valid PM is 46.8°. Five hot/high-VIN light-load points are INVALID (open issue 1 in
`docs/PROGRESS.md`). Worst undershoot with boost is 127 mV (100 ns) / 296 mV (10 ns).

## D. Simulation hygiene (lessons learned)
- **Always give `tran` a max step** (4th argument). Without it, ngspice skipped through the 10 ns
  edges and reported a dip of 258 mV instead of 329 mV. All generated testbenches set one.
- A PM far outside 0–180° is not a "great margin". It means the loop is broken at that point.
- ngspice: in this sky130 model set, device multiplicity is `m=`; `mult=` only scales mismatch.
