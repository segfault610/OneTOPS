# Rev A0 flat reference (superseded)

Hand-written flat netlists from the first bring-up: VREF is an ideal source that also supplies
the replica current, with CL = 100 pF and Cc = 12 pF. They are kept as a golden reference and to
document the probe conventions (`tian_check.spice` checks the Tian loop-gain probe against an
analytic two-pole loop). Current work lives in the generated xschem hierarchy:
`scripts/gen_xschem.py`, `xschem/onetops*`, and `scripts/run_tb.sh`.
