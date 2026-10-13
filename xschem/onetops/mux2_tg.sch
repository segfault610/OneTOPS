v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {mux2_tg -- L1 analog 2:1 mux (s=0 -> i0, s=1 -> i1)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=s}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=sb}
C {devices/iopin.sym} -60 -300 0 0 {name=p2 lab=i0}
C {devices/iopin.sym} -60 -280 0 0 {name=p3 lab=i1}
C {devices/iopin.sym} -60 -260 0 0 {name=p4 lab=y}
C {devices/iopin.sym} -60 -240 0 0 {name=p5 lab=vdd}
C {devices/iopin.sym} -60 -220 0 0 {name=p6 lab=vss}
C {onetops/tgate.sym} 0 0 0 0 {name=xt0}
N -100 -50 -120 -50 {lab=i0}
C {devices/lab_pin.sym} -120 -50 0 0 {name=l7 sig_type=std_logic lab=i0}
N 100 0 120 0 {lab=y}
C {devices/lab_pin.sym} 120 0 0 1 {name=l8 sig_type=std_logic lab=y}
N -100 -10 -120 -10 {lab=sb}
C {devices/lab_pin.sym} -120 -10 0 0 {name=l9 sig_type=std_logic lab=sb}
N -100 30 -120 30 {lab=s}
C {devices/lab_pin.sym} -120 30 0 0 {name=l10 sig_type=std_logic lab=s}
N 0 -90 0 -110 {lab=vdd}
C {devices/lab_pin.sym} 0 -110 1 1 {name=l11 sig_type=std_logic lab=vdd}
N 0 90 0 110 {lab=vss}
C {devices/lab_pin.sym} 0 110 3 1 {name=l12 sig_type=std_logic lab=vss}
C {onetops/tgate.sym} 400 0 0 0 {name=xt1}
N 300 -50 280 -50 {lab=i1}
C {devices/lab_pin.sym} 280 -50 0 0 {name=l13 sig_type=std_logic lab=i1}
N 500 0 520 0 {lab=y}
C {devices/lab_pin.sym} 520 0 0 1 {name=l14 sig_type=std_logic lab=y}
N 300 -10 280 -10 {lab=s}
C {devices/lab_pin.sym} 280 -10 0 0 {name=l15 sig_type=std_logic lab=s}
N 300 30 280 30 {lab=sb}
C {devices/lab_pin.sym} 280 30 0 0 {name=l16 sig_type=std_logic lab=sb}
N 400 -90 400 -110 {lab=vdd}
C {devices/lab_pin.sym} 400 -110 1 1 {name=l17 sig_type=std_logic lab=vdd}
N 400 90 400 110 {lab=vss}
C {devices/lab_pin.sym} 400 110 3 1 {name=l18 sig_type=std_logic lab=vss}
