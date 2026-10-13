v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {lg_probe -- L1 Tian loop-gain probe (Vbrk + on lin, Iinj into lin). ac 0 = transparent} -300 -380 0 0 0.6 0.6 {}
C {devices/iopin.sym} -60 -300 0 0 {name=p0 lab=drv}
C {devices/iopin.sym} -60 -280 0 0 {name=p1 lab=lin}
C {devices/vsource.sym} 0 0 0 0 {name=Vbrk value="dc 0 ac 0"}
N 0 -30 0 -50 {lab=lin}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l2 sig_type=std_logic lab=lin}
N 0 30 0 50 {lab=drv}
C {devices/lab_pin.sym} 0 50 3 1 {name=l3 sig_type=std_logic lab=drv}
C {devices/isource.sym} 200 0 0 0 {name=Iinj value="dc 0 ac 0"}
N 200 -30 200 -50 {lab=0}
C {devices/lab_pin.sym} 200 -50 1 1 {name=l4 sig_type=std_logic lab=0}
N 200 30 200 50 {lab=lin}
C {devices/lab_pin.sym} 200 50 3 1 {name=l5 sig_type=std_logic lab=lin}
T {Testbench: alter @v.<path>.vbrk[acmag] / @i.<path>.iinj[acmag] (see tb_ldo_core_ac)} 0 80 0 0 0.3 0.3 {}
