v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tb_ldo_core_dc -- L2: load reg, line reg, dropout, Iq} -300 -380 0 0 0.6 0.6 {}
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
C {onetops/ldo_core.sym} 300 0 0 0 {name=xldo}
N 200 -50 180 -50 {lab=vref}
C {devices/lab_pin.sym} 180 -50 0 0 {name=l8 sig_type=std_logic lab=vref}
N 200 -10 180 -10 {lab=ibn}
C {devices/lab_pin.sym} 180 -10 0 0 {name=l9 sig_type=std_logic lab=ibn}
N 200 30 180 30 {lab=ben}
C {devices/lab_pin.sym} 180 30 0 0 {name=l10 sig_type=std_logic lab=ben}
N 400 0 420 0 {lab=vout}
C {devices/lab_pin.sym} 420 0 0 1 {name=l11 sig_type=std_logic lab=vout}
N 300 -90 300 -110 {lab=vin}
C {devices/lab_pin.sym} 300 -110 1 1 {name=l12 sig_type=std_logic lab=vin}
N 300 90 300 110 {lab=0}
C {devices/lab_pin.sym} 300 110 3 1 {name=l13 sig_type=std_logic lab=0}
C {devices/isource.sym} 600 0 0 0 {name=Il value="dc 1m"}
N 600 -30 600 -50 {lab=vout}
C {devices/lab_pin.sym} 600 -50 1 1 {name=l14 sig_type=std_logic lab=vout}
N 600 30 600 50 {lab=0}
C {devices/lab_pin.sym} 600 50 3 1 {name=l15 sig_type=std_logic lab=0}
C {devices/capa.sym} 700 0 0 0 {name=Cl value="20p" m=1}
N 700 -30 700 -50 {lab=vout}
C {devices/lab_pin.sym} 700 -50 1 1 {name=l16 sig_type=std_logic lab=vout}
N 700 30 700 50 {lab=0}
C {devices/lab_pin.sym} 700 50 3 1 {name=l17 sig_type=std_logic lab=0}
C {devices/code_shown.sym} -300 400 0 0 {name=MODELS only_toplevel=true value=".lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt
.temp 27
.option savecurrents"}
C {devices/code_shown.sym} 400 400 0 0 {name=NGSPICE only_toplevel=true value=".control
op
echo VOUT = $&v(vout)  VSET = $&v(xldo.vset)  X = $&v(xldo.x)
dc il 0 10.1m 0.1m
meas dc vnl find v(vout) at=0
meas dc vfl find v(vout) at=10m
let loadreg_mV_per_mA = (vnl - vfl)/10*1000
print loadreg_mV_per_mA
alter il dc=0
dc vin 1.5 1.98 0.01
meas dc iq find i(vin) at=1.8
let iq_uA = -iq*1e6
print iq_uA
alter il dc=10m
dc vin 1.3 1.98 0.01
meas dc v18 find v(vout) at=1.8
meas dc v165 find v(vout) at=1.65
let linereg_mV_per_V = (v18 - v165)/0.15*1000
print linereg_mV_per_V
if $?batchmode
else
plot dc1.v(vout) xlabel 'ILOAD (A)' title 'load regulation'
plot dc3.v(vout) xlabel 'VIN (V)' title 'line regulation @ 10 mA'
end
.endc"}
