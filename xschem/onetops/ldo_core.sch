v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {ldo_core -- L2 capacitorless FVF LDO regulation loop (Rev A): VOUT ~= VREF, 0..10 mA, CL<=100 pF} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=vref}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=ibn}
C {devices/iopin.sym} -60 -300 0 0 {name=p2 lab=vout}
C {devices/iopin.sym} -60 -280 0 0 {name=p3 lab=vin}
C {devices/iopin.sym} -60 -260 0 0 {name=p4 lab=vss}
C {onetops/bias_mirror.sym} 0 0 0 0 {name=xbias}
N -120 0 -140 0 {lab=ibn}
C {devices/lab_pin.sym} -140 0 0 0 {name=l5 sig_type=std_logic lab=ibn}
N 120 -70 140 -70 {lab=x}
C {devices/lab_pin.sym} 140 -70 0 1 {name=l6 sig_type=std_logic lab=x}
N 120 -30 140 -30 {lab=vout}
C {devices/lab_pin.sym} 140 -30 0 1 {name=l7 sig_type=std_logic lab=vout}
N 120 10 140 10 {lab=i_pd}
C {devices/lab_pin.sym} 140 10 0 1 {name=l8 sig_type=std_logic lab=i_pd}
N 120 50 140 50 {lab=i_tail}
C {devices/lab_pin.sym} 140 50 0 1 {name=l9 sig_type=std_logic lab=i_tail}
N 0 110 0 130 {lab=vss}
C {devices/lab_pin.sym} 0 130 3 1 {name=l10 sig_type=std_logic lab=vss}
C {onetops/vset_gen.sym} 500 0 0 0 {name=xvset}
N 380 -50 360 -50 {lab=vref}
C {devices/lab_pin.sym} 360 -50 0 0 {name=l11 sig_type=std_logic lab=vref}
N 380 -10 360 -10 {lab=i_pd}
C {devices/lab_pin.sym} 360 -10 0 0 {name=l12 sig_type=std_logic lab=i_pd}
N 380 30 360 30 {lab=i_tail}
C {devices/lab_pin.sym} 360 30 0 0 {name=l13 sig_type=std_logic lab=i_tail}
N 620 0 640 0 {lab=vset}
C {devices/lab_pin.sym} 640 0 0 1 {name=l14 sig_type=std_logic lab=vset}
N 500 -90 500 -110 {lab=vin}
C {devices/lab_pin.sym} 500 -110 1 1 {name=l15 sig_type=std_logic lab=vin}
C {onetops/fvf_core.sym} 1000 0 0 0 {name=xfvf}
N 900 0 880 0 {lab=vset}
C {devices/lab_pin.sym} 880 0 0 0 {name=l16 sig_type=std_logic lab=vset}
N 1100 0 1120 0 {lab=x}
C {devices/lab_pin.sym} 1120 0 0 1 {name=l17 sig_type=std_logic lab=x}
N 1000 -50 1000 -70 {lab=vout}
C {devices/lab_pin.sym} 1000 -70 1 1 {name=l18 sig_type=std_logic lab=vout}
C {onetops/lg_probe.sym} 1000 250 0 0 {name=xprobe}
N 900 250 880 250 {lab=x}
C {devices/lab_pin.sym} 880 250 0 0 {name=l19 sig_type=std_logic lab=x}
N 1100 250 1120 250 {lab=xg}
C {devices/lab_pin.sym} 1120 250 0 1 {name=l20 sig_type=std_logic lab=xg}
C {onetops/pass_pmos.sym} 1400 0 0 0 {name=xpass}
N 1300 0 1280 0 {lab=xg}
C {devices/lab_pin.sym} 1280 0 0 0 {name=l21 sig_type=std_logic lab=xg}
N 1500 0 1520 0 {lab=vout}
C {devices/lab_pin.sym} 1520 0 0 1 {name=l22 sig_type=std_logic lab=vout}
N 1400 -50 1400 -70 {lab=vin}
C {devices/lab_pin.sym} 1400 -70 1 1 {name=l23 sig_type=std_logic lab=vin}
C {onetops/comp_rc.sym} 1400 250 0 0 {name=xcomp}
N 1300 250 1280 250 {lab=x}
C {devices/lab_pin.sym} 1280 250 0 0 {name=l24 sig_type=std_logic lab=x}
N 1500 250 1520 250 {lab=vout}
C {devices/lab_pin.sym} 1520 250 0 1 {name=l25 sig_type=std_logic lab=vout}
