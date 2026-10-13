v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {ldo_core -- L2 capacitorless FVF LDO regulation loop (Rev D: + transient boost + adaptive bias): VOUT ~= VREF, 0..10 mA} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=vref}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=ibn}
C {devices/ipin.sym} -300 -260 0 0 {name=p2 lab=ben}
C {devices/iopin.sym} -60 -300 0 0 {name=p3 lab=vout}
C {devices/iopin.sym} -60 -280 0 0 {name=p4 lab=vin}
C {devices/iopin.sym} -60 -260 0 0 {name=p5 lab=vss}
C {onetops/bias_mirror.sym} 0 0 0 0 {name=xbias}
N -120 0 -140 0 {lab=ibn}
C {devices/lab_pin.sym} -140 0 0 0 {name=l6 sig_type=std_logic lab=ibn}
N 120 -90 140 -90 {lab=x}
C {devices/lab_pin.sym} 140 -90 0 1 {name=l7 sig_type=std_logic lab=x}
N 120 -50 140 -50 {lab=i_pd}
C {devices/lab_pin.sym} 140 -50 0 1 {name=l8 sig_type=std_logic lab=i_pd}
N 120 -10 140 -10 {lab=i_tail}
C {devices/lab_pin.sym} 140 -10 0 1 {name=l9 sig_type=std_logic lab=i_tail}
N 120 30 140 30 {lab=i_bu}
C {devices/lab_pin.sym} 140 30 0 1 {name=l10 sig_type=std_logic lab=i_bu}
N 120 70 140 70 {lab=i_dz}
C {devices/lab_pin.sym} 140 70 0 1 {name=l11 sig_type=std_logic lab=i_dz}
N 0 130 0 150 {lab=vss}
C {devices/lab_pin.sym} 0 150 3 1 {name=l12 sig_type=std_logic lab=vss}
C {onetops/tr_boost.sym} 0 300 0 0 {name=xboost}
N -100 230 -120 230 {lab=ibn}
C {devices/lab_pin.sym} -120 230 0 0 {name=l13 sig_type=std_logic lab=ibn}
N -100 270 -120 270 {lab=ben}
C {devices/lab_pin.sym} -120 270 0 0 {name=l14 sig_type=std_logic lab=ben}
N -100 310 -120 310 {lab=i_bu}
C {devices/lab_pin.sym} -120 310 0 0 {name=l15 sig_type=std_logic lab=i_bu}
N -100 350 -120 350 {lab=i_dz}
C {devices/lab_pin.sym} -120 350 0 0 {name=l16 sig_type=std_logic lab=i_dz}
N 100 300 120 300 {lab=x}
C {devices/lab_pin.sym} 120 300 0 1 {name=l17 sig_type=std_logic lab=x}
N -30 190 -30 170 {lab=vin}
C {devices/lab_pin.sym} -30 170 1 1 {name=l18 sig_type=std_logic lab=vin}
N 30 190 30 170 {lab=vout}
C {devices/lab_pin.sym} 30 170 1 1 {name=l19 sig_type=std_logic lab=vout}
N 0 410 0 430 {lab=vss}
C {devices/lab_pin.sym} 0 430 3 1 {name=l20 sig_type=std_logic lab=vss}
C {onetops/vset_gen.sym} 500 0 0 0 {name=xvset}
N 380 -50 360 -50 {lab=vref}
C {devices/lab_pin.sym} 360 -50 0 0 {name=l21 sig_type=std_logic lab=vref}
N 380 -10 360 -10 {lab=i_pd}
C {devices/lab_pin.sym} 360 -10 0 0 {name=l22 sig_type=std_logic lab=i_pd}
N 380 30 360 30 {lab=i_tail}
C {devices/lab_pin.sym} 360 30 0 0 {name=l23 sig_type=std_logic lab=i_tail}
N 620 0 640 0 {lab=vset}
C {devices/lab_pin.sym} 640 0 0 1 {name=l24 sig_type=std_logic lab=vset}
N 500 -90 500 -110 {lab=vin}
C {devices/lab_pin.sym} 500 -110 1 1 {name=l25 sig_type=std_logic lab=vin}
C {onetops/fvf_core.sym} 1000 0 0 0 {name=xfvf}
N 900 0 880 0 {lab=vset}
C {devices/lab_pin.sym} 880 0 0 0 {name=l26 sig_type=std_logic lab=vset}
N 1100 0 1120 0 {lab=x}
C {devices/lab_pin.sym} 1120 0 0 1 {name=l27 sig_type=std_logic lab=x}
N 1000 -50 1000 -70 {lab=vout}
C {devices/lab_pin.sym} 1000 -70 1 1 {name=l28 sig_type=std_logic lab=vout}
C {onetops/lg_probe.sym} 1000 250 0 0 {name=xprobe}
N 900 250 880 250 {lab=x}
C {devices/lab_pin.sym} 880 250 0 0 {name=l29 sig_type=std_logic lab=x}
N 1100 250 1120 250 {lab=xg}
C {devices/lab_pin.sym} 1120 250 0 1 {name=l30 sig_type=std_logic lab=xg}
C {onetops/pass_pmos.sym} 1400 0 0 0 {name=xpass}
N 1300 0 1280 0 {lab=xg}
C {devices/lab_pin.sym} 1280 0 0 0 {name=l31 sig_type=std_logic lab=xg}
N 1500 0 1520 0 {lab=vout}
C {devices/lab_pin.sym} 1520 0 0 1 {name=l32 sig_type=std_logic lab=vout}
N 1400 -50 1400 -70 {lab=vin}
C {devices/lab_pin.sym} 1400 -70 1 1 {name=l33 sig_type=std_logic lab=vin}
C {onetops/comp_rc.sym} 1400 250 0 0 {name=xcomp}
N 1300 250 1280 250 {lab=x}
C {devices/lab_pin.sym} 1280 250 0 0 {name=l34 sig_type=std_logic lab=x}
N 1500 250 1520 250 {lab=vout}
C {devices/lab_pin.sym} 1520 250 0 1 {name=l35 sig_type=std_logic lab=vout}
C {onetops/ab_sense.sym} 1800 0 0 0 {name=xab}
N 1690 0 1670 0 {lab=xg}
C {devices/lab_pin.sym} 1670 0 0 0 {name=l36 sig_type=std_logic lab=xg}
N 1910 -30 1930 -30 {lab=x}
C {devices/lab_pin.sym} 1930 -30 0 1 {name=l37 sig_type=std_logic lab=x}
N 1910 10 1930 10 {lab=i_pd}
C {devices/lab_pin.sym} 1930 10 0 1 {name=l38 sig_type=std_logic lab=i_pd}
N 1800 -70 1800 -90 {lab=vin}
C {devices/lab_pin.sym} 1800 -90 1 1 {name=l39 sig_type=std_logic lab=vin}
N 1800 70 1800 90 {lab=vss}
C {devices/lab_pin.sym} 1800 90 3 1 {name=l40 sig_type=std_logic lab=vss}
