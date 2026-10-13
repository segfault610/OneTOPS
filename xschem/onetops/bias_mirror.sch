v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {bias_mirror -- L1 NMOS mirror bank (IB=20 uA in -> FVF sink, PMOS-ref, OTA tail, boost bias, dead zone)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=ibn}
C {devices/opin.sym} -180 -300 0 0 {name=p1 lab=o_fvf}
C {devices/opin.sym} -180 -280 0 0 {name=p2 lab=o_pd}
C {devices/opin.sym} -180 -260 0 0 {name=p3 lab=o_tail}
C {devices/opin.sym} -180 -240 0 0 {name=p4 lab=o_bu}
C {devices/opin.sym} -180 -220 0 0 {name=p5 lab=o_dz}
C {devices/iopin.sym} -60 -300 0 0 {name=p6 lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 0 0 0 0 {name=MN0
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
N 20 -30 20 -50 {lab=ibn}
C {devices/lab_pin.sym} 20 -50 1 1 {name=l7 sig_type=std_logic lab=ibn}
N -20 0 -40 0 {lab=ibn}
C {devices/lab_pin.sym} -40 0 0 0 {name=l8 sig_type=std_logic lab=ibn}
N 20 30 20 50 {lab=vss}
C {devices/lab_pin.sym} 20 50 3 1 {name=l9 sig_type=std_logic lab=vss}
N 20 0 40 0 {lab=vss}
C {devices/lab_pin.sym} 40 0 0 1 {name=l10 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 200 0 0 0 {name=MN1
L=1
W=1
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
N 220 -30 220 -50 {lab=o_fvf}
C {devices/lab_pin.sym} 220 -50 1 1 {name=l11 sig_type=std_logic lab=o_fvf}
N 180 0 160 0 {lab=ibn}
C {devices/lab_pin.sym} 160 0 0 0 {name=l12 sig_type=std_logic lab=ibn}
N 220 30 220 50 {lab=vss}
C {devices/lab_pin.sym} 220 50 3 1 {name=l13 sig_type=std_logic lab=vss}
N 220 0 240 0 {lab=vss}
C {devices/lab_pin.sym} 240 0 0 1 {name=l14 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 400 0 0 0 {name=MN2
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
N 420 -30 420 -50 {lab=o_bu}
C {devices/lab_pin.sym} 420 -50 1 1 {name=l15 sig_type=std_logic lab=o_bu}
N 380 0 360 0 {lab=ibn}
C {devices/lab_pin.sym} 360 0 0 0 {name=l16 sig_type=std_logic lab=ibn}
N 420 30 420 50 {lab=vss}
C {devices/lab_pin.sym} 420 50 3 1 {name=l17 sig_type=std_logic lab=vss}
N 420 0 440 0 {lab=vss}
C {devices/lab_pin.sym} 440 0 0 1 {name=l18 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 600 0 0 0 {name=MN3
L=1
W=1
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
N 620 -30 620 -50 {lab=o_pd}
C {devices/lab_pin.sym} 620 -50 1 1 {name=l19 sig_type=std_logic lab=o_pd}
N 580 0 560 0 {lab=ibn}
C {devices/lab_pin.sym} 560 0 0 0 {name=l20 sig_type=std_logic lab=ibn}
N 620 30 620 50 {lab=vss}
C {devices/lab_pin.sym} 620 50 3 1 {name=l21 sig_type=std_logic lab=vss}
N 620 0 640 0 {lab=vss}
C {devices/lab_pin.sym} 640 0 0 1 {name=l22 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 800 0 0 0 {name=MN4
L=1
W=4
nf=1
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 820 -30 820 -50 {lab=o_tail}
C {devices/lab_pin.sym} 820 -50 1 1 {name=l23 sig_type=std_logic lab=o_tail}
N 780 0 760 0 {lab=ibn}
C {devices/lab_pin.sym} 760 0 0 0 {name=l24 sig_type=std_logic lab=ibn}
N 820 30 820 50 {lab=vss}
C {devices/lab_pin.sym} 820 50 3 1 {name=l25 sig_type=std_logic lab=vss}
N 820 0 840 0 {lab=vss}
C {devices/lab_pin.sym} 840 0 0 1 {name=l26 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 1000 0 0 0 {name=MN5
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
N 1020 -30 1020 -50 {lab=o_dz}
C {devices/lab_pin.sym} 1020 -50 1 1 {name=l27 sig_type=std_logic lab=o_dz}
N 980 0 960 0 {lab=ibn}
C {devices/lab_pin.sym} 960 0 0 0 {name=l28 sig_type=std_logic lab=ibn}
N 1020 30 1020 50 {lab=vss}
C {devices/lab_pin.sym} 1020 50 3 1 {name=l29 sig_type=std_logic lab=vss}
N 1020 0 1040 0 {lab=vss}
C {devices/lab_pin.sym} 1040 0 0 1 {name=l30 sig_type=std_logic lab=vss}
T {o_fvf, o_pd: 5 uA base (W=1; adaptive part from ab_sense). o_bu, o_dz: 20 uA. o_tail: 40 uA} 0 100 0 0 0.3 0.3 {}
