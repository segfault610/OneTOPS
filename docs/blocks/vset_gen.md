# L1 `vset_gen` (+ `ota5t`): replica loop that generates VSET

**Function:** produces VSET = VREF − Vsg(MR, IB). The FVF output then sits at
VOUT = VSET + Vsg(MC, IB) ≈ VREF, tracking PVT because MR matches MC.

**Why a loop:** in Rev A0 the replica's 20 µA was drawn from VREF, so an R-string DAC couldn't drive
it. Now the OTA forces the replica source node `vrep` to equal VREF, and VREF only sees an OTA gate.

```
VIN ─ MPD(diode, i_pd) ─ MPS ─► vrep ──┬── MR (S=vrep, G=vset, D=gnd)
                                       └── ota5t inn
VREF ─────────────────────────────────── ota5t inp ;  ota5t out = vset (+ Cset 2 pF)
```

| Device | Type | W/L (µm) | Note |
|---|---|---|---|
| MPD, MPS | pfet_01v8_lvt | 10/2 | 20 µA source into vrep (mirror of o_pd) |
| MR | pfet_01v8_lvt | 100/1 | must match MC (layout: common-centroid with MC) |
| ota5t MN1/MN2 | nfet_01v8 | 5/1 | input pair, tail 40 µA |
| ota5t MP1/MP2 | pfet_01v8_lvt | 20/2 | mirror load |
| Cset | ideal | 2 pF | dominant pole / filters VREF steps |

**Verification (`tb_vset_gen`, TT, Rev D 5 µA replica, no adaptive part):** replica error (vrep − VREF) is
**+5.7 mV at 1.0 V, +3.3 mV at 1.2 V, +0.8 mV at 1.4 V** (Rev C, 20 µA: +8.2 mV at 0.95 V … +0.7 mV at 1.5 V).
**System-level:** VOUT − VREF = +12…15 mV across codes (see `ldo_top`). The extra error comes from
the MC/MR Vds mismatch (MC Vsd ≈ 0.3–0.8 V vs MR Vsd ≈ 1.2 V).

**TODO:** reduce the offset (cascode MR or match Vds; raise OTA gain with L = 2 inputs); check loop
stability with a VREF step; mismatch MC.
