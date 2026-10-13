# L1 `fvf_core` + `pass_pmos`: the regulation devices

| Cell | Device | Type | W/L | Role |
|---|---|---|---|---|
| `fvf_core` | MC | pfet_01v8_lvt | 100/1 µm | FVF control device: S = VOUT (body tied), G = VSET, D = X |
| `pass_pmos` | MP | pfet_01v8 (std-Vt) | 70 × 10/0.35 µm (700 µm) | Pass device, gate driven from X |

**Operation:** VOUT is a source follower of VSET through MC, whose current is fixed by the 20 µA
sink at X. Any VOUT error changes MC's current, which moves X and so the pass gate: single-stage
negative feedback with a very low output impedance.

**Key sizing decisions (from `results/gmid_tables.txt` and `sim/char/pass_sizing.spice`):**
- **Std-Vt pass device on purpose.** The FVF clamps X ≤ VOUT − Vsd,sat(MC) ≈ 1.0 V at VOUT = 1.2 V.
  At that gate voltage an LVT PMOS would still carry mA; std-Vt carries ~0.025 µA/µm.
- 35 µA/µm at |Vsg| = 1.8 V, |Vsd| = 0.3 V (L = 0.35) → 700 µm gives ≈ 13.5 mA (TT) with X ≥ 0.15 V.
- MC LVT at gm/Id ≈ 14: |Vsg| ≈ 0.5 V, so VSET ≈ VREF − 0.5 V stays above ground.

**Known limitation (open issue 1):** at 125 °C and VIN = 1.98 V, MP leakage at the clamp exceeds the
100 µA bleeder for loads ≤ 100 µA (≤ 1 mA at fs), so VOUT drifts up 120–150 mV.
Fix: a level shifter between X and the gate, or a PTAT/adaptive bleeder.

**TODO:** pass-device layout (multi-finger, many contacts, metal for 10 mA); leakage vs. temperature table; MC/MR matching.
