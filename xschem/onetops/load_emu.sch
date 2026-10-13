v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {load_emu -- L1 on-chip Edge-AI workload emulator: I = (ld0 + 2 ld1 + 4 ld2 + 8 ld3) x 0.64 mA (IBL = 20 uA)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=ld0}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=ld1}
C {devices/ipin.sym} -300 -260 0 0 {name=p2 lab=ld2}
C {devices/ipin.sym} -300 -240 0 0 {name=p3 lab=ld3}
C {devices/ipin.sym} -300 -220 0 0 {name=p4 lab=ibl}
C {devices/iopin.sym} -60 -300 0 0 {name=p5 lab=vout}
C {devices/iopin.sym} -60 -280 0 0 {name=p6 lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 0 0 0 0 {name=MD0
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
N 20 -30 20 -50 {lab=ibl}
C {devices/lab_pin.sym} 20 -50 1 1 {name=l7 sig_type=std_logic lab=ibl}
N -20 0 -40 0 {lab=ibl}
C {devices/lab_pin.sym} -40 0 0 0 {name=l8 sig_type=std_logic lab=ibl}
N 20 30 20 50 {lab=vss}
C {devices/lab_pin.sym} 20 50 3 1 {name=l9 sig_type=std_logic lab=vss}
N 20 0 40 0 {lab=vss}
C {devices/lab_pin.sym} 40 0 0 1 {name=l10 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 300 -150 0 0 {name=MSW0
L=0.15
W=20
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
N 320 -180 320 -200 {lab=vout}
C {devices/lab_pin.sym} 320 -200 1 1 {name=l11 sig_type=std_logic lab=vout}
N 280 -150 260 -150 {lab=ld0}
C {devices/lab_pin.sym} 260 -150 0 0 {name=l12 sig_type=std_logic lab=ld0}
N 320 -120 320 -100 {lab=n0}
C {devices/lab_pin.sym} 320 -100 3 1 {name=l13 sig_type=std_logic lab=n0}
N 320 -150 340 -150 {lab=vss}
C {devices/lab_pin.sym} 340 -150 0 1 {name=l14 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 300 50 0 0 {name=MS0
L=1
W=4
nf=1
mult=32
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 320 20 320 0 {lab=n0}
C {devices/lab_pin.sym} 320 0 1 1 {name=l15 sig_type=std_logic lab=n0}
N 280 50 260 50 {lab=ibl}
C {devices/lab_pin.sym} 260 50 0 0 {name=l16 sig_type=std_logic lab=ibl}
N 320 80 320 100 {lab=vss}
C {devices/lab_pin.sym} 320 100 3 1 {name=l17 sig_type=std_logic lab=vss}
N 320 50 340 50 {lab=vss}
C {devices/lab_pin.sym} 340 50 0 1 {name=l18 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 600 -150 0 0 {name=MSW1
L=0.15
W=40
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
N 620 -180 620 -200 {lab=vout}
C {devices/lab_pin.sym} 620 -200 1 1 {name=l19 sig_type=std_logic lab=vout}
N 580 -150 560 -150 {lab=ld1}
C {devices/lab_pin.sym} 560 -150 0 0 {name=l20 sig_type=std_logic lab=ld1}
N 620 -120 620 -100 {lab=n1}
C {devices/lab_pin.sym} 620 -100 3 1 {name=l21 sig_type=std_logic lab=n1}
N 620 -150 640 -150 {lab=vss}
C {devices/lab_pin.sym} 640 -150 0 1 {name=l22 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 600 50 0 0 {name=MS1
L=1
W=4
nf=1
mult=64
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 620 20 620 0 {lab=n1}
C {devices/lab_pin.sym} 620 0 1 1 {name=l23 sig_type=std_logic lab=n1}
N 580 50 560 50 {lab=ibl}
C {devices/lab_pin.sym} 560 50 0 0 {name=l24 sig_type=std_logic lab=ibl}
N 620 80 620 100 {lab=vss}
C {devices/lab_pin.sym} 620 100 3 1 {name=l25 sig_type=std_logic lab=vss}
N 620 50 640 50 {lab=vss}
C {devices/lab_pin.sym} 640 50 0 1 {name=l26 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 900 -150 0 0 {name=MSW2
L=0.15
W=80
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
N 920 -180 920 -200 {lab=vout}
C {devices/lab_pin.sym} 920 -200 1 1 {name=l27 sig_type=std_logic lab=vout}
N 880 -150 860 -150 {lab=ld2}
C {devices/lab_pin.sym} 860 -150 0 0 {name=l28 sig_type=std_logic lab=ld2}
N 920 -120 920 -100 {lab=n2}
C {devices/lab_pin.sym} 920 -100 3 1 {name=l29 sig_type=std_logic lab=n2}
N 920 -150 940 -150 {lab=vss}
C {devices/lab_pin.sym} 940 -150 0 1 {name=l30 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 900 50 0 0 {name=MS2
L=1
W=4
nf=1
mult=128
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 920 20 920 0 {lab=n2}
C {devices/lab_pin.sym} 920 0 1 1 {name=l31 sig_type=std_logic lab=n2}
N 880 50 860 50 {lab=ibl}
C {devices/lab_pin.sym} 860 50 0 0 {name=l32 sig_type=std_logic lab=ibl}
N 920 80 920 100 {lab=vss}
C {devices/lab_pin.sym} 920 100 3 1 {name=l33 sig_type=std_logic lab=vss}
N 920 50 940 50 {lab=vss}
C {devices/lab_pin.sym} 940 50 0 1 {name=l34 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 1200 -150 0 0 {name=MSW3
L=0.15
W=160
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
N 1220 -180 1220 -200 {lab=vout}
C {devices/lab_pin.sym} 1220 -200 1 1 {name=l35 sig_type=std_logic lab=vout}
N 1180 -150 1160 -150 {lab=ld3}
C {devices/lab_pin.sym} 1160 -150 0 0 {name=l36 sig_type=std_logic lab=ld3}
N 1220 -120 1220 -100 {lab=n3}
C {devices/lab_pin.sym} 1220 -100 3 1 {name=l37 sig_type=std_logic lab=n3}
N 1220 -150 1240 -150 {lab=vss}
C {devices/lab_pin.sym} 1240 -150 0 1 {name=l38 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 1200 50 0 0 {name=MS3
L=1
W=4
nf=1
mult=256
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 1220 20 1220 0 {lab=n3}
C {devices/lab_pin.sym} 1220 0 1 1 {name=l39 sig_type=std_logic lab=n3}
N 1180 50 1160 50 {lab=ibl}
C {devices/lab_pin.sym} 1160 50 0 0 {name=l40 sig_type=std_logic lab=ibl}
N 1220 80 1220 100 {lab=vss}
C {devices/lab_pin.sym} 1220 100 3 1 {name=l41 sig_type=std_logic lab=vss}
N 1220 50 1240 50 {lab=vss}
C {devices/lab_pin.sym} 1240 50 0 1 {name=l42 sig_type=std_logic lab=vss}
