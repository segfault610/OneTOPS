# L1 `bias_mirror`: NMOS bias distribution bank

**Function:** takes the 20 µA reference current `ibn` (diode MN0) and distributes copies.

| Output | Ratio | Feeds |
|---|---|---|
| `o_fvf` | 1× (20 µA) | FVF node X sink (sets MC current) |
| `o_pd` | 1× | PMOS reference diode in `vset_gen` (replica current) |
| `o_tail` | 2× (40 µA) | `ota5t` tail |
| `o_bu` | 1× | `tr_boost` UB sensor bias diode |
| `o_dz` | 1× | `tr_boost` UB dead-zone sink |

All devices are nfet_01v8, W/L = 4/1 µm (gm/Id ≈ 10 at 20 µA). The gate net `ibn` is also used
directly by `tr_boost` (OB bleeder bias through 1 MΩ).

*Rev C change:* the static 5× bleeder output `o_bl` moved into `tr_boost` as the dynamic bleeder MND.

**Verification (`tb_bias_mirror`, TT):** o_fvf = 19.7 µA at Vds = 0.6 V; compliance (19 µA) at
**Vds ≈ 0.32 V**. That limits how low node X can go at full load (X min ≈ 0.45 V at 10 mA, OK).

**TODO:** on-chip reference (beta multiplier / PTAT); Monte-Carlo mismatch; consider L = 2 for better ro.
