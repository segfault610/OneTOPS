#!/usr/bin/env bash
# PVT sweep of tb_ac (loop gain/PSRR) and tb_tran (load step): corners x temps x VIN
# Usage: ./run_corners.sh   -> results/corners.txt
cd "$(dirname "$0")"
out=../../results/corners.txt; : > "$out"
for c in tt ss ff sf fs; do for t in -40 27 125; do for v in 1.62 1.8 1.98; do
  for tb in tb_ac tb_tran; do
    sed -e "s/sky130.lib.spice tt/sky130.lib.spice $c/" -e "s/^.temp 27/.temp $t/" -e "s/VIN=1.8 /VIN=$v /" tb_common.spice > tb_common_corner.spice
    sed "s/tb_common.spice/tb_common_corner.spice/" $tb.spice > ${tb}_corner.spice
    r=$(ngspice -b ${tb}_corner.spice 2>&1 | grep -E "^LG|^under_mv|^over_mv|^tsettle" | tr '\n' ' ')
    echo "$c T=$t VIN=$v $tb: $r" >> "$out"
  done
done; done; done
rm -f tb_common_corner.spice tb_ac_corner.spice tb_tran_corner.spice
