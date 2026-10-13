v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {inv -- L0 static CMOS inverter (1.8 V)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=a}
C {devices/opin.sym} -180 -300 0 0 {name=p1 lab=y}
C {devices/iopin.sym} -60 -300 0 0 {name=p2 lab=vdd}
C {devices/iopin.sym} -60 -280 0 0 {name=p3 lab=vss}
C {sky130_fd_pr/pfet_01v8.sym} 0 -100 0 0 {name=MP1
L=0.15
W=2
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
N 20 -130 20 -150 {lab=vdd}
C {devices/lab_pin.sym} 20 -150 1 1 {name=l4 sig_type=std_logic lab=vdd}
N -20 -100 -40 -100 {lab=a}
C {devices/lab_pin.sym} -40 -100 0 0 {name=l5 sig_type=std_logic lab=a}
N 20 -70 20 -50 {lab=y}
C {devices/lab_pin.sym} 20 -50 3 1 {name=l6 sig_type=std_logic lab=y}
N 20 -100 40 -100 {lab=vdd}
C {devices/lab_pin.sym} 40 -100 0 1 {name=l7 sig_type=std_logic lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} 0 50 0 0 {name=MN1
L=0.15
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
N 20 20 20 0 {lab=y}
C {devices/lab_pin.sym} 20 0 1 1 {name=l8 sig_type=std_logic lab=y}
N -20 50 -40 50 {lab=a}
C {devices/lab_pin.sym} -40 50 0 0 {name=l9 sig_type=std_logic lab=a}
N 20 80 20 100 {lab=vss}
C {devices/lab_pin.sym} 20 100 3 1 {name=l10 sig_type=std_logic lab=vss}
N 20 50 40 50 {lab=vss}
C {devices/lab_pin.sym} 40 50 0 1 {name=l11 sig_type=std_logic lab=vss}
