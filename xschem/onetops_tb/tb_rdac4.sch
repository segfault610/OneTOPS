v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tb_rdac4 -- L1: 16-code staircase, monotonicity / DNL} -300 -380 0 0 0.6 0.6 {}
C {devices/vsource.sym} -200 0 0 0 {name=Vdd value="1.8"}
N -200 -30 -200 -50 {lab=vdd}
C {devices/lab_pin.sym} -200 -50 1 1 {name=l0 sig_type=std_logic lab=vdd}
N -200 30 -200 50 {lab=0}
C {devices/lab_pin.sym} -200 50 3 1 {name=l1 sig_type=std_logic lab=0}
C {devices/vsource.sym} -100 0 0 0 {name=Vhi value="1.48"}
N -100 -30 -100 -50 {lab=vhi}
C {devices/lab_pin.sym} -100 -50 1 1 {name=l2 sig_type=std_logic lab=vhi}
N -100 30 -100 50 {lab=0}
C {devices/lab_pin.sym} -100 50 3 1 {name=l3 sig_type=std_logic lab=0}
C {devices/vsource.sym} 0 0 0 0 {name=Vlo value="1.00"}
N 0 -30 0 -50 {lab=vlo}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l4 sig_type=std_logic lab=vlo}
N 0 30 0 50 {lab=0}
C {devices/lab_pin.sym} 0 50 3 1 {name=l5 sig_type=std_logic lab=0}
C {devices/vsource.sym} 100 0 0 0 {name=Vd0 value="pulse(0 1.8 1e-06 1n 1n 9.99e-07 2e-06)"}
N 100 -30 100 -50 {lab=d0}
C {devices/lab_pin.sym} 100 -50 1 1 {name=l6 sig_type=std_logic lab=d0}
N 100 30 100 50 {lab=0}
C {devices/lab_pin.sym} 100 50 3 1 {name=l7 sig_type=std_logic lab=0}
C {devices/vsource.sym} 200 0 0 0 {name=Vd1 value="pulse(0 1.8 2e-06 1n 1n 1.999e-06 4e-06)"}
N 200 -30 200 -50 {lab=d1}
C {devices/lab_pin.sym} 200 -50 1 1 {name=l8 sig_type=std_logic lab=d1}
N 200 30 200 50 {lab=0}
C {devices/lab_pin.sym} 200 50 3 1 {name=l9 sig_type=std_logic lab=0}
C {devices/vsource.sym} 300 0 0 0 {name=Vd2 value="pulse(0 1.8 4e-06 1n 1n 3.999e-06 8e-06)"}
N 300 -30 300 -50 {lab=d2}
C {devices/lab_pin.sym} 300 -50 1 1 {name=l10 sig_type=std_logic lab=d2}
N 300 30 300 50 {lab=0}
C {devices/lab_pin.sym} 300 50 3 1 {name=l11 sig_type=std_logic lab=0}
C {devices/vsource.sym} 400 0 0 0 {name=Vd3 value="pulse(0 1.8 8e-06 1n 1n 7.999e-06 1.6e-05)"}
N 400 -30 400 -50 {lab=d3}
C {devices/lab_pin.sym} 400 -50 1 1 {name=l12 sig_type=std_logic lab=d3}
N 400 30 400 50 {lab=0}
C {devices/lab_pin.sym} 400 50 3 1 {name=l13 sig_type=std_logic lab=0}
C {onetops/rdac4.sym} 700 0 0 0 {name=xdut}
N 600 -110 580 -110 {lab=vhi}
C {devices/lab_pin.sym} 580 -110 0 0 {name=l14 sig_type=std_logic lab=vhi}
N 600 -70 580 -70 {lab=vlo}
C {devices/lab_pin.sym} 580 -70 0 0 {name=l15 sig_type=std_logic lab=vlo}
N 600 -30 580 -30 {lab=d0}
C {devices/lab_pin.sym} 580 -30 0 0 {name=l16 sig_type=std_logic lab=d0}
N 600 10 580 10 {lab=d1}
C {devices/lab_pin.sym} 580 10 0 0 {name=l17 sig_type=std_logic lab=d1}
N 600 50 580 50 {lab=d2}
C {devices/lab_pin.sym} 580 50 0 0 {name=l18 sig_type=std_logic lab=d2}
N 600 90 580 90 {lab=d3}
C {devices/lab_pin.sym} 580 90 0 0 {name=l19 sig_type=std_logic lab=d3}
N 800 0 820 0 {lab=out}
C {devices/lab_pin.sym} 820 0 0 1 {name=l20 sig_type=std_logic lab=out}
N 700 -150 700 -170 {lab=vdd}
C {devices/lab_pin.sym} 700 -170 1 1 {name=l21 sig_type=std_logic lab=vdd}
N 700 150 700 170 {lab=0}
C {devices/lab_pin.sym} 700 170 3 1 {name=l22 sig_type=std_logic lab=0}
C {devices/capa.sym} 1000 0 0 0 {name=Cl value="100f" m=1}
N 1000 -30 1000 -50 {lab=out}
C {devices/lab_pin.sym} 1000 -50 1 1 {name=l23 sig_type=std_logic lab=out}
N 1000 30 1000 50 {lab=0}
C {devices/lab_pin.sym} 1000 50 3 1 {name=l24 sig_type=std_logic lab=0}
C {devices/code_shown.sym} -300 400 0 0 {name=MODELS only_toplevel=true value=".lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt
.temp 27
.option savecurrents"}
C {devices/code_shown.sym} 400 400 0 0 {name=NGSPICE only_toplevel=true value=".control
tran 10n 16u
let k = 0
echo code  vout(V)   step(mV)
let vp = 0
while k < 16
  let tt = 0.9u + k*1u
  meas tran vk find v(out) at=$&tt
  let st = (vk - vp)*1000
  echo $&k  $&vk  $&st
  let vp = vk
  let k = k + 1
end
.endc"}
