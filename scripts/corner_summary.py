#!/usr/bin/env python3
"""Summarize results/corners_tb_ldo_core_{ac,tran}.txt (from scripts/run_corners.sh).

PM values outside 0..180 deg mean the phase wrapped, which in practice means the loop has
lost regulation (e.g. pass-device leakage at hot, light load); they are reported as INVALID,
never folded into the worst-case number.
"""
import os, re, sys

res = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(__file__), "..", "results")
ac = os.path.join(res, "corners_tb_ldo_core_ac.txt")
tr = os.path.join(res, "corners_tb_ldo_core_tran.txt")

valid, invalid = [], []
for line in open(ac):
    k = line.split("|")[0].strip()
    for il, pm in re.findall(r"ILOAD=(\S+) T0dB=\S+ UGF=\S+ PM=(\S+)", line):
        (valid if 0 < float(pm) < 180 else invalid).append((float(pm), k, il))
w = min(valid)
print(f"AC: {len(valid) + len(invalid)} (corner, load) points; worst valid PM {w[0]:.1f} deg @ {w[1]} ILOAD={w[2]}")
for pm, k, il in invalid:
    print(f"   INVALID (regulation lost / phase wrap): {k} ILOAD={il} PM={pm:.0f}")

worst = {}
for line in open(tr):
    k = line.split("|")[0].strip()
    for b, e, u, o in re.findall(r"BEN=(\S+) EDGE=(\S+) under_mV=(\S+) over_mV=(\S+)", line):
        for name, v in (("undershoot", float(u)), ("overshoot", float(o))):
            if (b, e, name) not in worst or v > worst[(b, e, name)][0]:
                worst[(b, e, name)] = (v, k)
print("TRAN worst case over PVT (0.1 <-> 10 mA):")
for (b, e, name), (v, k) in sorted(worst.items()):
    print(f"   boost {'on ' if b != '0' else 'off'} edge {e:>4} {name:10} {v:6.1f} mV @ {k}")
