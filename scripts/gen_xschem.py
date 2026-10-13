#!/usr/bin/env python3
"""Generate the OneTOPS hierarchical xschem library (cells + symbols + testbenches).

Every cell is a separate .sch with a matching .sym, so it can be placed as a block in
the next level up (Virtuoso-style cell library). Connectivity is by net labels on short
wire stubs at every device terminal; you can re-arrange or draw wires in xschem freely.

Hierarchy
  L0 primitives : inv, tgate
  L1 blocks     : bias_mirror, fvf_core, pass_pmos, comp_rc, lg_probe, ota5t, vset_gen,
                  mux2_tg, rdac4
  L2 subsystems : ldo_core (complete FVF regulation loop, VREF in)
  L3 top        : ldo_top (rdac4 DVS reference + ldo_core)  -- the reusable DVS-LDO IP
  L4 chip       : chip_top (ldo_top + on-chip decap + load_emu workload emulator) -- Tiny Tapeout

Sizing is the single source of truth: edit SIZES below, rerun, re-netlist.
Usage:  python3 scripts/gen_xschem.py      (writes xschem/onetops/ and xschem/onetops_tb/)
"""
import os

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
LIB = "onetops"
TBLIB = "onetops_tb"
PR = "sky130_fd_pr"
HDR = "v {xschem version=3.4.8RC file_version=1.2 }\n"
PDK_LIB = "/usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice"

# ---------------------------------------------------------------- sizing (Rev A) --
SIZES = dict(
    bias=dict(W=4, L=1),                  # NMOS mirror bank, 20 uA unit (gm/Id ~ 10)
    bleed_m=5,                            # minimum-load bleeder = 5 x IB = 100 uA
    tail_m=2,                             # OTA tail = 2 x IB
    mc=dict(W=100, L=1),                  # FVF control PMOS (LVT), gm/Id ~ 14 @ 20 uA
    mr=dict(W=100, L=1),                  # replica PMOS (LVT), must match MC
    mpsrc=dict(W=10, L=2),                # replica current source PMOS mirror (LVT)
    ota_in=dict(W=5, L=1),                # OTA NMOS input pair
    ota_ld=dict(W=20, L=2),               # OTA PMOS (LVT) mirror load
    cset="2p",                            # VSET filter / dominant-pole cap
    mp=dict(W=10, L=0.35, mult=70),       # pass device, std-Vt PMOS, 700 um total
    rz="1", cc="4p",                      # Miller compensation (Rz=1 ohm => plain Cc). Rev A: 12p @ CL=100p
    cl="20p",                             # on-chip output decap (TT area budget). TODO: MIM
    ld_unit_m=32, ld=dict(W=4, L=1),      # load_emu unit sink = 32 x 20 uA = 0.64 mA (bits x1,x2,x4,x8)
    ld_sw=dict(W=20, L=0.15),             # load_emu series switch per unit
    inv_n=dict(W=1, L=0.15), inv_p=dict(W=2, L=0.15),
    tg_n=dict(W=1, L=0.15), tg_p=dict(W=2, L=0.15),
    rlad="10k",                           # R-DAC unit resistor (16 in series)
)

# symbol pin geometry for PDK MOS symbols (pin -> (dx, dy, stub direction))
NMOS_PINS = {"D": (20, -30, "u"), "G": (-20, 0, "l"), "S": (20, 30, "d"), "B": (20, 0, "r")}
PMOS_PINS = {"S": (20, -30, "u"), "G": (-20, 0, "l"), "D": (20, 30, "d"), "B": (20, 0, "r")}
TWO_PINS = {"P": (0, -30, "u"), "M": (0, 30, "d")}         # res.sym / capa.sym / sources
STUB = 20

# registry of generated symbols: name -> {pin: (dx, dy, dir)}
SYMS = {}


def esc_attr(s):
    """Escape a string for use inside a quoted attribute value in an xschem {...} block.
    NOTE: avoid double quotes in testbench control text; an escaped quote ends code blocks."""
    return s.replace("\\", "\\\\").replace('"', '\\"').replace("{", "\\{").replace("}", "\\}")


class Sch:
    def __init__(self, title):
        self.lines = []
        self.title = title
        self.nl = 0

    def _label(self, x, y, d, net):
        dx, dy = {"l": (-STUB, 0), "r": (STUB, 0), "u": (0, -STUB), "d": (0, STUB)}[d]
        x2, y2 = x + dx, y + dy
        self.lines.append(f"N {x} {y} {x2} {y2} {{lab={net}}}")
        rot, flip = {"l": (0, 0), "r": (0, 1), "u": (1, 1), "d": (3, 1)}[d]
        self.lines.append(f"C {{devices/lab_pin.sym}} {x2} {y2} {rot} {flip} "
                          f"{{name=l{self.nl} sig_type=std_logic lab={net}}}")
        self.nl += 1

    def _connect(self, x, y, pinmap, conn):
        for pin, net in conn.items():
            dx, dy, d = pinmap[pin]
            self._label(x + dx, y + dy, d, net)

    def mos(self, kind, name, x, y, conn, W, L, mult=1):
        """kind: nfet_01v8 | pfet_01v8 | pfet_01v8_lvt | nfet_01v8_lvt; conn: {D,G,S,B: net}"""
        self.lines.append(
            f"C {{{PR}/{kind}.sym}} {x} {y} 0 0 {{name={name}\nL={L}\nW={W}\nnf=1\nmult={mult}\n"
            f"ad=\"expr('int((@nf + 1)/2) * @W / @nf * 0.29')\"\n"
            f"pd=\"expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')\"\n"
            f"as=\"expr('int((@nf + 2)/2) * @W / @nf * 0.29')\"\n"
            f"ps=\"expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')\"\n"
            f"nrd=\"expr('0.29 / @W ')\" nrs=\"expr('0.29 / @W ')\"\n"
            f"sa=0 sb=0 sd=0\nmodel={kind}\nspiceprefix=X\n}}")
        self._connect(x, y, PMOS_PINS if kind.startswith("pfet") else NMOS_PINS, conn)

    def two(self, sym, name, x, y, p, m, value):
        """res / capa / vsource / isource: p = top pin net, m = bottom pin net."""
        v = esc_attr(value)
        extra = " m=1" if sym in ("res", "capa") else ""
        self.lines.append(f"C {{devices/{sym}.sym}} {x} {y} 0 0 {{name={name} value=\"{v}\"{extra}}}")
        self._connect(x, y, TWO_PINS, {"P": p, "M": m})

    def inst(self, cell, name, x, y, conn, lib=LIB):
        self.lines.append(f"C {{{lib}/{cell}.sym}} {x} {y} 0 0 {{name={name}}}")
        self._connect(x, y, SYMS[cell], conn)

    def pin(self, kind, x, y, net):
        """kind: ipin | opin | iopin -- cell port, joined to internal nets by name."""
        self.lines.append(f"C {{devices/{kind}.sym}} {x} {y} 0 0 {{name=p{self.nl} lab={net}}}")
        self.nl += 1

    def ports(self, ins=(), outs=(), ios=(), x=-300, y=-300):
        for i, n in enumerate(ins):
            self.pin("ipin", x, y + 20 * i, n)
        for i, n in enumerate(outs):
            self.pin("opin", x + 120, y + 20 * i, n)
        for i, n in enumerate(ios):
            self.pin("iopin", x + 240, y + 20 * i, n)

    def code(self, name, x, y, text):
        self.lines.append(f"C {{devices/code_shown.sym}} {x} {y} 0 0 "
                          f"{{name={name} only_toplevel=true value=\"{esc_attr(text)}\"}}")

    def text(self, x, y, s, size=0.4):
        self.lines.append(f"T {{{esc_attr(s)}}} {x} {y} 0 0 {size} {size} {{}}")

    def write(self, path):
        body = [HDR, "G {}", "K {}", "V {}", "S {}", "E {}"]
        body.append(f"T {{{esc_attr(self.title)}}} -300 -380 0 0 0.6 0.6 {{}}")
        body += self.lines
        with open(path, "w") as f:
            f.write("\n".join(body) + "\n")


def make_sym(name, left, right, path, top=(), bottom=()):
    """Box symbol. left/right/top/bottom: lists of (pin, dir). Pin order in the .subckt
    line = order listed here (left, right, top, bottom)."""
    n = max(len(left), len(right), 1)
    w = max(60, 10 * max([len(p) for p, _ in left + right] + [4]) + 40,
            40 * max(len(top), len(bottom), 1))
    h = 20 * n + 10
    pins, out = {}, []
    out += [f"L 4 {-w} {-h} {w} {-h} {{}}", f"L 4 {w} {-h} {w} {h} {{}}",
            f"L 4 {w} {h} {-w} {h} {{}}", f"L 4 {-w} {h} {-w} {-h} {{}}"]

    def place(lst, side):
        for i, (p, d) in enumerate(lst):
            if side in "lr":
                y = -h + 20 + 40 * i * (n / max(len(lst), 1)) if len(lst) > 1 else 0
                y = int(round(y / 10.0) * 10)
                x0, x1 = (-w, -w - 20) if side == "l" else (w, w + 20)
                out.append(f"L 4 {x0} {y} {x1} {y} {{}}")
                out.append(f"B 5 {x1 - 2.5} {y - 2.5} {x1 + 2.5} {y + 2.5} {{name={p} dir={d}}}")
                tx = -w + 5 if side == "l" else w - 5
                out.append(f"T {{{p}}} {tx} {y - 7} 0 {0 if side == 'l' else 1} 0.2 0.2 {{}}")
                pins[p] = (x1, y, side)
            else:
                x = int(-w + (2 * w) * (i + 1) / (len(lst) + 1))
                x = int(round(x / 10.0) * 10)
                y0, y1 = (-h, -h - 20) if side == "u" else (h, h + 20)
                out.append(f"L 4 {x} {y0} {x} {y1} {{}}")
                out.append(f"B 5 {x - 2.5} {y1 - 2.5} {x + 2.5} {y1 + 2.5} {{name={p} dir={d}}}")
                ty = -h + 5 if side == "u" else h - 17
                out.append(f"T {{{p}}} {x - 10} {ty} 0 0 0.2 0.2 {{}}")
                pins[p] = (x, y1, side)

    place(left, "l"); place(right, "r"); place(top, "u"); place(bottom, "d")
    k = ['K {type=subcircuit', 'format="@name @pinlist @symname"', 'template="name=x1"', '}']
    txt = [f"T {{@symname}} {-w + 5} {-h - 25} 0 0 0.3 0.3 {{}}", f"T {{@name}} {w - 5} {h + 5} 0 1 0.25 0.25 {{}}"]
    with open(path, "w") as f:
        f.write("\n".join([HDR, "G {}"] + k + ["V {}", "S {}", "E {}"] + out + txt) + "\n")
    SYMS[name] = pins


def cell(name, left, right, top=(), bottom=()):
    d = os.path.join(ROOT, "xschem", LIB)
    make_sym(name, left, right, os.path.join(d, name + ".sym"), top, bottom)
    return os.path.join(d, name + ".sch")


S = SIZES

# ============================================================ L0 primitives ====
def gen_inv():
    p = cell("inv", [("a", "in")], [("y", "out")], top=[("vdd", "inout")], bottom=[("vss", "inout")])
    s = Sch("inv -- L0 static CMOS inverter (1.8 V)")
    s.ports(["a"], ["y"], ["vdd", "vss"])
    s.mos("pfet_01v8", "MP1", 0, -100, dict(S="vdd", G="a", D="y", B="vdd"), **S["inv_p"])
    s.mos("nfet_01v8", "MN1", 0, 50, dict(D="y", G="a", S="vss", B="vss"), **S["inv_n"])
    s.write(p)


def gen_tgate():
    p = cell("tgate", [("a", "inout"), ("en", "in"), ("enb", "in")], [("b", "inout")],
             top=[("vdd", "inout")], bottom=[("vss", "inout")])
    s = Sch("tgate -- L0 transmission gate (on when en=1, enb=0)")
    s.ports(["en", "enb"], [], ["a", "b", "vdd", "vss"])
    s.mos("nfet_01v8", "MN1", 0, 0, dict(D="a", G="en", S="b", B="vss"), **S["tg_n"])
    s.mos("pfet_01v8", "MP1", 200, 0, dict(S="a", G="enb", D="b", B="vdd"), **S["tg_p"])
    s.write(p)


# ============================================================== L1 blocks ======
def gen_bias_mirror():
    p = cell("bias_mirror", [("ibn", "in")],
             [("o_fvf", "out"), ("o_bl", "out"), ("o_pd", "out"), ("o_tail", "out")],
             bottom=[("vss", "inout")])
    s = Sch("bias_mirror -- L1 NMOS mirror bank (IB=20 uA in -> FVF sink, bleeder, PMOS-ref, OTA tail)")
    s.ports(["ibn"], ["o_fvf", "o_bl", "o_pd", "o_tail"], ["vss"])
    b = S["bias"]
    s.mos("nfet_01v8", "MN0", 0, 0, dict(D="ibn", G="ibn", S="vss", B="vss"), **b)
    s.mos("nfet_01v8", "MN1", 200, 0, dict(D="o_fvf", G="ibn", S="vss", B="vss"), **b)
    s.mos("nfet_01v8", "MN2", 400, 0, dict(D="o_bl", G="ibn", S="vss", B="vss"), mult=S["bleed_m"], **b)
    s.mos("nfet_01v8", "MN3", 600, 0, dict(D="o_pd", G="ibn", S="vss", B="vss"), **b)
    s.mos("nfet_01v8", "MN4", 800, 0, dict(D="o_tail", G="ibn", S="vss", B="vss"), mult=S["tail_m"], **b)
    s.text(0, 100, "o_fvf: 1x (FVF node X sink)   o_bl: 5x min-load bleeder   o_pd: 1x   o_tail: 2x", 0.3)
    s.write(p)


def gen_fvf_core():
    p = cell("fvf_core", [("vset", "in")], [("x", "out")], top=[("vout", "inout")])
    s = Sch("fvf_core -- L1 flipped-voltage-follower control device MC (VOUT = VSET + Vsg)")
    s.ports(["vset"], ["x"], ["vout"])
    s.mos("pfet_01v8_lvt", "MC", 0, 0, dict(S="vout", G="vset", D="x", B="vout"), **S["mc"])
    s.write(p)


def gen_pass_pmos():
    p = cell("pass_pmos", [("g", "in")], [("vout", "inout")], top=[("vin", "inout")])
    s = Sch("pass_pmos -- L1 pass device (std-Vt PMOS, high |Vth| = low leakage at FVF clamp)")
    s.ports(["g"], [], ["vin", "vout"])
    s.mos("pfet_01v8", "MP", 0, 0, dict(S="vin", G="g", D="vout", B="vin"), **S["mp"])
    s.write(p)


def gen_comp_rc():
    p = cell("comp_rc", [("a", "inout")], [("b", "inout")])
    s = Sch("comp_rc -- L1 Miller compensation Rz + Cc (gate X to VOUT). TODO: MIM cap + poly R")
    s.ports([], [], ["a", "b"])
    s.two("res", "Rz", 0, 0, "a", "n1", S["rz"])
    s.two("capa", "Cc", 0, 120, "n1", "b", S["cc"])
    s.write(p)


def gen_lg_probe():
    p = cell("lg_probe", [("drv", "inout")], [("lin", "inout")])
    s = Sch("lg_probe -- L1 Tian loop-gain probe (Vbrk + on lin, Iinj into lin). ac 0 = transparent")
    s.ports([], [], ["drv", "lin"])
    s.two("vsource", "Vbrk", 0, 0, "lin", "drv", "dc 0 ac 0")
    s.two("isource", "Iinj", 200, 0, "0", "lin", "dc 0 ac 0")
    s.text(0, 80, "Testbench: alter @v.<path>.vbrk[acmag] / @i.<path>.iinj[acmag] (see tb_ldo_core_ac)", 0.3)
    s.write(p)


def gen_ota5t():
    p = cell("ota5t", [("inp", "in"), ("inn", "in"), ("tail", "inout")], [("out", "out")],
             top=[("vdd", "inout")])
    s = Sch("ota5t -- L1 5-transistor OTA, NMOS input, LVT PMOS mirror (out non-inverting from inp)")
    s.ports(["inp", "inn"], ["out"], ["tail", "vdd"])
    s.mos("pfet_01v8_lvt", "MP1", 0, -150, dict(S="vdd", G="nd", D="nd", B="vdd"), **S["ota_ld"])
    s.mos("pfet_01v8_lvt", "MP2", 300, -150, dict(S="vdd", G="nd", D="out", B="vdd"), **S["ota_ld"])
    s.mos("nfet_01v8", "MN1", 0, 50, dict(D="nd", G="inp", S="tail", B="0"), **S["ota_in"])
    s.mos("nfet_01v8", "MN2", 300, 50, dict(D="out", G="inn", S="tail", B="0"), **S["ota_in"])
    s.write(p)


def gen_vset_gen():
    p = cell("vset_gen", [("vref", "in"), ("i_pd", "inout"), ("i_tail", "inout")], [("vset", "out")],
             top=[("vin", "inout")])
    s = Sch("vset_gen -- L1 replica loop: OTA forces Vsrc(MR)=VREF => VSET = VREF - Vsg(MR,IB). VREF is high-Z")
    s.ports(["vref"], ["vset"], ["i_pd", "i_tail", "vin"])
    m = S["mpsrc"]
    s.mos("pfet_01v8_lvt", "MPD", 0, -150, dict(S="vin", G="i_pd", D="i_pd", B="vin"), **m)
    s.mos("pfet_01v8_lvt", "MPS", 250, -150, dict(S="vin", G="i_pd", D="vrep", B="vin"), **m)
    s.mos("pfet_01v8_lvt", "MR", 250, 50, dict(S="vrep", G="vset", D="0", B="vrep"), **S["mr"])
    s.inst("ota5t", "xota", 600, 0, dict(inp="vref", inn="vrep", tail="i_tail", out="vset", vdd="vin"))
    s.two("capa", "Cset", 900, 50, "vset", "0", S["cset"])
    s.write(p)


def gen_mux2_tg():
    p = cell("mux2_tg", [("i0", "inout"), ("i1", "inout"), ("s", "in"), ("sb", "in")], [("y", "inout")],
             top=[("vdd", "inout")], bottom=[("vss", "inout")])
    s = Sch("mux2_tg -- L1 analog 2:1 mux (s=0 -> i0, s=1 -> i1)")
    s.ports(["s", "sb"], [], ["i0", "i1", "y", "vdd", "vss"])
    s.inst("tgate", "xt0", 0, 0, dict(a="i0", b="y", en="sb", enb="s", vdd="vdd", vss="vss"))
    s.inst("tgate", "xt1", 400, 0, dict(a="i1", b="y", en="s", enb="sb", vdd="vdd", vss="vss"))
    s.write(p)


def gen_rdac4():
    left = [("vhi", "inout"), ("vlo", "inout"), ("d0", "in"), ("d1", "in"), ("d2", "in"), ("d3", "in")]
    p = cell("rdac4", left, [("out", "out")], top=[("vdd", "inout")], bottom=[("vss", "inout")])
    s = Sch("rdac4 -- L1 4-bit R-string DAC + TG mux tree: out = vlo + code*(vhi-vlo)/16 (DVS reference)")
    s.ports(["d0", "d1", "d2", "d3"], ["out"], ["vhi", "vlo", "vdd", "vss"])
    for k in range(16):
        top = "vhi" if k == 15 else f"t{k + 1}"
        bot = "vlo" if k == 0 else f"t{k}"
        s.two("res", f"R{k}", 0, -150 * k, top, bot, S["rlad"])
    s.text(-200, -2500, "tap t0 = vlo, t16 = vhi (unused); code k selects t_k", 0.3)
    for b in range(4):
        s.inst("inv", f"xinv{b}", 300, -2300 + 200 * b, dict(a=f"d{b}", y=f"d{b}b", vdd="vdd", vss="vss"))
    tap = lambda k: "vlo" if k == 0 else f"t{k}"
    prev = [tap(k) for k in range(16)]
    x = 700
    for lvl in range(4):
        nxt = []
        for j in range(len(prev) // 2):
            o = "out" if len(prev) == 2 else f"n{lvl + 1}_{j}"
            s.inst("mux2_tg", f"xm{lvl}_{j}", x, -2300 + 300 * j,
                   dict(i0=prev[2 * j], i1=prev[2 * j + 1], s=f"d{lvl}", sb=f"d{lvl}b", y=o, vdd="vdd", vss="vss"))
            nxt.append(o)
        prev = nxt
        x += 500
    s.write(p)


# =========================================================== L2 subsystem ======
def gen_ldo_core():
    p = cell("ldo_core", [("vref", "in"), ("ibn", "in")], [("vout", "inout")],
             top=[("vin", "inout")], bottom=[("vss", "inout")])
    s = Sch("ldo_core -- L2 capacitorless FVF LDO regulation loop (Rev A): VOUT ~= VREF, 0..10 mA, CL<=100 pF")
    s.ports(["vref", "ibn"], [], ["vout", "vin", "vss"])
    s.inst("bias_mirror", "xbias", 0, 0, dict(ibn="ibn", o_fvf="x", o_bl="vout", o_pd="i_pd", o_tail="i_tail", vss="vss"))
    s.inst("vset_gen", "xvset", 500, 0, dict(vref="vref", i_pd="i_pd", i_tail="i_tail", vset="vset", vin="vin"))
    s.inst("fvf_core", "xfvf", 1000, 0, dict(vset="vset", x="x", vout="vout"))
    s.inst("lg_probe", "xprobe", 1000, 250, dict(drv="x", lin="xg"))
    s.inst("pass_pmos", "xpass", 1400, 0, dict(g="xg", vout="vout", vin="vin"))
    s.inst("comp_rc", "xcomp", 1400, 250, dict(a="x", b="vout"))
    s.write(p)


def gen_decap():
    p = cell("decap", [("a", "inout")], [("b", "inout")])
    s = Sch("decap -- L1 on-chip output decoupling capacitor. TODO: sky130 MIM (cap_mim_m3_1) array")
    s.ports([], [], ["a", "b"])
    s.two("capa", "C1", 0, 0, "a", "b", S["cl"])
    s.write(p)


def gen_load_emu():
    left = [("ld0", "in"), ("ld1", "in"), ("ld2", "in"), ("ld3", "in"), ("ibl", "in")]
    p = cell("load_emu", left, [("vout", "inout")], bottom=[("vss", "inout")])
    s = Sch("load_emu -- L1 on-chip Edge-AI workload emulator: I = (ld0 + 2 ld1 + 4 ld2 + 8 ld3) x 0.64 mA (IBL = 20 uA)")
    s.ports(["ld0", "ld1", "ld2", "ld3", "ibl"], [], ["vout", "vss"])
    s.mos("nfet_01v8", "MD0", 0, 0, dict(D="ibl", G="ibl", S="vss", B="vss"), **S["bias"])
    for b in range(4):
        x = 300 + 300 * b
        s.mos("nfet_01v8", f"MSW{b}", x, -150, dict(D="vout", G=f"ld{b}", S=f"n{b}", B="vss"),
              W=S["ld_sw"]["W"] * 2 ** b, L=S["ld_sw"]["L"])
        s.mos("nfet_01v8", f"MS{b}", x, 50, dict(D=f"n{b}", G="ibl", S="vss", B="vss"),
              mult=S["ld_unit_m"] * 2 ** b, **S["ld"])
    s.write(p)


# ================================================================= L3 top ======
def gen_ldo_top():
    left = [("vhi", "inout"), ("vlo", "inout"), ("d0", "in"), ("d1", "in"), ("d2", "in"), ("d3", "in"), ("ibn", "in")]
    p = cell("ldo_top", left, [("vout", "inout")], top=[("vin", "inout")], bottom=[("vss", "inout")])
    s = Sch("ldo_top -- L3 DVS LDO: 4-bit code -> rdac4 -> VREF -> ldo_core. VOUT = 1.00 + 0.03*code V")
    s.ports(["d0", "d1", "d2", "d3", "ibn"], [], ["vhi", "vlo", "vout", "vin", "vss"])
    s.inst("rdac4", "xdac", 0, 0, dict(vhi="vhi", vlo="vlo", d0="d0", d1="d1", d2="d2", d3="d3", out="vref", vdd="vin", vss="vss"))
    s.inst("ldo_core", "xcore", 500, 0, dict(vref="vref", ibn="ibn", vout="vout", vin="vin", vss="vss"))
    s.write(p)


# ================================================================ L4 chip ======
def gen_chip_top():
    left = [("vhi", "inout"), ("vlo", "inout"), ("d0", "in"), ("d1", "in"), ("d2", "in"), ("d3", "in"),
            ("ibn", "in"), ("ld0", "in"), ("ld1", "in"), ("ld2", "in"), ("ld3", "in"), ("ibl", "in")]
    p = cell("chip_top", left, [("vout", "inout")], top=[("vin", "inout")], bottom=[("vss", "inout")])
    s = Sch("chip_top -- L4 Tiny Tapeout test chip: DVS LDO + 20 pF decap + on-chip workload emulator")
    s.ports(["d0", "d1", "d2", "d3", "ibn", "ld0", "ld1", "ld2", "ld3", "ibl"], [], ["vhi", "vlo", "vout", "vin", "vss"])
    s.inst("ldo_top", "xldo", 0, 0, dict(vhi="vhi", vlo="vlo", d0="d0", d1="d1", d2="d2", d3="d3",
                                        ibn="ibn", vout="vout", vin="vin", vss="vss"))
    s.inst("decap", "xdecap", 500, 0, dict(a="vout", b="vss"))
    s.inst("load_emu", "xload", 900, 0, dict(ld0="ld0", ld1="ld1", ld2="ld2", ld3="ld3", ibl="ibl", vout="vout", vss="vss"))
    s.text(0, 300, "TT mapping (planned): vout -> ua[0] (sense only, pin max 4 mA), vref monitor -> ua[1], d[3:0]/ld[3:0] -> ui_in", 0.3)
    s.write(p)


# ============================================================ testbenches ======
def tb(name, title, build, control):
    s = Sch(title)
    build(s)
    s.code("MODELS", -300, 400, f".lib {PDK_LIB} tt\n.temp 27\n.option savecurrents")
    s.code("NGSPICE", 400, 400, control)
    s.write(os.path.join(ROOT, "xschem", TBLIB, name + ".sch"))


def supplies(s, vin="1.8", ib="20u"):
    s.two("vsource", "Vin", -200, 0, "vin", "0", f"dc {vin} ac 0")
    s.two("isource", "Ib", -100, 0, "vin", "ibn", f"dc {ib}")


def gen_tbs():
    # ---- L1: bias mirror output currents vs output voltage
    def b_bias(s):
        s.two("vsource", "Vdd", -200, 0, "vdd", "0", "1.8")
        s.two("isource", "Ib", -100, 0, "vdd", "ibn", "dc 20u")
        s.inst("bias_mirror", "xdut", 200, 0, dict(ibn="ibn", o_fvf="o1", o_bl="o2", o_pd="o3", o_tail="o4", vss="0"))
        for i in range(1, 5):
            s.two("vsource", f"Vo{i}", 450 + 100 * i, 0, f"o{i}", "0", "dc 0.6")
    tb("tb_bias_mirror", "tb_bias_mirror -- L1: mirror output currents vs Vds (compliance)", b_bias, """.control
dc vo1 0 1.8 0.01
let i1 = -i(vo1)
let i2 = -i(vo2)
meas dc i_fvf_06 find i1 at=0.6
meas dc vds_min when i1=19u cross=1
op
print -i(vo1) -i(vo2) -i(vo3) -i(vo4)
.endc""")

    # ---- L1: vset_gen DC tracking over the DVS range
    def b_vset(s):
        supplies(s)
        s.two("vsource", "Vref", 0, 0, "vref", "0", "dc 1.2")
        s.inst("bias_mirror", "xbias", 300, 0, dict(ibn="ibn", o_fvf="x", o_bl="vbl", o_pd="i_pd", o_tail="i_tail", vss="0"))
        s.two("vsource", "Vx", 550, 0, "x", "0", "dc 0.8")
        s.two("vsource", "Vbl", 650, 0, "vbl", "0", "dc 1.2")
        s.inst("vset_gen", "xdut", 900, 0, dict(vref="vref", i_pd="i_pd", i_tail="i_tail", vset="vset", vin="vin"))
    tb("tb_vset_gen", "tb_vset_gen -- L1: VSET tracking, replica error (vrep - vref) vs VREF", b_vset, """.control
dc vref 0.95 1.5 0.05
let err_mV = (v(xdut.vrep) - v(vref))*1000
print v(vref) v(vset) err_mV
.endc""")

    # ---- L1: R-DAC all 16 codes (binary counter on d0..d3, 1 us per code)
    def b_dac(s):
        s.two("vsource", "Vdd", -200, 0, "vdd", "0", "1.8")
        s.two("vsource", "Vhi", -100, 0, "vhi", "0", "1.48")
        s.two("vsource", "Vlo", 0, 0, "vlo", "0", "1.00")
        for b in range(4):
            per = 2e-6 * 2 ** b
            s.two("vsource", f"Vd{b}", 100 + 100 * b, 0, f"d{b}", "0",
                  f"pulse(0 1.8 {per / 2:g} 1n 1n {per / 2 - 1e-9:g} {per:g})")
        s.inst("rdac4", "xdut", 700, 0, dict(vhi="vhi", vlo="vlo", d0="d0", d1="d1", d2="d2", d3="d3", out="out", vdd="vdd", vss="0"))
        s.two("capa", "Cl", 1000, 0, "out", "0", "100f")
    tb("tb_rdac4", "tb_rdac4 -- L1: 16-code staircase, monotonicity / DNL", b_dac, """.control
tran 10n 16u
let k = 0
echo code  vout(V)   step(mV)
let vp = 0
while k < 16
  let tt = 0.9u + k*1u
  meas tran vk find v(out) at=$&tt
  let st = (vk - vp)*1000
  echo $&k  $&vk  $&st
  let vp = vk
  let k = k + 1
end
.endc""")

    def b_core(s, tran=False):
        supplies(s)
        s.two("vsource", "Vref", 0, 0, "vref", "0", "dc 1.2")
        s.inst("ldo_core", "xldo", 300, 0, dict(vref="vref", ibn="ibn", vout="vout", vin="vin", vss="0"))
        il = "pwl(0 0.1m 2u 0.1m 2.1u 10m 6u 10m 6.1u 0.1m 12u 0.1m)" if tran else "dc 1m"
        s.two("isource", "Il", 600, 0, "vout", "0", il)
        s.two("capa", "Cl", 700, 0, "vout", "0", S["cl"])

    # ---- L2: ldo_core DC
    tb("tb_ldo_core_dc", "tb_ldo_core_dc -- L2: load reg, line reg, dropout, Iq", b_core, """.control
op
echo VOUT = $&v(vout)  VSET = $&v(xldo.vset)  X = $&v(xldo.x)
dc il 0 10.1m 0.1m
meas dc vnl find v(vout) at=0
meas dc vfl find v(vout) at=10m
let loadreg_mV_per_mA = (vnl - vfl)/10*1000
print loadreg_mV_per_mA
alter il dc=0
dc vin 1.5 1.98 0.01
meas dc iq find i(vin) at=1.8
let iq_uA = -iq*1e6
print iq_uA
alter il dc=10m
dc vin 1.3 1.98 0.01
meas dc v18 find v(vout) at=1.8
meas dc v165 find v(vout) at=1.65
let linereg_mV_per_V = (v18 - v165)/0.15*1000
print linereg_mV_per_V
.endc""")

    # ---- L2: ldo_core loop gain + PSRR vs load
    tb("tb_ldo_core_ac", "tb_ldo_core_ac -- L2: Tian loop gain (PM/UGF) and PSRR vs load", b_core, """.control
foreach il 10u 100u 1m 5m 10m
  alter il dc=$il
  alter @vin[acmag]=0
  alter @v.xldo.xprobe.vbrk[acmag]=1
  ac dec 20 10 10G
  let vx1 = v(xldo.xg)
  let iv1 = v.xldo.xprobe.vbrk#branch
  set p1 = $curplot
  alter @v.xldo.xprobe.vbrk[acmag]=0
  alter @i.xldo.xprobe.iinj[acmag]=1
  ac dec 20 10 10G
  let vx2 = v(xldo.xg)
  let iv2 = v.xldo.xprobe.vbrk#branch
  let vx1 = {$p1}.vx1
  let iv1 = {$p1}.iv1
  let lg = -1/(1-1/(2*(iv1*vx2-vx1*iv2)+vx1+iv2))
  let tdb = db(lg)
  let tph = 180/pi*cph(lg)
  meas ac t0 find tdb at=10
  meas ac ugf when tdb=0
  meas ac phu find tph at=ugf
  let pm = 180 + phu
  echo LG ILOAD=$il T0dB=$&t0 UGF=$&ugf PM=$&pm
  alter @i.xldo.xprobe.iinj[acmag]=0
  alter @vin[acmag]=1
  ac dec 20 10 10G
  meas ac ps1k find vdb(vout) at=1k
  meas ac ps1m find vdb(vout) at=1Meg
  echo PSRR ILOAD=$il 1k=$&ps1k 1M=$&ps1m
end
.endc""")

    # ---- L2: ldo_core load transient
    tb("tb_ldo_core_tran", f"tb_ldo_core_tran -- L2: 0.1 <-> 10 mA load step, 100 ns edges, CL = {S['cl']}",
       lambda s: b_core(s, tran=True), """.control
tran 1n 12u
meas tran vpre find v(vout) at=1.9u
meas tran vmin min v(vout) from=2u to=6u
meas tran vhi find v(vout) at=5.9u
meas tran vmax max v(vout) from=6u to=12u
let under_mV = (vpre - vmin)*1000
let over_mV = (vmax - vhi)*1000
print under_mV over_mV
write tb_ldo_core_tran.raw
.endc""")

    # ---- L3: DVS code steps at 5 mA
    def b_top(s):
        supplies(s)
        s.two("vsource", "Vhi", 0, 0, "vhi", "0", "1.48")
        s.two("vsource", "Vlo", 100, 0, "vlo", "0", "1.00")
        for b in range(4):
            per = 10e-6 * 2 ** b
            s.two("vsource", f"Vd{b}", 200 + 100 * b, 0, f"d{b}", "0",
                  f"pulse(0 1.8 {per / 2:g} 10n 10n {per / 2 - 1e-8:g} {per:g})")
        s.inst("ldo_top", "xtop", 900, 0, dict(vhi="vhi", vlo="vlo", d0="d0", d1="d1", d2="d2", d3="d3",
                                              ibn="ibn", vout="vout", vin="vin", vss="0"))
        s.two("isource", "Il", 1200, 0, "vout", "0", "dc 5m")
        s.two("capa", "Cl", 1300, 0, "vout", "0", S["cl"])
    tb("tb_ldo_top_dvs", "tb_ldo_top_dvs -- L3: DVS staircase, code 0..15 (5 us/code) at 5 mA", b_top, """.control
tran 10n 80u
echo code  vref(V)   vout(V)   err(mV)
let k = 0
while k < 16
  let tt = 4.5u + k*5u
  meas tran vr find v(xtop.vref) at=$&tt
  meas tran vo find v(vout) at=$&tt
  let e = (vo - (1.0 + 0.03*k))*1000
  echo $&k  $&vr  $&vo  $&e
  let k = k + 1
end
write tb_ldo_top_dvs.raw
.endc""")

    # ---- L4: Edge-AI workload profile on the TT chip (load from on-chip emulator)
    def b_chip(s):
        supplies(s)
        s.two("isource", "Ibl", 0, 0, "vin", "ibl", "dc 20u")
        s.two("vsource", "Vhi", 100, 0, "vhi", "0", "1.48")
        s.two("vsource", "Vlo", 200, 0, "vlo", "0", "1.00")
        # DVS code: 7 (1.21 V) -> 10 (1.30 V) at 30 us (pre-boost for inference) -> 4 (1.12 V) at 50 us
        code = {0: "pwl(0 1.8 30u 1.8 30.01u 0 50u 0 50.01u 0)", 1: "pwl(0 1.8 30u 1.8 30.01u 1.8 50u 1.8 50.01u 0)",
                2: "pwl(0 1.8 30u 1.8 30.01u 0 50u 0 50.01u 1.8)", 3: "pwl(0 0 30u 0 30.01u 1.8 50u 1.8 50.01u 0)"}
        for b in range(4):
            s.two("vsource", f"Vd{b}", 300 + 100 * b, 0, f"d{b}", "0", code[b])
        # workload: sleep 0 mA | sense 1.28 mA (ld1) @10us | inference 9.6 mA (all) @35us | comm 5.1 mA (ld3) @45us | sleep @55us
        lv = {0: [(35, 1), (45, 0)], 1: [(10, 1), (45, 0)], 2: [(35, 1), (45, 0)], 3: [(35, 1), (55, 0)]}
        for b, ev in lv.items():
            pts = ["0 0"]
            lvl = 0
            for t, v in ev:
                pts += [f"{t}u {1.8 * lvl:g}", f"{t}.01u {1.8 * v:g}"]
                lvl = v
            s.two("vsource", f"Vl{b}", 700 + 100 * b, 0, f"ld{b}", "0", "pwl(" + " ".join(pts) + ")")
        s.inst("chip_top", "xchip", 1400, 0, dict(vhi="vhi", vlo="vlo", d0="d0", d1="d1", d2="d2", d3="d3", ibn="ibn",
               ld0="ld0", ld1="ld1", ld2="ld2", ld3="ld3", ibl="ibl", vout="vout", vin="vin", vss="0"))
        s.two("capa", "Cpad", 1700, 0, "vout", "0", "5p")
    tb("tb_chip_workload", "tb_chip_workload -- L4: sleep -> sense -> DVS up -> inference -> comm -> DVS down -> sleep",
       b_chip, """.control
tran 5n 70u
meas tran v_sleep find v(vout) at=9.5u
meas tran v_sense find v(vout) at=29u
meas tran v_pre find v(vout) at=34.9u
meas tran vmin_inf min v(vout) from=35u to=40u
meas tran v_inf find v(vout) at=44.9u
meas tran vmax_comm max v(vout) from=45u to=48u
meas tran v_comm find v(vout) at=49.9u
meas tran v_low find v(vout) at=54.9u
meas tran vmax_sleep max v(vout) from=55u to=58u
let under_inf_mV = (v_pre - vmin_inf)*1000
let over_comm_mV = (vmax_comm - v_inf)*1000
let over_sleep_mV = (vmax_sleep - v_low)*1000
print under_inf_mV over_comm_mV over_sleep_mV
meas tran iin_avg avg i(vin) from=0 to=70u
let iavg_mA = -iin_avg*1000
print iavg_mA
write tb_chip_workload.raw
.endc""")


if __name__ == "__main__":
    for d in (LIB, TBLIB):
        os.makedirs(os.path.join(ROOT, "xschem", d), exist_ok=True)
    # order matters: a cell's symbol must exist before a parent instantiates it
    for g in (gen_inv, gen_tgate, gen_bias_mirror, gen_fvf_core, gen_pass_pmos, gen_comp_rc,
              gen_lg_probe, gen_ota5t, gen_vset_gen, gen_mux2_tg, gen_rdac4, gen_ldo_core, gen_ldo_top,
              gen_decap, gen_load_emu, gen_chip_top):
        g()
    gen_tbs()
    print("cells:", ", ".join(SYMS))
