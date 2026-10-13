v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tb_vset_gen -- L1: VSET tracking, replica error (vrep - vref) vs VREF} -300 -380 0 0 0.6 0.6 {}
C {devices/vsource.sym} -200 0 0 0 {name=Vin value="dc 1.8 ac 0"}
N -200 -30 -200 -50 {lab=vin}
C {devices/lab_pin.sym} -200 -50 1 1 {name=l0 sig_type=std_logic lab=vin}
N -200 30 -200 50 {lab=0}
C {devices/lab_pin.sym} -200 50 3 1 {name=l1 sig_type=std_logic lab=0}
C {devices/isource.sym} -100 0 0 0 {name=Ib value="dc 20u"}
N -100 -30 -100 -50 {lab=vin}
C {devices/lab_pin.sym} -100 -50 1 1 {name=l2 sig_type=std_logic lab=vin}
N -100 30 -100 50 {lab=ibn}
C {devices/lab_pin.sym} -100 50 3 1 {name=l3 sig_type=std_logic lab=ibn}
C {devices/vsource.sym} -300 0 0 0 {name=Vben value="dc 1.8"}
N -300 -30 -300 -50 {lab=ben}
C {devices/lab_pin.sym} -300 -50 1 1 {name=l4 sig_type=std_logic lab=ben}
N -300 30 -300 50 {lab=0}
C {devices/lab_pin.sym} -300 50 3 1 {name=l5 sig_type=std_logic lab=0}
C {devices/vsource.sym} 0 0 0 0 {name=Vref value="dc 1.2"}
N 0 -30 0 -50 {lab=vref}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l6 sig_type=std_logic lab=vref}
N 0 30 0 50 {lab=0}
C {devices/lab_pin.sym} 0 50 3 1 {name=l7 sig_type=std_logic lab=0}
C {onetops/bias_mirror.sym} 300 0 0 0 {name=xbias}
N 180 0 160 0 {lab=ibn}
C {devices/lab_pin.sym} 160 0 0 0 {name=l8 sig_type=std_logic lab=ibn}
N 420 -90 440 -90 {lab=x}
C {devices/lab_pin.sym} 440 -90 0 1 {name=l9 sig_type=std_logic lab=x}
N 420 -50 440 -50 {lab=i_pd}
C {devices/lab_pin.sym} 440 -50 0 1 {name=l10 sig_type=std_logic lab=i_pd}
N 420 -10 440 -10 {lab=i_tail}
C {devices/lab_pin.sym} 440 -10 0 1 {name=l11 sig_type=std_logic lab=i_tail}
N 420 30 440 30 {lab=vb1}
C {devices/lab_pin.sym} 440 30 0 1 {name=l12 sig_type=std_logic lab=vb1}
N 420 70 440 70 {lab=vb2}
C {devices/lab_pin.sym} 440 70 0 1 {name=l13 sig_type=std_logic lab=vb2}
N 300 130 300 150 {lab=0}
C {devices/lab_pin.sym} 300 150 3 1 {name=l14 sig_type=std_logic lab=0}
C {devices/vsource.sym} 550 0 0 0 {name=Vx value="dc 0.8"}
N 550 -30 550 -50 {lab=x}
C {devices/lab_pin.sym} 550 -50 1 1 {name=l15 sig_type=std_logic lab=x}
N 550 30 550 50 {lab=0}
C {devices/lab_pin.sym} 550 50 3 1 {name=l16 sig_type=std_logic lab=0}
C {devices/vsource.sym} 650 0 0 0 {name=Vb1 value="dc 1.2"}
N 650 -30 650 -50 {lab=vb1}
C {devices/lab_pin.sym} 650 -50 1 1 {name=l17 sig_type=std_logic lab=vb1}
N 650 30 650 50 {lab=0}
C {devices/lab_pin.sym} 650 50 3 1 {name=l18 sig_type=std_logic lab=0}
C {devices/vsource.sym} 750 0 0 0 {name=Vb2 value="dc 1.2"}
N 750 -30 750 -50 {lab=vb2}
C {devices/lab_pin.sym} 750 -50 1 1 {name=l19 sig_type=std_logic lab=vb2}
N 750 30 750 50 {lab=0}
C {devices/lab_pin.sym} 750 50 3 1 {name=l20 sig_type=std_logic lab=0}
C {onetops/vset_gen.sym} 900 0 0 0 {name=xdut}
N 780 -50 760 -50 {lab=vref}
C {devices/lab_pin.sym} 760 -50 0 0 {name=l21 sig_type=std_logic lab=vref}
N 780 -10 760 -10 {lab=i_pd}
C {devices/lab_pin.sym} 760 -10 0 0 {name=l22 sig_type=std_logic lab=i_pd}
N 780 30 760 30 {lab=i_tail}
C {devices/lab_pin.sym} 760 30 0 0 {name=l23 sig_type=std_logic lab=i_tail}
N 1020 0 1040 0 {lab=vset}
C {devices/lab_pin.sym} 1040 0 0 1 {name=l24 sig_type=std_logic lab=vset}
N 900 -90 900 -110 {lab=vin}
C {devices/lab_pin.sym} 900 -110 1 1 {name=l25 sig_type=std_logic lab=vin}
C {devices/code_shown.sym} -300 400 0 0 {name=MODELS only_toplevel=true value=".lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt
.temp 27
.option savecurrents"}
C {devices/code_shown.sym} 400 400 0 0 {name=NGSPICE only_toplevel=true value=".control
dc vref 0.95 1.5 0.05
let err_mV = (v(xdut.vrep) - v(vref))*1000
print v(vref) v(vset) err_mV
.endc"}
