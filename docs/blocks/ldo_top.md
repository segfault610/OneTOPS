# L3 `ldo_top`: DVS LDO IP

**Ports:** vhi, vlo, d0–d3 (DVS code), ibn, ben, vout, vin, vss.
**Contains:** `rdac4` (VREF) + `ldo_core`.

**Verification (`tb_ldo_top_dvs`, TT, 5 mA load, 5 µs per code; Rev C values. Rev D: +14.7 mV @ code 0, +12.2 @ 7, +11.9 @ 15):**

| code | 0 | 3 | 7 | 11 | 15 |
|---|---|---|---|---|---|
| VREF (V) | 1.000 | 1.090 | 1.210 | 1.330 | 1.450 |
| VOUT (V) | 1.0151 | 1.1039 | 1.2226 | 1.3417 | 1.4626 |
| error (mV) | +15.1 | +13.9 | +12.6 | +11.7 | +12.6 |

Monotonic across all 16 codes. The systematic +12…15 mV is mostly the replica mismatch (see
`vset_gen.md`), and could be trimmed digitally by shifting vlo by −13 mV.

**TODO:** fix the offset in analog; settling time and overshoot per DVS step (with `dvs_ctrl` slew limiting).
