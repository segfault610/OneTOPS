v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {ota5t -- L1 5-transistor OTA, NMOS input, LVT PMOS mirror (out non-inverting from inp)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=inp}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=inn}
C {devices/opin.sym} -180 -300 0 0 {name=p2 lab=out}
C {devices/iopin.sym} -60 -300 0 0 {name=p3 lab=tail}
C {devices/iopin.sym} -60 -280 0 0 {name=p4 lab=vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 0 -150 0 0 {name=MP1
L=2
W=20
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
N 20 -180 20 -200 {lab=vdd}
C {devices/lab_pin.sym} 20 -200 1 1 {name=l5 sig_type=std_logic lab=vdd}
N -20 -150 -40 -150 {lab=nd}
C {devices/lab_pin.sym} -40 -150 0 0 {name=l6 sig_type=std_logic lab=nd}
N 20 -120 20 -100 {lab=nd}
C {devices/lab_pin.sym} 20 -100 3 1 {name=l7 sig_type=std_logic lab=nd}
N 20 -150 40 -150 {lab=vdd}
C {devices/lab_pin.sym} 40 -150 0 1 {name=l8 sig_type=std_logic lab=vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 300 -150 0 0 {name=MP2
L=2
W=20
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
N 320 -180 320 -200 {lab=vdd}
C {devices/lab_pin.sym} 320 -200 1 1 {name=l9 sig_type=std_logic lab=vdd}
N 280 -150 260 -150 {lab=nd}
C {devices/lab_pin.sym} 260 -150 0 0 {name=l10 sig_type=std_logic lab=nd}
N 320 -120 320 -100 {lab=out}
C {devices/lab_pin.sym} 320 -100 3 1 {name=l11 sig_type=std_logic lab=out}
N 320 -150 340 -150 {lab=vdd}
C {devices/lab_pin.sym} 340 -150 0 1 {name=l12 sig_type=std_logic lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} 0 50 0 0 {name=MN1
L=1
W=5
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
N 20 20 20 0 {lab=nd}
C {devices/lab_pin.sym} 20 0 1 1 {name=l13 sig_type=std_logic lab=nd}
N -20 50 -40 50 {lab=inp}
C {devices/lab_pin.sym} -40 50 0 0 {name=l14 sig_type=std_logic lab=inp}
N 20 80 20 100 {lab=tail}
C {devices/lab_pin.sym} 20 100 3 1 {name=l15 sig_type=std_logic lab=tail}
N 20 50 40 50 {lab=0}
C {devices/lab_pin.sym} 40 50 0 1 {name=l16 sig_type=std_logic lab=0}
C {sky130_fd_pr/nfet_01v8.sym} 300 50 0 0 {name=MN2
L=1
W=5
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
N 320 20 320 0 {lab=out}
C {devices/lab_pin.sym} 320 0 1 1 {name=l17 sig_type=std_logic lab=out}
N 280 50 260 50 {lab=inn}
C {devices/lab_pin.sym} 260 50 0 0 {name=l18 sig_type=std_logic lab=inn}
N 320 80 320 100 {lab=tail}
C {devices/lab_pin.sym} 320 100 3 1 {name=l19 sig_type=std_logic lab=tail}
N 320 50 340 50 {lab=0}
C {devices/lab_pin.sym} 340 50 0 1 {name=l20 sig_type=std_logic lab=0}
