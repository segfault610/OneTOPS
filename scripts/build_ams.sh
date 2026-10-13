#!/usr/bin/env bash
# Compile RTL for ngspice mixed-signal co-simulation (Verilator -> d_cosim shared library).
# Usage: scripts/build_ams.sh            -> sim/ams/dvs_ctrl.so
# vlnggen derives the library name from a .v file, so the .sv source is copied as .v and
# Verilator is told it is SystemVerilog.
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; B="$ROOT/sim/ams"; mkdir -p "$B"
for m in dvs_ctrl; do
  cp "$ROOT/rtl/$m.sv" "$B/$m.v"
  (cd "$B" && ngspice -b /usr/local/share/ngspice/scripts/vlnggen --default-language=1800-2017 "$m.v" > "$m.vlnggen.log" 2>&1)
  [ -f "$B/$m.so" ] && echo "built sim/ams/$m.so" || { echo "vlnggen failed, see sim/ams/$m.vlnggen.log"; exit 1; }
done
