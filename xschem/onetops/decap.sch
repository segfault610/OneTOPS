v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {decap -- L1 on-chip output decoupling capacitor. TODO: sky130 MIM (cap_mim_m3_1) array} -300 -380 0 0 0.6 0.6 {}
C {devices/iopin.sym} -60 -300 0 0 {name=p0 lab=a}
C {devices/iopin.sym} -60 -280 0 0 {name=p1 lab=b}
C {devices/capa.sym} 0 0 0 0 {name=C1 value="20p" m=1}
N 0 -30 0 -50 {lab=a}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l2 sig_type=std_logic lab=a}
N 0 30 0 50 {lab=b}
C {devices/lab_pin.sym} 0 50 3 1 {name=l3 sig_type=std_logic lab=b}
