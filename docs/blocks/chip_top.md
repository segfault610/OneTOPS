# L4 `chip_top`: Tiny Tapeout test chip

**Contains:** `ldo_top` + `decap` (20 pF) + `load_emu`.
**Ports:** vhi, vlo, d0–d3, ibn, ben, ld0–ld3, ibl, vout, vin, vss.

**Planned TT pin mapping (draft):**

| TT pin | Signal |
|---|---|
| `ui_in[3:0]` | DVS code d0–d3 (later from `dvs_ctrl`) |
| `ui_in[7:4]` | load pattern ld0–ld3 |
| `uio_in[0]` | ben (boost enable, for silicon A/B) |
| `ua[0]` | VOUT sense (high-impedance scope probe) |
| `ua[1]` | VREF monitor / external VREF override |
| `ua[2..3]` | vhi / vlo (until an on-chip reference exists) |
| `ua[4]` | ibn trim (external bias) |
| VDPWR | VIN (1.8 V) |

**Verification (`tb_chip_workload`):** sleep (0) → sense (1.28 mA @ 10 µs) → DVS 7 → 10 @ 30 µs →
inference (9.6 mA @ 35 µs) → comm (5.1 mA @ 45 µs) → DVS → 4 @ 50 µs → sleep @ 55 µs,
with 10 ns load edges and 5 pF pad load.

| | ben = 0 | ben = 1 |
|---|---|---|
| Dip at inference burst | 536 mV | **258 mV** |
| Overshoot inference → comm | 170 mV | 171 mV |
| Overshoot comm → sleep | 209 mV | 211 mV |
| Average input current | 2.86 mA | 2.86 mA |

**TODO:** TT analog template + `tt_um_` wrapper; digital `dvs_ctrl` on the digital side; ESD / pad
considerations on `ua[*]`; floorplan inside 2 × 2 tiles.
