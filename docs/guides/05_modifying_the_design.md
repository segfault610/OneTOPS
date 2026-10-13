# 05: Modifying the design

## Resize a device

1. Edit `SIZES` in `scripts/gen_xschem.py` (e.g. `cc="4p"`, `mp=dict(W=10, L=0.35, mult=70)`).
2. `python3 scripts/gen_xschem.py` regenerates every `.sch`/`.sym`/testbench.
3. `scripts/run_tb.sh all` (+ `scripts/run_corners.sh` for anything touching stability or transient).
4. Update the block page in `docs/blocks/` and the revision table in `docs/PROGRESS.md`.

Quick what-if without regenerating: edit the netlist in `sim/xschem_netlist/` with `sed` and run
`ngspice -b` on the copy (see the Cc/C_L sweeps in the git history).

## Edit a schematic by hand instead

The generator overwrites `xschem/onetops*`. If you want to hand-draw a block:
1. Copy it to `xschem/user/<cell>.sch/.sym` (create the folder) and edit it there.
2. Point parent schematics at `user/<cell>.sym`, or delete the cell's `gen_*` call in
   `gen_xschem.py` so it stops being regenerated.

## Add a new block (pattern)

```python
def gen_my_block():
    p = cell("my_block", [("in", "in")], [("out", "out")], top=[("vdd", "inout")], bottom=[("vss", "inout")])
    s = Sch("my_block -- L1 what it does")
    s.ports(["in"], ["out"], ["vdd", "vss"])
    s.mos("nfet_01v8", "MN1", 0, 0, dict(D="out", G="in", S="vss", B="vss"), W=1, L=0.15)
    s.inst("inv", "xinv", 300, 0, dict(a="in", y="inb", vdd="vdd", vss="vss"))   # reuse a cell
    s.write(p)
```
Add it to the generator list in `__main__` **before** any cell that instantiates it. Add a
testbench with `tb("tb_my_block", title, build_fn, control_text)`, plus optional interactive plots in `PLOTS`.

## Change the digital controller

Edit `rtl/dvs_ctrl.sv` → run its testbench (guide 03) → `scripts/build_ams.sh` → `scripts/run_tb.sh tb_ams_dvs_ctrl`.

## Commit

```bash
git add -A && git commit -m "Short summary of the change and its measured effect"
```
Generated netlists, `.raw`/`.vvp`, AMS libraries and paper PDFs are git-ignored.
