# 01: Getting started

## Prerequisites (already installed on the lab machine)

| Tool | Version used | Check with |
|---|---|---|
| sky130A PDK (open_pdks) | `/usr/local/share/pdk/sky130A` | `ls $PDK_ROOT/sky130A` (PDK_ROOT=/usr/local/share/pdk) |
| xschem | 3.4.8 | `xschem -v` |
| ngspice | 46 (KLU, XSPICE, d_cosim) | `ngspice -v` |
| Verilator / iverilog | oss-cad-suite | `verilator --version`, `iverilog -V` |
| Python 3 | stdlib only | (no numpy needed) |

On a new machine, install open_pdks (sky130A), xschem, ngspice ≥ 42 (with XSPICE) and the
oss-cad-suite. If the PDK lives somewhere other than `/usr/local/share/pdk`, edit `PDK_ROOT` in
`xschemrc` and the `PDK_LIB` path in `scripts/gen_xschem.py`.

## Get the repo and run everything

```bash
git clone https://github.com/segfault610/OneTOPS.git && cd OneTOPS
python3 scripts/gen_xschem.py      # writes all schematics, symbols, testbenches (xschem/onetops*, xschem/onetops_tb)
scripts/build_ams.sh               # compiles rtl/dvs_ctrl.sv for mixed-signal co-sim (sim/ams/dvs_ctrl.so)
scripts/run_tb.sh all              # netlists every testbench with xschem, simulates with ngspice (~1.5 min)
```

`run_tb.sh` prints the key numbers per testbench, and the full logs go to `results/<tb>.log`.
On the current design (Rev D) you should see, among others:

```
=== tb_ldo_core_tran
TRAN BEN=1.8 EDGE=100n under_mV=118.1 over_mV=130.0
TRAN BEN=0 EDGE=100n under_mV=266.9 over_mV=127.7
=== tb_ams_dvs_ctrl
AMS req7: code=7 vout=1.22492
AMS hint: code=10 vout=1.3139 burst dip_mV=344.8
```

If a number moves by more than a few percent and you didn't change the design, check the `!!`
lines and `results/<tb>.log` (look for `Error`, `singular`, `timestep too small`).

## Where things are

| Path | What |
|---|---|
| `xschem/onetops/` | cell library: one `.sch` + `.sym` per block |
| `xschem/onetops_tb/` | testbenches (one per block / abstraction level) |
| `scripts/gen_xschem.py` | the generator; `SIZES` holds every device size |
| `scripts/run_tb.sh`, `run_corners.sh`, `corner_summary.py` | simulation drivers |
| `rtl/` | `dvs_ctrl.sv` + self-checking testbench |
| `sim/char/` | device characterization (gm/Id) |
| `sim/xschem_netlist/` | generated netlists and `.raw` waveforms (git-ignored) |
| `docs/` | summary, progress, per-block pages, guides, literature |
