# L1 `bias_mirror`: NMOS bias distribution bank

**Function:** takes the 20 µA reference current `ibn` (diode MN0) and distributes copies.

| Output | Ratio | Feeds |
|---|---|---|
| `o_fvf` | **5 µA** (W = 1) | FVF node X sink base (MC current = 5 µA + I_load/500 from `ab_sense`) |
| `o_pd` | **5 µA** (W = 1) | PMOS reference diode in `vset_gen` (replica base current) |
| `o_tail` | 2× (40 µA) | `ota5t` tail |
| `o_bu` | 1× | `tr_boost` UB sensor bias diode |
| `o_dz` | 1× | `tr_boost` UB dead-zone sink |

All devices are nfet_01v8, L = 1 µm; W = 4 µm for 20 µA (gm/Id ≈ 10), W = 1 µm for the 5 µA base outputs (Rev D). The gate net `ibn` is also used
directly by `tr_boost` (OB bleeder bias through 1 MΩ).

*Rev C change:* the static 5× bleeder output `o_bl` moved into `tr_boost` as the dynamic bleeder MND.

**Verification (`tb_bias_mirror`, TT):** Rev D o_fvf = 4.3 µA at Vds = 0.6 V, reaching 95 % at
**Vds ≈ 0.30 V** (Rev C, 20 µA unit: 19.7 µA, compliance 0.32 V). The narrow W = 1 device mirrors about 14 % low; trim if it matters. That limits how low node X can go at full load (X min ≈ 0.45 V at 10 mA, OK).

**TODO:** on-chip reference (beta multiplier / PTAT); Monte-Carlo mismatch; consider L = 2 for better ro.
