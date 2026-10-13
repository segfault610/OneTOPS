v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {ldo_top -- L3 DVS LDO: 4-bit code -> rdac4 -> VREF -> ldo_core. VOUT = 1.00 + 0.03*code V} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=d0}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=d1}
C {devices/ipin.sym} -300 -260 0 0 {name=p2 lab=d2}
C {devices/ipin.sym} -300 -240 0 0 {name=p3 lab=d3}
C {devices/ipin.sym} -300 -220 0 0 {name=p4 lab=ibn}
C {devices/iopin.sym} -60 -300 0 0 {name=p5 lab=vhi}
C {devices/iopin.sym} -60 -280 0 0 {name=p6 lab=vlo}
C {devices/iopin.sym} -60 -260 0 0 {name=p7 lab=vout}
C {devices/iopin.sym} -60 -240 0 0 {name=p8 lab=vin}
C {devices/iopin.sym} -60 -220 0 0 {name=p9 lab=vss}
C {onetops/rdac4.sym} 0 0 0 0 {name=xdac}
N -100 -110 -120 -110 {lab=vhi}
C {devices/lab_pin.sym} -120 -110 0 0 {name=l10 sig_type=std_logic lab=vhi}
N -100 -70 -120 -70 {lab=vlo}
C {devices/lab_pin.sym} -120 -70 0 0 {name=l11 sig_type=std_logic lab=vlo}
N -100 -30 -120 -30 {lab=d0}
C {devices/lab_pin.sym} -120 -30 0 0 {name=l12 sig_type=std_logic lab=d0}
N -100 10 -120 10 {lab=d1}
C {devices/lab_pin.sym} -120 10 0 0 {name=l13 sig_type=std_logic lab=d1}
N -100 50 -120 50 {lab=d2}
C {devices/lab_pin.sym} -120 50 0 0 {name=l14 sig_type=std_logic lab=d2}
N -100 90 -120 90 {lab=d3}
C {devices/lab_pin.sym} -120 90 0 0 {name=l15 sig_type=std_logic lab=d3}
N 100 0 120 0 {lab=vref}
C {devices/lab_pin.sym} 120 0 0 1 {name=l16 sig_type=std_logic lab=vref}
N 0 -150 0 -170 {lab=vin}
C {devices/lab_pin.sym} 0 -170 1 1 {name=l17 sig_type=std_logic lab=vin}
N 0 150 0 170 {lab=vss}
C {devices/lab_pin.sym} 0 170 3 1 {name=l18 sig_type=std_logic lab=vss}
C {onetops/ldo_core.sym} 500 0 0 0 {name=xcore}
N 400 -30 380 -30 {lab=vref}
C {devices/lab_pin.sym} 380 -30 0 0 {name=l19 sig_type=std_logic lab=vref}
N 400 10 380 10 {lab=ibn}
C {devices/lab_pin.sym} 380 10 0 0 {name=l20 sig_type=std_logic lab=ibn}
N 600 0 620 0 {lab=vout}
C {devices/lab_pin.sym} 620 0 0 1 {name=l21 sig_type=std_logic lab=vout}
N 500 -70 500 -90 {lab=vin}
C {devices/lab_pin.sym} 500 -90 1 1 {name=l22 sig_type=std_logic lab=vin}
N 500 70 500 90 {lab=vss}
C {devices/lab_pin.sym} 500 90 3 1 {name=l23 sig_type=std_logic lab=vss}
