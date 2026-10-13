v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tb_chip_workload -- L4: sleep -> sense -> DVS up -> inference -> comm -> DVS down -> sleep} -300 -380 0 0 0.6 0.6 {}
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
C {devices/isource.sym} 0 0 0 0 {name=Ibl value="dc 20u"}
N 0 -30 0 -50 {lab=vin}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l6 sig_type=std_logic lab=vin}
N 0 30 0 50 {lab=ibl}
C {devices/lab_pin.sym} 0 50 3 1 {name=l7 sig_type=std_logic lab=ibl}
C {devices/vsource.sym} 100 0 0 0 {name=Vhi value="1.48"}
N 100 -30 100 -50 {lab=vhi}
C {devices/lab_pin.sym} 100 -50 1 1 {name=l8 sig_type=std_logic lab=vhi}
N 100 30 100 50 {lab=0}
C {devices/lab_pin.sym} 100 50 3 1 {name=l9 sig_type=std_logic lab=0}
C {devices/vsource.sym} 200 0 0 0 {name=Vlo value="1.00"}
N 200 -30 200 -50 {lab=vlo}
C {devices/lab_pin.sym} 200 -50 1 1 {name=l10 sig_type=std_logic lab=vlo}
N 200 30 200 50 {lab=0}
C {devices/lab_pin.sym} 200 50 3 1 {name=l11 sig_type=std_logic lab=0}
C {devices/vsource.sym} 300 0 0 0 {name=Vd0 value="pwl(0 1.8 30u 1.8 30.01u 0 50u 0 50.01u 0)"}
N 300 -30 300 -50 {lab=d0}
C {devices/lab_pin.sym} 300 -50 1 1 {name=l12 sig_type=std_logic lab=d0}
N 300 30 300 50 {lab=0}
C {devices/lab_pin.sym} 300 50 3 1 {name=l13 sig_type=std_logic lab=0}
C {devices/vsource.sym} 400 0 0 0 {name=Vd1 value="pwl(0 1.8 30u 1.8 30.01u 1.8 50u 1.8 50.01u 0)"}
N 400 -30 400 -50 {lab=d1}
C {devices/lab_pin.sym} 400 -50 1 1 {name=l14 sig_type=std_logic lab=d1}
N 400 30 400 50 {lab=0}
C {devices/lab_pin.sym} 400 50 3 1 {name=l15 sig_type=std_logic lab=0}
C {devices/vsource.sym} 500 0 0 0 {name=Vd2 value="pwl(0 1.8 30u 1.8 30.01u 0 50u 0 50.01u 1.8)"}
N 500 -30 500 -50 {lab=d2}
C {devices/lab_pin.sym} 500 -50 1 1 {name=l16 sig_type=std_logic lab=d2}
N 500 30 500 50 {lab=0}
C {devices/lab_pin.sym} 500 50 3 1 {name=l17 sig_type=std_logic lab=0}
C {devices/vsource.sym} 600 0 0 0 {name=Vd3 value="pwl(0 0 30u 0 30.01u 1.8 50u 1.8 50.01u 0)"}
N 600 -30 600 -50 {lab=d3}
C {devices/lab_pin.sym} 600 -50 1 1 {name=l18 sig_type=std_logic lab=d3}
N 600 30 600 50 {lab=0}
C {devices/lab_pin.sym} 600 50 3 1 {name=l19 sig_type=std_logic lab=0}
C {devices/vsource.sym} 700 0 0 0 {name=Vl0 value="pwl(0 0 35u 0 35.01u 1.8 45u 1.8 45.01u 0)"}
N 700 -30 700 -50 {lab=ld0}
C {devices/lab_pin.sym} 700 -50 1 1 {name=l20 sig_type=std_logic lab=ld0}
N 700 30 700 50 {lab=0}
C {devices/lab_pin.sym} 700 50 3 1 {name=l21 sig_type=std_logic lab=0}
C {devices/vsource.sym} 800 0 0 0 {name=Vl1 value="pwl(0 0 10u 0 10.01u 1.8 45u 1.8 45.01u 0)"}
N 800 -30 800 -50 {lab=ld1}
C {devices/lab_pin.sym} 800 -50 1 1 {name=l22 sig_type=std_logic lab=ld1}
N 800 30 800 50 {lab=0}
C {devices/lab_pin.sym} 800 50 3 1 {name=l23 sig_type=std_logic lab=0}
C {devices/vsource.sym} 900 0 0 0 {name=Vl2 value="pwl(0 0 35u 0 35.01u 1.8 45u 1.8 45.01u 0)"}
N 900 -30 900 -50 {lab=ld2}
C {devices/lab_pin.sym} 900 -50 1 1 {name=l24 sig_type=std_logic lab=ld2}
N 900 30 900 50 {lab=0}
C {devices/lab_pin.sym} 900 50 3 1 {name=l25 sig_type=std_logic lab=0}
C {devices/vsource.sym} 1000 0 0 0 {name=Vl3 value="pwl(0 0 35u 0 35.01u 1.8 55u 1.8 55.01u 0)"}
N 1000 -30 1000 -50 {lab=ld3}
C {devices/lab_pin.sym} 1000 -50 1 1 {name=l26 sig_type=std_logic lab=ld3}
N 1000 30 1000 50 {lab=0}
C {devices/lab_pin.sym} 1000 50 3 1 {name=l27 sig_type=std_logic lab=0}
C {onetops/chip_top.sym} 1400 0 0 0 {name=xchip}
N 1300 -250 1280 -250 {lab=vhi}
C {devices/lab_pin.sym} 1280 -250 0 0 {name=l28 sig_type=std_logic lab=vhi}
N 1300 -210 1280 -210 {lab=vlo}
C {devices/lab_pin.sym} 1280 -210 0 0 {name=l29 sig_type=std_logic lab=vlo}
N 1300 -170 1280 -170 {lab=d0}
C {devices/lab_pin.sym} 1280 -170 0 0 {name=l30 sig_type=std_logic lab=d0}
N 1300 -130 1280 -130 {lab=d1}
C {devices/lab_pin.sym} 1280 -130 0 0 {name=l31 sig_type=std_logic lab=d1}
N 1300 -90 1280 -90 {lab=d2}
C {devices/lab_pin.sym} 1280 -90 0 0 {name=l32 sig_type=std_logic lab=d2}
N 1300 -50 1280 -50 {lab=d3}
C {devices/lab_pin.sym} 1280 -50 0 0 {name=l33 sig_type=std_logic lab=d3}
N 1300 -10 1280 -10 {lab=ibn}
C {devices/lab_pin.sym} 1280 -10 0 0 {name=l34 sig_type=std_logic lab=ibn}
N 1300 30 1280 30 {lab=ben}
C {devices/lab_pin.sym} 1280 30 0 0 {name=l35 sig_type=std_logic lab=ben}
N 1300 70 1280 70 {lab=ld0}
C {devices/lab_pin.sym} 1280 70 0 0 {name=l36 sig_type=std_logic lab=ld0}
N 1300 110 1280 110 {lab=ld1}
C {devices/lab_pin.sym} 1280 110 0 0 {name=l37 sig_type=std_logic lab=ld1}
N 1300 150 1280 150 {lab=ld2}
C {devices/lab_pin.sym} 1280 150 0 0 {name=l38 sig_type=std_logic lab=ld2}
N 1300 190 1280 190 {lab=ld3}
C {devices/lab_pin.sym} 1280 190 0 0 {name=l39 sig_type=std_logic lab=ld3}
N 1300 230 1280 230 {lab=ibl}
C {devices/lab_pin.sym} 1280 230 0 0 {name=l40 sig_type=std_logic lab=ibl}
N 1500 0 1520 0 {lab=vout}
C {devices/lab_pin.sym} 1520 0 0 1 {name=l41 sig_type=std_logic lab=vout}
N 1400 -290 1400 -310 {lab=vin}
C {devices/lab_pin.sym} 1400 -310 1 1 {name=l42 sig_type=std_logic lab=vin}
N 1400 290 1400 310 {lab=0}
C {devices/lab_pin.sym} 1400 310 3 1 {name=l43 sig_type=std_logic lab=0}
C {devices/capa.sym} 1700 0 0 0 {name=Cpad value="5p" m=1}
N 1700 -30 1700 -50 {lab=vout}
C {devices/lab_pin.sym} 1700 -50 1 1 {name=l44 sig_type=std_logic lab=vout}
N 1700 30 1700 50 {lab=0}
C {devices/lab_pin.sym} 1700 50 3 1 {name=l45 sig_type=std_logic lab=0}
C {devices/code_shown.sym} -300 400 0 0 {name=MODELS only_toplevel=true value=".lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt
.temp 27
.option savecurrents"}
C {devices/code_shown.sym} 400 400 0 0 {name=NGSPICE only_toplevel=true value=".control
foreach ben 1.8 0
alter @vben[dc]=$ben
echo WORKLOAD BEN=$ben
tran 5n 70u
meas tran v_sleep find v(vout) at=9.5u
meas tran v_sense find v(vout) at=29u
meas tran v_pre find v(vout) at=34.9u
meas tran vmin_inf min v(vout) from=35u to=40u
meas tran v_inf find v(vout) at=44.9u
meas tran vmax_comm max v(vout) from=45u to=48u
meas tran v_comm find v(vout) at=49.9u
meas tran v_low find v(vout) at=54.9u
meas tran vmax_sleep max v(vout) from=55u to=58u
let under_inf_mV = (v_pre - vmin_inf)*1000
let over_comm_mV = (vmax_comm - v_inf)*1000
let over_sleep_mV = (vmax_sleep - v_low)*1000
print under_inf_mV over_comm_mV over_sleep_mV
meas tran iin_avg avg i(vin) from=0 to=70u
let iavg_mA = -iin_avg*1000
print iavg_mA
end
.endc"}
