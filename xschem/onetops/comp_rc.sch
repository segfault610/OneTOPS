v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {comp_rc -- L1 Miller compensation Rz + Cc (gate X to VOUT). TODO: MIM cap + poly R} -300 -380 0 0 0.6 0.6 {}
C {devices/iopin.sym} -60 -300 0 0 {name=p0 lab=a}
C {devices/iopin.sym} -60 -280 0 0 {name=p1 lab=b}
C {devices/res.sym} 0 0 0 0 {name=Rz value="1" m=1}
N 0 -30 0 -50 {lab=a}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l2 sig_type=std_logic lab=a}
N 0 30 0 50 {lab=n1}
C {devices/lab_pin.sym} 0 50 3 1 {name=l3 sig_type=std_logic lab=n1}
C {devices/capa.sym} 0 120 0 0 {name=Cc value="4p" m=1}
N 0 90 0 70 {lab=n1}
C {devices/lab_pin.sym} 0 70 1 1 {name=l4 sig_type=std_logic lab=n1}
N 0 150 0 170 {lab=b}
C {devices/lab_pin.sym} 0 170 3 1 {name=l5 sig_type=std_logic lab=b}
