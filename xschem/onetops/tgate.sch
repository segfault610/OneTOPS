v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tgate -- L0 transmission gate (on when en=1, enb=0)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=en}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=enb}
C {devices/iopin.sym} -60 -300 0 0 {name=p2 lab=a}
C {devices/iopin.sym} -60 -280 0 0 {name=p3 lab=b}
C {devices/iopin.sym} -60 -260 0 0 {name=p4 lab=vdd}
C {devices/iopin.sym} -60 -240 0 0 {name=p5 lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 0 0 0 0 {name=MN1
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
N 20 -30 20 -50 {lab=a}
C {devices/lab_pin.sym} 20 -50 1 1 {name=l6 sig_type=std_logic lab=a}
N -20 0 -40 0 {lab=en}
C {devices/lab_pin.sym} -40 0 0 0 {name=l7 sig_type=std_logic lab=en}
N 20 30 20 50 {lab=b}
C {devices/lab_pin.sym} 20 50 3 1 {name=l8 sig_type=std_logic lab=b}
N 20 0 40 0 {lab=vss}
C {devices/lab_pin.sym} 40 0 0 1 {name=l9 sig_type=std_logic lab=vss}
C {sky130_fd_pr/pfet_01v8.sym} 200 0 0 0 {name=MP1
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
N 220 -30 220 -50 {lab=a}
C {devices/lab_pin.sym} 220 -50 1 1 {name=l10 sig_type=std_logic lab=a}
N 180 0 160 0 {lab=enb}
C {devices/lab_pin.sym} 160 0 0 0 {name=l11 sig_type=std_logic lab=enb}
N 220 30 220 50 {lab=b}
C {devices/lab_pin.sym} 220 50 3 1 {name=l12 sig_type=std_logic lab=b}
N 220 0 240 0 {lab=vdd}
C {devices/lab_pin.sym} 240 0 0 1 {name=l13 sig_type=std_logic lab=vdd}
