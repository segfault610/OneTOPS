v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {chip_top -- L4 Tiny Tapeout test chip: DVS LDO + 20 pF decap + on-chip workload emulator} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=d0}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=d1}
C {devices/ipin.sym} -300 -260 0 0 {name=p2 lab=d2}
C {devices/ipin.sym} -300 -240 0 0 {name=p3 lab=d3}
C {devices/ipin.sym} -300 -220 0 0 {name=p4 lab=ibn}
C {devices/ipin.sym} -300 -200 0 0 {name=p5 lab=ben}
C {devices/ipin.sym} -300 -180 0 0 {name=p6 lab=ld0}
C {devices/ipin.sym} -300 -160 0 0 {name=p7 lab=ld1}
C {devices/ipin.sym} -300 -140 0 0 {name=p8 lab=ld2}
C {devices/ipin.sym} -300 -120 0 0 {name=p9 lab=ld3}
C {devices/ipin.sym} -300 -100 0 0 {name=p10 lab=ibl}
C {devices/iopin.sym} -60 -300 0 0 {name=p11 lab=vhi}
C {devices/iopin.sym} -60 -280 0 0 {name=p12 lab=vlo}
C {devices/iopin.sym} -60 -260 0 0 {name=p13 lab=vout}
C {devices/iopin.sym} -60 -240 0 0 {name=p14 lab=vin}
C {devices/iopin.sym} -60 -220 0 0 {name=p15 lab=vss}
C {onetops/ldo_top.sym} 0 0 0 0 {name=xldo}
N -100 -150 -120 -150 {lab=vhi}
C {devices/lab_pin.sym} -120 -150 0 0 {name=l16 sig_type=std_logic lab=vhi}
N -100 -110 -120 -110 {lab=vlo}
C {devices/lab_pin.sym} -120 -110 0 0 {name=l17 sig_type=std_logic lab=vlo}
N -100 -70 -120 -70 {lab=d0}
C {devices/lab_pin.sym} -120 -70 0 0 {name=l18 sig_type=std_logic lab=d0}
N -100 -30 -120 -30 {lab=d1}
C {devices/lab_pin.sym} -120 -30 0 0 {name=l19 sig_type=std_logic lab=d1}
N -100 10 -120 10 {lab=d2}
C {devices/lab_pin.sym} -120 10 0 0 {name=l20 sig_type=std_logic lab=d2}
N -100 50 -120 50 {lab=d3}
C {devices/lab_pin.sym} -120 50 0 0 {name=l21 sig_type=std_logic lab=d3}
N -100 90 -120 90 {lab=ibn}
C {devices/lab_pin.sym} -120 90 0 0 {name=l22 sig_type=std_logic lab=ibn}
N -100 130 -120 130 {lab=ben}
C {devices/lab_pin.sym} -120 130 0 0 {name=l23 sig_type=std_logic lab=ben}
N 100 0 120 0 {lab=vout}
C {devices/lab_pin.sym} 120 0 0 1 {name=l24 sig_type=std_logic lab=vout}
N 0 -190 0 -210 {lab=vin}
C {devices/lab_pin.sym} 0 -210 1 1 {name=l25 sig_type=std_logic lab=vin}
N 0 190 0 210 {lab=vss}
C {devices/lab_pin.sym} 0 210 3 1 {name=l26 sig_type=std_logic lab=vss}
C {onetops/decap.sym} 500 0 0 0 {name=xdecap}
N 400 0 380 0 {lab=vout}
C {devices/lab_pin.sym} 380 0 0 0 {name=l27 sig_type=std_logic lab=vout}
N 600 0 620 0 {lab=vss}
C {devices/lab_pin.sym} 620 0 0 1 {name=l28 sig_type=std_logic lab=vss}
C {onetops/load_emu.sym} 900 0 0 0 {name=xload}
N 800 -90 780 -90 {lab=ld0}
C {devices/lab_pin.sym} 780 -90 0 0 {name=l29 sig_type=std_logic lab=ld0}
N 800 -50 780 -50 {lab=ld1}
C {devices/lab_pin.sym} 780 -50 0 0 {name=l30 sig_type=std_logic lab=ld1}
N 800 -10 780 -10 {lab=ld2}
C {devices/lab_pin.sym} 780 -10 0 0 {name=l31 sig_type=std_logic lab=ld2}
N 800 30 780 30 {lab=ld3}
C {devices/lab_pin.sym} 780 30 0 0 {name=l32 sig_type=std_logic lab=ld3}
N 800 70 780 70 {lab=ibl}
C {devices/lab_pin.sym} 780 70 0 0 {name=l33 sig_type=std_logic lab=ibl}
N 1000 0 1020 0 {lab=vout}
C {devices/lab_pin.sym} 1020 0 0 1 {name=l34 sig_type=std_logic lab=vout}
N 900 130 900 150 {lab=vss}
C {devices/lab_pin.sym} 900 150 3 1 {name=l35 sig_type=std_logic lab=vss}
T {TT mapping (planned): vout -> ua[0] (sense only, pin max 4 mA), vref monitor -> ua[1], d[3:0]/ld[3:0] -> ui_in} 0 300 0 0 0.3 0.3 {}
