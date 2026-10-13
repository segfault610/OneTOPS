v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {ab_sense -- L1 adaptive bias (Rev D): pass-device replica senses Iload/500 and adds it to the MC bias (sink at X) and to the VSET replica, so VOUT does not shift} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=g}
C {devices/opin.sym} -180 -300 0 0 {name=p1 lab=o_x}
C {devices/opin.sym} -180 -280 0 0 {name=p2 lab=o_rep}
C {devices/iopin.sym} -60 -300 0 0 {name=p3 lab=vin}
C {devices/iopin.sym} -60 -280 0 0 {name=p4 lab=vss}
C {sky130_fd_pr/pfet_01v8.sym} 0 -150 0 0 {name=MS
L=0.35
W=1.4
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
N 20 -180 20 -200 {lab=vin}
C {devices/lab_pin.sym} 20 -200 1 1 {name=l5 sig_type=std_logic lab=vin}
N -20 -150 -40 -150 {lab=g}
C {devices/lab_pin.sym} -40 -150 0 0 {name=l6 sig_type=std_logic lab=g}
N 20 -120 20 -100 {lab=ns}
C {devices/lab_pin.sym} 20 -100 3 1 {name=l7 sig_type=std_logic lab=ns}
N 20 -150 40 -150 {lab=vin}
C {devices/lab_pin.sym} 40 -150 0 1 {name=l8 sig_type=std_logic lab=vin}
C {sky130_fd_pr/nfet_01v8.sym} 0 100 0 0 {name=MSD
L=1
W=4
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 20 70 20 50 {lab=ns}
C {devices/lab_pin.sym} 20 50 1 1 {name=l9 sig_type=std_logic lab=ns}
N -20 100 -40 100 {lab=ns}
C {devices/lab_pin.sym} -40 100 0 0 {name=l10 sig_type=std_logic lab=ns}
N 20 130 20 150 {lab=vss}
C {devices/lab_pin.sym} 20 150 3 1 {name=l11 sig_type=std_logic lab=vss}
N 20 100 40 100 {lab=vss}
C {devices/lab_pin.sym} 40 100 0 1 {name=l12 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 250 100 0 0 {name=MSX
L=1
W=4
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 270 70 270 50 {lab=o_x}
C {devices/lab_pin.sym} 270 50 1 1 {name=l13 sig_type=std_logic lab=o_x}
N 230 100 210 100 {lab=ns}
C {devices/lab_pin.sym} 210 100 0 0 {name=l14 sig_type=std_logic lab=ns}
N 270 130 270 150 {lab=vss}
C {devices/lab_pin.sym} 270 150 3 1 {name=l15 sig_type=std_logic lab=vss}
N 270 100 290 100 {lab=vss}
C {devices/lab_pin.sym} 290 100 0 1 {name=l16 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 500 100 0 0 {name=MSR
L=1
W=4
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 520 70 520 50 {lab=o_rep}
C {devices/lab_pin.sym} 520 50 1 1 {name=l17 sig_type=std_logic lab=o_rep}
N 480 100 460 100 {lab=ns}
C {devices/lab_pin.sym} 460 100 0 0 {name=l18 sig_type=std_logic lab=ns}
N 520 130 520 150 {lab=vss}
C {devices/lab_pin.sym} 520 150 3 1 {name=l19 sig_type=std_logic lab=vss}
N 520 100 540 100 {lab=vss}
C {devices/lab_pin.sym} 540 100 0 1 {name=l20 sig_type=std_logic lab=vss}
T {Layout: MS must sit inside the pass-device array (same Vth/stress) for a good 1:500 ratio} 0 230 0 0 0.3 0.3 {}
