#!/usr/bin/env bash
# Netlist an xschem testbench (hierarchical) and simulate it with ngspice.
# Usage: scripts/run_tb.sh tb_ldo_core_dc [tb_ldo_core_ac ...]   (or "all")
# Netlists -> sim/xschem_netlist/<tb>.spice   logs -> results/<tb>.log
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
NL="$ROOT/sim/xschem_netlist"; mkdir -p "$NL" "$ROOT/results"
[ -f "$NL/.spiceinit" ] || cp /usr/local/share/pdk/sky130A/libs.tech/ngspice/spinit "$NL/.spiceinit"
tbs=("$@"); [ "$1" = all ] && tbs=($(cd "$ROOT/xschem/onetops_tb" && ls tb_*.sch | sed 's/\.sch$//'))
[ -f "$ROOT/sim/ams/dvs_ctrl.so" ] || "$ROOT/scripts/build_ams.sh"
for tb in "${tbs[@]}"; do
  rm -f "$NL/$tb.spice"
  # xschem exits non-zero on netlist *warnings* (e.g. nets driven only from a code block): only a missing netlist is fatal
  (cd "$ROOT" && timeout 120 xschem --rcfile xschemrc -n -s -q -x -o "$NL" "xschem/onetops_tb/$tb.sch" >/dev/null 2>&1) || true
  [ -f "$NL/$tb.spice" ] || { echo "!! $tb: xschem produced no netlist"; continue; }
  (cd "$NL" && timeout 900 ngspice -b "$tb.spice" > "$ROOT/results/$tb.log" 2>&1) || echo "!! $tb: ngspice exit $?"
  echo "=== $tb"
  grep -E "^(LG|PSRR|VOUT|code|[0-9]+ )|_mv|_ua|_ma|_mv_per|under|over|^v_|^vm|^TRAN|^WORKLOAD|^AMS|^-i|err" "$ROOT/results/$tb.log" | grep -v -i "^error" || true
  grep -iE "^error|fatal|singular|timestep too small" "$ROOT/results/$tb.log" | sort | uniq -c | head -5 || true
done
