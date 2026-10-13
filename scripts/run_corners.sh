#!/usr/bin/env bash
# PVT sweep over already-netlisted xschem testbenches (run scripts/run_tb.sh first).
# Usage: scripts/run_corners.sh [tb ...]   default: tb_ldo_core_ac tb_ldo_core_tran
# Output: results/corners_<tb>.txt  (one line per corner/temp/VIN with the key measurements)
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; NL="$ROOT/sim/xschem_netlist"
tbs=("$@"); [ ${#tbs[@]} -eq 0 ] && tbs=(tb_ldo_core_ac tb_ldo_core_tran)
for tb in "${tbs[@]}"; do
  out="$ROOT/results/corners_$tb.txt"; : > "$out"
  for c in tt ss ff sf fs; do for t in -40 27 125; do for v in 1.62 1.8 1.98; do
    f="$NL/_corner_$tb.spice"
    sed -e "s/sky130.lib.spice tt/sky130.lib.spice $c/" -e "s/^\.temp 27/.temp $t/" \
        -e "s/^Vin vin 0 dc 1.8/Vin vin 0 dc $v/" "$NL/$tb.spice" > "$f"
    r=$(cd "$NL" && ngspice -b "$f" 2>&1 | grep -E "^LG|^under_mv|^over_mv" | sed 's/LG //' | tr '\n' ' ')
    echo "$c T=$t VIN=$v | $r" >> "$out"
  done; done; done
  rm -f "$NL/_corner_$tb.spice"
done
