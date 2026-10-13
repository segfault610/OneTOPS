v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tb_ldo_top_dvs -- L3: DVS staircase, code 0..15 (5 us/code) at 5 mA} -300 -380 0 0 0.6 0.6 {}
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
C {devices/vsource.sym} 0 0 0 0 {name=Vhi value="1.48"}
N 0 -30 0 -50 {lab=vhi}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l4 sig_type=std_logic lab=vhi}
N 0 30 0 50 {lab=0}
C {devices/lab_pin.sym} 0 50 3 1 {name=l5 sig_type=std_logic lab=0}
C {devices/vsource.sym} 100 0 0 0 {name=Vlo value="1.00"}
N 100 -30 100 -50 {lab=vlo}
C {devices/lab_pin.sym} 100 -50 1 1 {name=l6 sig_type=std_logic lab=vlo}
N 100 30 100 50 {lab=0}
C {devices/lab_pin.sym} 100 50 3 1 {name=l7 sig_type=std_logic lab=0}
C {devices/vsource.sym} 200 0 0 0 {name=Vd0 value="pulse(0 1.8 5e-06 10n 10n 4.99e-06 1e-05)"}
N 200 -30 200 -50 {lab=d0}
C {devices/lab_pin.sym} 200 -50 1 1 {name=l8 sig_type=std_logic lab=d0}
N 200 30 200 50 {lab=0}
C {devices/lab_pin.sym} 200 50 3 1 {name=l9 sig_type=std_logic lab=0}
C {devices/vsource.sym} 300 0 0 0 {name=Vd1 value="pulse(0 1.8 1e-05 10n 10n 9.99e-06 2e-05)"}
N 300 -30 300 -50 {lab=d1}
C {devices/lab_pin.sym} 300 -50 1 1 {name=l10 sig_type=std_logic lab=d1}
N 300 30 300 50 {lab=0}
C {devices/lab_pin.sym} 300 50 3 1 {name=l11 sig_type=std_logic lab=0}
C {devices/vsource.sym} 400 0 0 0 {name=Vd2 value="pulse(0 1.8 2e-05 10n 10n 1.999e-05 4e-05)"}
N 400 -30 400 -50 {lab=d2}
C {devices/lab_pin.sym} 400 -50 1 1 {name=l12 sig_type=std_logic lab=d2}
N 400 30 400 50 {lab=0}
C {devices/lab_pin.sym} 400 50 3 1 {name=l13 sig_type=std_logic lab=0}
C {devices/vsource.sym} 500 0 0 0 {name=Vd3 value="pulse(0 1.8 4e-05 10n 10n 3.999e-05 8e-05)"}
N 500 -30 500 -50 {lab=d3}
C {devices/lab_pin.sym} 500 -50 1 1 {name=l14 sig_type=std_logic lab=d3}
N 500 30 500 50 {lab=0}
C {devices/lab_pin.sym} 500 50 3 1 {name=l15 sig_type=std_logic lab=0}
C {onetops/ldo_top.sym} 900 0 0 0 {name=xtop}
N 800 -130 780 -130 {lab=vhi}
C {devices/lab_pin.sym} 780 -130 0 0 {name=l16 sig_type=std_logic lab=vhi}
N 800 -90 780 -90 {lab=vlo}
C {devices/lab_pin.sym} 780 -90 0 0 {name=l17 sig_type=std_logic lab=vlo}
N 800 -50 780 -50 {lab=d0}
C {devices/lab_pin.sym} 780 -50 0 0 {name=l18 sig_type=std_logic lab=d0}
N 800 -10 780 -10 {lab=d1}
C {devices/lab_pin.sym} 780 -10 0 0 {name=l19 sig_type=std_logic lab=d1}
N 800 30 780 30 {lab=d2}
C {devices/lab_pin.sym} 780 30 0 0 {name=l20 sig_type=std_logic lab=d2}
N 800 70 780 70 {lab=d3}
C {devices/lab_pin.sym} 780 70 0 0 {name=l21 sig_type=std_logic lab=d3}
N 800 110 780 110 {lab=ibn}
C {devices/lab_pin.sym} 780 110 0 0 {name=l22 sig_type=std_logic lab=ibn}
N 1000 0 1020 0 {lab=vout}
C {devices/lab_pin.sym} 1020 0 0 1 {name=l23 sig_type=std_logic lab=vout}
N 900 -170 900 -190 {lab=vin}
C {devices/lab_pin.sym} 900 -190 1 1 {name=l24 sig_type=std_logic lab=vin}
N 900 170 900 190 {lab=0}
C {devices/lab_pin.sym} 900 190 3 1 {name=l25 sig_type=std_logic lab=0}
C {devices/isource.sym} 1200 0 0 0 {name=Il value="dc 5m"}
N 1200 -30 1200 -50 {lab=vout}
C {devices/lab_pin.sym} 1200 -50 1 1 {name=l26 sig_type=std_logic lab=vout}
N 1200 30 1200 50 {lab=0}
C {devices/lab_pin.sym} 1200 50 3 1 {name=l27 sig_type=std_logic lab=0}
C {devices/capa.sym} 1300 0 0 0 {name=Cl value="20p" m=1}
N 1300 -30 1300 -50 {lab=vout}
C {devices/lab_pin.sym} 1300 -50 1 1 {name=l28 sig_type=std_logic lab=vout}
N 1300 30 1300 50 {lab=0}
C {devices/lab_pin.sym} 1300 50 3 1 {name=l29 sig_type=std_logic lab=0}
C {devices/code_shown.sym} -300 400 0 0 {name=MODELS only_toplevel=true value=".lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt
.temp 27
.option savecurrents"}
C {devices/code_shown.sym} 400 400 0 0 {name=NGSPICE only_toplevel=true value=".control
tran 10n 80u
echo code  vref(V)   vout(V)   err(mV)
let k = 0
while k < 16
  let tt = 4.5u + k*5u
  meas tran vr find v(xtop.vref) at=$&tt
  meas tran vo find v(vout) at=$&tt
  let e = (vo - (1.0 + 0.03*k))*1000
  echo $&k  $&vr  $&vo  $&e
  let k = k + 1
end
write tb_ldo_top_dvs.raw
.endc"}
