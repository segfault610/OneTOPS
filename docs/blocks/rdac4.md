# L1 `rdac4`: 4-bit DVS reference DAC

**Function:** VREF = vlo + code × (vhi − vlo)/16. With vlo = 1.00 V and vhi = 1.48 V this is
**1.00–1.45 V in 30 mV steps**. Codes come from `dvs_ctrl` (`d0..d3`).

**Structure:** 16 × 10 kΩ resistor string (tap t0 = vlo … t15). A 4-level binary tree of 15 `mux2_tg`
selects the tap (bit d0 at the first level). Four `inv`s generate the complements. Ladder current
≈ 0.48 V / 160 kΩ = 3 µA. The output drives only the `vset_gen` OTA gate.

**Verification (`tb_rdac4`, TT):** all 16 codes **monotonic, 30.00 ± 0.02 mV/step**
(DNL < 0.001 LSB with ideal resistors).

**TODO:** sky130 `res_xhigh_po` resistors (mismatch → DNL); on-chip vhi/vlo (bandgap + divider, or pins
ua[*] as trims); settling time per code step with the real TG on-resistance.
