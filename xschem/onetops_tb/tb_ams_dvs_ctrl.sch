v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tb_ams_dvs_ctrl -- L4 AMS: dvs_ctrl RTL (d_cosim) + chip_top. Hint pre-boost before an AI burst} -300 -380 0 0 0.6 0.6 {}
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
C {devices/isource.sym} 0 0 0 0 {name=Ibl value="dc 20u"}
N 0 -30 0 -50 {lab=vin}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l4 sig_type=std_logic lab=vin}
N 0 30 0 50 {lab=ibl}
C {devices/lab_pin.sym} 0 50 3 1 {name=l5 sig_type=std_logic lab=ibl}
C {devices/vsource.sym} 100 0 0 0 {name=Vhi value="1.48"}
N 100 -30 100 -50 {lab=vhi}
C {devices/lab_pin.sym} 100 -50 1 1 {name=l6 sig_type=std_logic lab=vhi}
N 100 30 100 50 {lab=0}
C {devices/lab_pin.sym} 100 50 3 1 {name=l7 sig_type=std_logic lab=0}
C {devices/vsource.sym} 200 0 0 0 {name=Vlo value="1.00"}
N 200 -30 200 -50 {lab=vlo}
C {devices/lab_pin.sym} 200 -50 1 1 {name=l8 sig_type=std_logic lab=vlo}
N 200 30 200 50 {lab=0}
C {devices/lab_pin.sym} 200 50 3 1 {name=l9 sig_type=std_logic lab=0}
C {devices/vsource.sym} 300 0 0 0 {name=Vl0 value="pwl(0 0 18u 0 18.01u 1.8 26u 1.8 26.01u 0)"}
N 300 -30 300 -50 {lab=ld0}
C {devices/lab_pin.sym} 300 -50 1 1 {name=l10 sig_type=std_logic lab=ld0}
N 300 30 300 50 {lab=0}
C {devices/lab_pin.sym} 300 50 3 1 {name=l11 sig_type=std_logic lab=0}
C {devices/vsource.sym} 400 0 0 0 {name=Vl1 value="pwl(0 0 5u 0 5.01u 1.8 26u 1.8 26.01u 0)"}
N 400 -30 400 -50 {lab=ld1}
C {devices/lab_pin.sym} 400 -50 1 1 {name=l12 sig_type=std_logic lab=ld1}
N 400 30 400 50 {lab=0}
C {devices/lab_pin.sym} 400 50 3 1 {name=l13 sig_type=std_logic lab=0}
C {devices/vsource.sym} 500 0 0 0 {name=Vl2 value="pwl(0 0 18u 0 18.01u 1.8 26u 1.8 26.01u 0)"}
N 500 -30 500 -50 {lab=ld2}
C {devices/lab_pin.sym} 500 -50 1 1 {name=l14 sig_type=std_logic lab=ld2}
N 500 30 500 50 {lab=0}
C {devices/lab_pin.sym} 500 50 3 1 {name=l15 sig_type=std_logic lab=0}
C {devices/vsource.sym} 600 0 0 0 {name=Vl3 value="pwl(0 0 18u 0 18.01u 1.8 26u 1.8 26.01u 0)"}
N 600 -30 600 -50 {lab=ld3}
C {devices/lab_pin.sym} 600 -50 1 1 {name=l16 sig_type=std_logic lab=ld3}
N 600 30 600 50 {lab=0}
C {devices/lab_pin.sym} 600 50 3 1 {name=l17 sig_type=std_logic lab=0}
C {onetops/chip_top.sym} 1000 0 0 0 {name=xchip}
N 900 -250 880 -250 {lab=vhi}
C {devices/lab_pin.sym} 880 -250 0 0 {name=l18 sig_type=std_logic lab=vhi}
N 900 -210 880 -210 {lab=vlo}
C {devices/lab_pin.sym} 880 -210 0 0 {name=l19 sig_type=std_logic lab=vlo}
N 900 -170 880 -170 {lab=d0}
C {devices/lab_pin.sym} 880 -170 0 0 {name=l20 sig_type=std_logic lab=d0}
N 900 -130 880 -130 {lab=d1}
C {devices/lab_pin.sym} 880 -130 0 0 {name=l21 sig_type=std_logic lab=d1}
N 900 -90 880 -90 {lab=d2}
C {devices/lab_pin.sym} 880 -90 0 0 {name=l22 sig_type=std_logic lab=d2}
N 900 -50 880 -50 {lab=d3}
C {devices/lab_pin.sym} 880 -50 0 0 {name=l23 sig_type=std_logic lab=d3}
N 900 -10 880 -10 {lab=ibn}
C {devices/lab_pin.sym} 880 -10 0 0 {name=l24 sig_type=std_logic lab=ibn}
N 900 30 880 30 {lab=ben}
C {devices/lab_pin.sym} 880 30 0 0 {name=l25 sig_type=std_logic lab=ben}
N 900 70 880 70 {lab=ld0}
C {devices/lab_pin.sym} 880 70 0 0 {name=l26 sig_type=std_logic lab=ld0}
N 900 110 880 110 {lab=ld1}
C {devices/lab_pin.sym} 880 110 0 0 {name=l27 sig_type=std_logic lab=ld1}
N 900 150 880 150 {lab=ld2}
C {devices/lab_pin.sym} 880 150 0 0 {name=l28 sig_type=std_logic lab=ld2}
N 900 190 880 190 {lab=ld3}
C {devices/lab_pin.sym} 880 190 0 0 {name=l29 sig_type=std_logic lab=ld3}
N 900 230 880 230 {lab=ibl}
C {devices/lab_pin.sym} 880 230 0 0 {name=l30 sig_type=std_logic lab=ibl}
N 1100 0 1120 0 {lab=vout}
C {devices/lab_pin.sym} 1120 0 0 1 {name=l31 sig_type=std_logic lab=vout}
N 1000 -290 1000 -310 {lab=vin}
C {devices/lab_pin.sym} 1000 -310 1 1 {name=l32 sig_type=std_logic lab=vin}
N 1000 290 1000 310 {lab=0}
C {devices/lab_pin.sym} 1000 310 3 1 {name=l33 sig_type=std_logic lab=0}
C {devices/capa.sym} 1300 0 0 0 {name=Cpad value="5p" m=1}
N 1300 -30 1300 -50 {lab=vout}
C {devices/lab_pin.sym} 1300 -50 1 1 {name=l34 sig_type=std_logic lab=vout}
N 1300 30 1300 50 {lab=0}
C {devices/lab_pin.sym} 1300 50 3 1 {name=l35 sig_type=std_logic lab=0}
T {Digital: dvs_ctrl.sv compiled by scripts/build_ams.sh (Verilator) and loaded by the d_cosim instance in the NGSPICE block. code_out -> d3..d0, boost_en -> ben} -300 300 0 0 0.3 0.3 {}
C {devices/code_shown.sym} -300 400 0 0 {name=MODELS only_toplevel=true value=".lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt
.temp 27
.option savecurrents"}
C {devices/code_shown.sym} 400 400 0 0 {name=NGSPICE only_toplevel=true value="* ---- digital side (XSPICE). Stimulus: analog PWL -> adc_bridge
Vclk aclk 0 pulse(0 1.8 0 1n 1n 49n 100n)
Vrst arst 0 pwl(0 0 1u 0 1.001u 1.8)
* code_req = 7 (0111) until 30 us, then 4 (0100)
Vcr3 acr3 0 dc 0
Vcr2 acr2 0 dc 1.8
Vcr1 acr1 0 pwl(0 1.8 30u 1.8 30.001u 0)
Vcr0 acr0 0 pwl(0 1.8 30u 1.8 30.001u 0)
* workload hint: AI burst expected -> raise VOUT 3 codes and enable boost (12 us .. 28 us)
Vhint ahint 0 pwl(0 0 12u 0 12.001u 1.8 28u 1.8 28.001u 0)
abrin [aclk arst acr3 acr2 acr1 acr0 ahint] [dclk drst dcr3 dcr2 dcr1 dcr0 dhint] adcb
.model adcb adc_bridge in_low=0.9 in_high=0.9
* port order = Verilog port order, vectors MSB first
adut [dclk drst dcr3 dcr2 dcr1 dcr0 dhint] [dco3 dco2 dco1 dco0 dben dset] dvs
.model dvs d_cosim simulation=../ams/dvs_ctrl.so
abrout [dco3 dco2 dco1 dco0 dben dset] [d3 d2 d1 d0 ben settled] dacb
.model dacb dac_bridge out_low=0 out_high=1.8 t_rise=2n t_fall=2n
.control
tran 5n 45u 0 1n
let code = (v(d0) + 2*v(d1) + 4*v(d2) + 8*v(d3))/1.8
meas tran code_a find code at=11.5u
meas tran vout_a find v(vout) at=11.5u
meas tran code_b find code at=17.5u
meas tran vout_b find v(vout) at=17.5u
meas tran vmin_burst min v(vout) from=18u to=20u
meas tran code_c find code at=44u
meas tran vout_c find v(vout) at=44u
let dip_mV = (vout_b - vmin_burst)*1000
echo AMS req7: code=$&code_a vout=$&vout_a
echo AMS hint: code=$&code_b vout=$&vout_b  burst dip_mV=$&dip_mV
echo AMS req4: code=$&code_c vout=$&vout_c
write tb_ams_dvs_ctrl.raw v(vout) v(xchip.xldo.vref) code v(ben) v(settled) v(ld0)
if $?batchmode
else
plot v(vout) v(xchip.xldo.vref) title 'AMS: VOUT and VREF'
plot code title 'dvs_ctrl code_out'
plot v(ben) v(settled)+2 v(ld0)+4 title 'boost_en / settled / load'
end
.endc"}
