v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {vset_gen -- L1 replica loop: OTA forces Vsrc(MR)=VREF => VSET = VREF - Vsg(MR,IB). VREF is high-Z} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=vref}
C {devices/opin.sym} -180 -300 0 0 {name=p1 lab=vset}
C {devices/iopin.sym} -60 -300 0 0 {name=p2 lab=i_pd}
C {devices/iopin.sym} -60 -280 0 0 {name=p3 lab=i_tail}
C {devices/iopin.sym} -60 -260 0 0 {name=p4 lab=vin}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 0 -150 0 0 {name=MPD
L=2
W=10
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
N 20 -180 20 -200 {lab=vin}
C {devices/lab_pin.sym} 20 -200 1 1 {name=l5 sig_type=std_logic lab=vin}
N -20 -150 -40 -150 {lab=i_pd}
C {devices/lab_pin.sym} -40 -150 0 0 {name=l6 sig_type=std_logic lab=i_pd}
N 20 -120 20 -100 {lab=i_pd}
C {devices/lab_pin.sym} 20 -100 3 1 {name=l7 sig_type=std_logic lab=i_pd}
N 20 -150 40 -150 {lab=vin}
C {devices/lab_pin.sym} 40 -150 0 1 {name=l8 sig_type=std_logic lab=vin}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 250 -150 0 0 {name=MPS
L=2
W=10
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
N 270 -180 270 -200 {lab=vin}
C {devices/lab_pin.sym} 270 -200 1 1 {name=l9 sig_type=std_logic lab=vin}
N 230 -150 210 -150 {lab=i_pd}
C {devices/lab_pin.sym} 210 -150 0 0 {name=l10 sig_type=std_logic lab=i_pd}
N 270 -120 270 -100 {lab=vrep}
C {devices/lab_pin.sym} 270 -100 3 1 {name=l11 sig_type=std_logic lab=vrep}
N 270 -150 290 -150 {lab=vin}
C {devices/lab_pin.sym} 290 -150 0 1 {name=l12 sig_type=std_logic lab=vin}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 250 50 0 0 {name=MR
L=1
W=100
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
N 270 20 270 0 {lab=vrep}
C {devices/lab_pin.sym} 270 0 1 1 {name=l13 sig_type=std_logic lab=vrep}
N 230 50 210 50 {lab=vset}
C {devices/lab_pin.sym} 210 50 0 0 {name=l14 sig_type=std_logic lab=vset}
N 270 80 270 100 {lab=0}
C {devices/lab_pin.sym} 270 100 3 1 {name=l15 sig_type=std_logic lab=0}
N 270 50 290 50 {lab=vrep}
C {devices/lab_pin.sym} 290 50 0 1 {name=l16 sig_type=std_logic lab=vrep}
C {onetops/ota5t.sym} 600 0 0 0 {name=xota}
N 500 -50 480 -50 {lab=vref}
C {devices/lab_pin.sym} 480 -50 0 0 {name=l17 sig_type=std_logic lab=vref}
N 500 -10 480 -10 {lab=vrep}
C {devices/lab_pin.sym} 480 -10 0 0 {name=l18 sig_type=std_logic lab=vrep}
N 500 30 480 30 {lab=i_tail}
C {devices/lab_pin.sym} 480 30 0 0 {name=l19 sig_type=std_logic lab=i_tail}
N 700 0 720 0 {lab=vset}
C {devices/lab_pin.sym} 720 0 0 1 {name=l20 sig_type=std_logic lab=vset}
N 600 -90 600 -110 {lab=vin}
C {devices/lab_pin.sym} 600 -110 1 1 {name=l21 sig_type=std_logic lab=vin}
C {devices/capa.sym} 900 50 0 0 {name=Cset value="2p" m=1}
N 900 20 900 0 {lab=vset}
C {devices/lab_pin.sym} 900 0 1 1 {name=l22 sig_type=std_logic lab=vset}
N 900 80 900 100 {lab=0}
C {devices/lab_pin.sym} 900 100 3 1 {name=l23 sig_type=std_logic lab=0}
