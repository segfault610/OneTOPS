# RTL `dvs_ctrl`: 4-bit DVS controller

**File:** `rtl/dvs_ctrl.sv`; testbench `rtl/tb/tb_dvs_ctrl.sv`.

| Port | Dir | Meaning |
|---|---|---|
| clk, rst_n | in | clock, async active-low reset (code_out → 0) |
| code_req[3:0] | in | requested DVS code |
| hint | in | workload hint: AI burst imminent |
| code_out[3:0] | out | to `rdac4` d0–d3 |
| boost_en | out | = hint, for analog boost / adaptive bias |
| settled | out | code_out == effective target |

**Behavior:**
- Target = code_req + (hint ? HINT_BOOST : 0), saturating at 15.
- code_out moves **one LSB every STEP_DIV clocks**, so VREF never jumps more than 30 mV.
- Parameters: STEP_DIV = 8, HINT_BOOST = 3 (+90 mV pre-boost).

**Verification:** iverilog `-g2012`, self-checking, **PASS (42 single-LSB steps checked)**:
power-up ramp, hint pre-boost, ramp down, saturation at 15, full-scale ramp. The checker asserts
there are no multi-LSB jumps and no step faster than STEP_DIV. `verilator --lint-only -Wall` is clean.

**AMS co-sim ✅:** `scripts/build_ams.sh` → `tb_ams_dvs_ctrl` runs this RTL inside ngspice, driving `chip_top`
(code 7 → hint 10 → 4; Rev D VOUT 1.225 → 1.314 → 1.143 V, burst dip 345 mV). See `docs/guides/04_full_system_and_ams.md`.

**TODO:** choose STEP_DIV from the measured VREF/VOUT
settling; synthesize for the TT digital tile (sky130_fd_sc_hd).
