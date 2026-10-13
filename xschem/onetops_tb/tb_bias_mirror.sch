v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tb_bias_mirror -- L1: mirror output currents vs Vds (compliance)} -300 -380 0 0 0.6 0.6 {}
C {devices/vsource.sym} -200 0 0 0 {name=Vdd value="1.8"}
N -200 -30 -200 -50 {lab=vdd}
C {devices/lab_pin.sym} -200 -50 1 1 {name=l0 sig_type=std_logic lab=vdd}
N -200 30 -200 50 {lab=0}
C {devices/lab_pin.sym} -200 50 3 1 {name=l1 sig_type=std_logic lab=0}
C {devices/isource.sym} -100 0 0 0 {name=Ib value="dc 20u"}
N -100 -30 -100 -50 {lab=vdd}
C {devices/lab_pin.sym} -100 -50 1 1 {name=l2 sig_type=std_logic lab=vdd}
N -100 30 -100 50 {lab=ibn}
C {devices/lab_pin.sym} -100 50 3 1 {name=l3 sig_type=std_logic lab=ibn}
C {onetops/bias_mirror.sym} 200 0 0 0 {name=xdut}
N 80 0 60 0 {lab=ibn}
C {devices/lab_pin.sym} 60 0 0 0 {name=l4 sig_type=std_logic lab=ibn}
N 320 -90 340 -90 {lab=o1}
C {devices/lab_pin.sym} 340 -90 0 1 {name=l5 sig_type=std_logic lab=o1}
N 320 -50 340 -50 {lab=o2}
C {devices/lab_pin.sym} 340 -50 0 1 {name=l6 sig_type=std_logic lab=o2}
N 320 -10 340 -10 {lab=o3}
C {devices/lab_pin.sym} 340 -10 0 1 {name=l7 sig_type=std_logic lab=o3}
N 320 30 340 30 {lab=o4}
C {devices/lab_pin.sym} 340 30 0 1 {name=l8 sig_type=std_logic lab=o4}
N 320 70 340 70 {lab=o5}
C {devices/lab_pin.sym} 340 70 0 1 {name=l9 sig_type=std_logic lab=o5}
N 200 130 200 150 {lab=0}
C {devices/lab_pin.sym} 200 150 3 1 {name=l10 sig_type=std_logic lab=0}
C {devices/vsource.sym} 550 0 0 0 {name=Vo1 value="dc 0.6"}
N 550 -30 550 -50 {lab=o1}
C {devices/lab_pin.sym} 550 -50 1 1 {name=l11 sig_type=std_logic lab=o1}
N 550 30 550 50 {lab=0}
C {devices/lab_pin.sym} 550 50 3 1 {name=l12 sig_type=std_logic lab=0}
C {devices/vsource.sym} 650 0 0 0 {name=Vo2 value="dc 0.6"}
N 650 -30 650 -50 {lab=o2}
C {devices/lab_pin.sym} 650 -50 1 1 {name=l13 sig_type=std_logic lab=o2}
N 650 30 650 50 {lab=0}
C {devices/lab_pin.sym} 650 50 3 1 {name=l14 sig_type=std_logic lab=0}
C {devices/vsource.sym} 750 0 0 0 {name=Vo3 value="dc 0.6"}
N 750 -30 750 -50 {lab=o3}
C {devices/lab_pin.sym} 750 -50 1 1 {name=l15 sig_type=std_logic lab=o3}
N 750 30 750 50 {lab=0}
C {devices/lab_pin.sym} 750 50 3 1 {name=l16 sig_type=std_logic lab=0}
C {devices/vsource.sym} 850 0 0 0 {name=Vo4 value="dc 0.6"}
N 850 -30 850 -50 {lab=o4}
C {devices/lab_pin.sym} 850 -50 1 1 {name=l17 sig_type=std_logic lab=o4}
N 850 30 850 50 {lab=0}
C {devices/lab_pin.sym} 850 50 3 1 {name=l18 sig_type=std_logic lab=0}
C {devices/vsource.sym} 950 0 0 0 {name=Vo5 value="dc 0.6"}
N 950 -30 950 -50 {lab=o5}
C {devices/lab_pin.sym} 950 -50 1 1 {name=l19 sig_type=std_logic lab=o5}
N 950 30 950 50 {lab=0}
C {devices/lab_pin.sym} 950 50 3 1 {name=l20 sig_type=std_logic lab=0}
C {devices/code_shown.sym} -300 400 0 0 {name=MODELS only_toplevel=true value=".lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt
.temp 27
.option savecurrents"}
C {devices/code_shown.sym} 400 400 0 0 {name=NGSPICE only_toplevel=true value=".control
dc vo1 0 1.8 0.01
let i1 = -i(vo1)
let i2 = -i(vo2)
meas dc i_fvf_06 find i1 at=0.6
meas dc vds_min when i1=19u cross=1
op
print -i(vo1) -i(vo2) -i(vo3) -i(vo4) -i(vo5)
if $?batchmode
else
plot -i(vo1)*1e6 ylabel 'o_fvf current (uA)' xlabel 'Vds (V)'
end
.endc"}
