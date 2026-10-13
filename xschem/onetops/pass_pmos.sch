v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {pass_pmos -- L1 pass device (std-Vt PMOS, high |Vth| = low leakage at FVF clamp)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=g}
C {devices/iopin.sym} -60 -300 0 0 {name=p1 lab=vin}
C {devices/iopin.sym} -60 -280 0 0 {name=p2 lab=vout}
C {sky130_fd_pr/pfet_01v8.sym} 0 0 0 0 {name=MP
L=0.35
W=10
nf=1
mult=70
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
N 20 -30 20 -50 {lab=vin}
C {devices/lab_pin.sym} 20 -50 1 1 {name=l3 sig_type=std_logic lab=vin}
N -20 0 -40 0 {lab=g}
C {devices/lab_pin.sym} -40 0 0 0 {name=l4 sig_type=std_logic lab=g}
N 20 30 20 50 {lab=vout}
C {devices/lab_pin.sym} 20 50 3 1 {name=l5 sig_type=std_logic lab=vout}
N 20 0 40 0 {lab=vin}
C {devices/lab_pin.sym} 40 0 0 1 {name=l6 sig_type=std_logic lab=vin}
