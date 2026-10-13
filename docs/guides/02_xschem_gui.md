# 02: Using the design in the xschem GUI

**Always start xschem from the project root.** The `./xschemrc` there is picked up automatically.
It loads the sky130 libraries, adds `xschem/` to the symbol search path, and sends netlists to
`sim/xschem_netlist/` (where `.spiceinit` lives).

```bash
cd OneTOPS
xschem xschem/onetops_tb/tb_ldo_core_tran.sch     # open a testbench
xschem xschem/onetops/ldo_core.sch                # or open a cell
```

## Browse the hierarchy (like Virtuoso descend/ascend)

| Action | Key / menu |
|---|---|
| Descend into the selected block's schematic | select it, press **e** (or right-click → *Descend schematic*) |
| Descend into its symbol | **i** |
| Go back up | **Ctrl+e** |
| Fit view | **f** |
| Find a net / instance | **Ctrl+f** |
| Highlight a net | select a wire, press **k** (unhighlight: **Shift+k**) |

The schematics are drawn **net-label style**: each device terminal has a short wire stub with a
label, and equal labels are connected. To see what a net touches, select it and press **k**.

## Simulate a testbench from the GUI

1. Open a testbench, e.g. `xschem xschem/onetops_tb/tb_ldo_core_tran.sch`.
2. Press **Netlist** (top-right button, or **n**). This writes `sim/xschem_netlist/tb_ldo_core_tran.spice`.
3. Press **Simulate**. ngspice opens in a terminal, runs the `.control` script in the NGSPICE
   code block, and **opens the plots automatically** (in batch runs these are skipped).
4. Numbers are printed in the ngspice terminal (`TRAN BEN=... under_mV=...`). Type `quit` to close.

If **Simulate** does nothing: *Simulation → Configure simulators and tools*, choose
**ngspice** (the default command is `ngspice -i "$N" -a`, run inside a terminal).

The schematic's two code blocks are:
- **MODELS**: `.lib .../sky130.lib.spice tt` and `.temp 27`. Change `tt` to `ss`/`ff`/`sf`/`fs` and
  the temperature for a quick corner check (or use `scripts/run_corners.sh`).
- **NGSPICE**: the analyses and measurements. Double-click a code block to edit it.

## Use a block as a symbol in your own schematic

1. Create your schematic **outside the generated folders**, e.g. `xschem/user/my_tb.sch`.
   (`xschem/onetops*` is regenerated and would overwrite your file.)
2. **Insert → Symbol** (key **Insert**) → browse to `xschem/onetops/` → pick e.g. `ldo_core.sym`.
3. Wire it up. Pin meanings are on the block pages (`docs/blocks/`). For `ldo_core`:

   | pin | connect to |
   |---|---|
   | vin | 1.8 V supply |
   | vref | reference, 1.0–1.45 V |
   | ibn | 20 µA current source *from vin into* ibn |
   | ben | 1.8 V (boost on) / 0 V (off) |
   | vout | load + ~20 pF |
   | vss | ground |

4. Add the two code blocks: copy MODELS and NGSPICE from any testbench (select, **Ctrl+c**, then
   **Ctrl+v** in your schematic) and edit the analysis.
5. Netlist + Simulate as above.

Device-level instances of the PDK (e.g. to try a new circuit) come from
**Insert → Symbol → sky130_fd_pr/** (e.g. `nfet_01v8.sym`, `pfet_01v8_lvt.sym`).

## Looking at waveforms after a batch run

Several testbenches write `.raw` files in `sim/xschem_netlist/`. To view one in ngspice:

```bash
cd sim/xschem_netlist && ngspice
ngspice 1 -> load tb_ams_dvs_ctrl.raw
ngspice 2 -> plot v(vout) v(xchip.xldo.vref)
```
