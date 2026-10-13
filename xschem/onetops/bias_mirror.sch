v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {bias_mirror -- L1 NMOS mirror bank (IB=20 uA in -> FVF sink, bleeder, PMOS-ref, OTA tail)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=ibn}
C {devices/opin.sym} -180 -300 0 0 {name=p1 lab=o_fvf}
C {devices/opin.sym} -180 -280 0 0 {name=p2 lab=o_bl}
C {devices/opin.sym} -180 -260 0 0 {name=p3 lab=o_pd}
C {devices/opin.sym} -180 -240 0 0 {name=p4 lab=o_tail}
C {devices/iopin.sym} -60 -300 0 0 {name=p5 lab=vss}
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
C {devices/lab_pin.sym} 20 -50 1 1 {name=l6 sig_type=std_logic lab=ibn}
N -20 0 -40 0 {lab=ibn}
C {devices/lab_pin.sym} -40 0 0 0 {name=l7 sig_type=std_logic lab=ibn}
N 20 30 20 50 {lab=vss}
C {devices/lab_pin.sym} 20 50 3 1 {name=l8 sig_type=std_logic lab=vss}
N 20 0 40 0 {lab=vss}
C {devices/lab_pin.sym} 40 0 0 1 {name=l9 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 200 0 0 0 {name=MN1
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
N 220 -30 220 -50 {lab=o_fvf}
C {devices/lab_pin.sym} 220 -50 1 1 {name=l10 sig_type=std_logic lab=o_fvf}
N 180 0 160 0 {lab=ibn}
C {devices/lab_pin.sym} 160 0 0 0 {name=l11 sig_type=std_logic lab=ibn}
N 220 30 220 50 {lab=vss}
C {devices/lab_pin.sym} 220 50 3 1 {name=l12 sig_type=std_logic lab=vss}
N 220 0 240 0 {lab=vss}
C {devices/lab_pin.sym} 240 0 0 1 {name=l13 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 400 0 0 0 {name=MN2
L=1
W=4
nf=1
mult=5
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 420 -30 420 -50 {lab=o_bl}
C {devices/lab_pin.sym} 420 -50 1 1 {name=l14 sig_type=std_logic lab=o_bl}
N 380 0 360 0 {lab=ibn}
C {devices/lab_pin.sym} 360 0 0 0 {name=l15 sig_type=std_logic lab=ibn}
N 420 30 420 50 {lab=vss}
C {devices/lab_pin.sym} 420 50 3 1 {name=l16 sig_type=std_logic lab=vss}
N 420 0 440 0 {lab=vss}
C {devices/lab_pin.sym} 440 0 0 1 {name=l17 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 600 0 0 0 {name=MN3
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
N 620 -30 620 -50 {lab=o_pd}
C {devices/lab_pin.sym} 620 -50 1 1 {name=l18 sig_type=std_logic lab=o_pd}
N 580 0 560 0 {lab=ibn}
C {devices/lab_pin.sym} 560 0 0 0 {name=l19 sig_type=std_logic lab=ibn}
N 620 30 620 50 {lab=vss}
C {devices/lab_pin.sym} 620 50 3 1 {name=l20 sig_type=std_logic lab=vss}
N 620 0 640 0 {lab=vss}
C {devices/lab_pin.sym} 640 0 0 1 {name=l21 sig_type=std_logic lab=vss}
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
C {devices/lab_pin.sym} 820 -50 1 1 {name=l22 sig_type=std_logic lab=o_tail}
N 780 0 760 0 {lab=ibn}
C {devices/lab_pin.sym} 760 0 0 0 {name=l23 sig_type=std_logic lab=ibn}
N 820 30 820 50 {lab=vss}
C {devices/lab_pin.sym} 820 50 3 1 {name=l24 sig_type=std_logic lab=vss}
N 820 0 840 0 {lab=vss}
C {devices/lab_pin.sym} 840 0 0 1 {name=l25 sig_type=std_logic lab=vss}
T {o_fvf: 1x (FVF node X sink)   o_bl: 5x min-load bleeder   o_pd: 1x   o_tail: 2x} 0 100 0 0 0.3 0.3 {}
