#!/usr/bin/env python3
"""Build gm/Id design tables from ngspice wrdata output (results/gmid_<dev>_L<L>.txt).

Columns per row: vg id vg gm vg gds. For PMOS the sweep is Vg 1.8->0 with Vs=1.8, so |Vgs| = 1.8 - Vg.
Prints, for target gm/Id values, |Vgs|, current density Id/W (uA/um) and intrinsic gain gm/gds.
"""
import glob, os, re, sys

W = 10.0  # um, must match gmid.spice
VDD = 1.8
TARGETS = [6, 8, 10, 12, 15, 18, 22]
res = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(__file__), "..", "results")


def load(path, pmos):
    rows = []
    for line in open(path):
        v = [float(x) for x in line.split()]
        vg, i_d, gm, gds = v[0], abs(v[1]), v[3], v[5]
        vgs = VDD - vg if pmos else vg
        if i_d > 1e-12 and gm > 0:
            rows.append((vgs, i_d, gm, gds))
    return sorted(rows)


def at_gmid(rows, t):
    """Linear interpolation on gm/Id (monotonically decreasing with Vgs above weak inversion)."""
    pts = [(r[2] / r[1], r) for r in rows]
    for (g0, r0), (g1, r1) in zip(pts, pts[1:]):
        if g0 >= t >= g1 and g0 != g1 and r0[0] > 0.2:
            f = (g0 - t) / (g0 - g1)
            return [a + f * (b - a) for a, b in zip(r0, r1)]
    return None


for dev in ("nfet", "pfet", "pfetlvt"):
    files = sorted(glob.glob(os.path.join(res, f"gmid_{dev}_L*.txt")),
                   key=lambda p: float(re.search(r"_L([\d.]+)\.txt", p).group(1)))
    print(f"\n=== {dev}  (|Vds| = 0.9 V, TT, 27C) ===")
    print(f"{'L(um)':>6} {'gm/Id':>6} {'|Vgs|':>7} {'Id/W uA/um':>11} {'gm/gds':>8}")
    for p in files:
        L = float(re.search(r"_L([\d.]+)\.txt", p).group(1))
        if dev == "pfetlvt" and L < 0.35:
            continue  # LVT PMOS minimum L is 0.35 um (simulated clamped)
        rows = load(p, dev != "nfet")
        for t in TARGETS:
            r = at_gmid(rows, t)
            if r:
                vgs, i_d, gm, gds = r
                print(f"{L:6.2f} {t:6.0f} {vgs:7.3f} {i_d / W * 1e6:11.3f} {gm / gds:8.1f}")
