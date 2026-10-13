v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tr_boost -- L1 transient boost: UB (VOUT dip -> AC-coupled PMOS sensor -> dead zone -> x20 pull-down of X) + OB (dynamic bleeder, AC-coupled)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=ibn}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=ben}
C {devices/iopin.sym} -60 -300 0 0 {name=p2 lab=i_bu}
C {devices/iopin.sym} -60 -280 0 0 {name=p3 lab=i_dz}
C {devices/iopin.sym} -60 -260 0 0 {name=p4 lab=x}
C {devices/iopin.sym} -60 -240 0 0 {name=p5 lab=vin}
C {devices/iopin.sym} -60 -220 0 0 {name=p6 lab=vout}
C {devices/iopin.sym} -60 -200 0 0 {name=p7 lab=vss}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 0 -150 0 0 {name=MPB0
L=0.5
W=40
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
N 20 -180 20 -200 {lab=vin}
C {devices/lab_pin.sym} 20 -200 1 1 {name=l8 sig_type=std_logic lab=vin}
N -20 -150 -40 -150 {lab=i_bu}
C {devices/lab_pin.sym} -40 -150 0 0 {name=l9 sig_type=std_logic lab=i_bu}
N 20 -120 20 -100 {lab=i_bu}
C {devices/lab_pin.sym} 20 -100 3 1 {name=l10 sig_type=std_logic lab=i_bu}
N 20 -150 40 -150 {lab=vin}
C {devices/lab_pin.sym} 40 -150 0 1 {name=l11 sig_type=std_logic lab=vin}
C {devices/res.sym} 200 -150 0 0 {name=Rbu value="1Meg" m=1}
N 200 -180 200 -200 {lab=i_bu}
C {devices/lab_pin.sym} 200 -200 1 1 {name=l12 sig_type=std_logic lab=i_bu}
N 200 -120 200 -100 {lab=gsu}
C {devices/lab_pin.sym} 200 -100 3 1 {name=l13 sig_type=std_logic lab=gsu}
C {devices/capa.sym} 300 -150 0 0 {name=Cbu value="0.5p" m=1}
N 300 -180 300 -200 {lab=vout}
C {devices/lab_pin.sym} 300 -200 1 1 {name=l14 sig_type=std_logic lab=vout}
N 300 -120 300 -100 {lab=gsu}
C {devices/lab_pin.sym} 300 -100 3 1 {name=l15 sig_type=std_logic lab=gsu}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 500 -150 0 0 {name=MPB1
L=0.5
W=20
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
N 520 -180 520 -200 {lab=vin}
C {devices/lab_pin.sym} 520 -200 1 1 {name=l16 sig_type=std_logic lab=vin}
N 480 -150 460 -150 {lab=gsu}
C {devices/lab_pin.sym} 460 -150 0 0 {name=l17 sig_type=std_logic lab=gsu}
N 520 -120 520 -100 {lab=i_dz}
C {devices/lab_pin.sym} 520 -100 3 1 {name=l18 sig_type=std_logic lab=i_dz}
N 520 -150 540 -150 {lab=vin}
C {devices/lab_pin.sym} 540 -150 0 1 {name=l19 sig_type=std_logic lab=vin}
C {sky130_fd_pr/nfet_01v8.sym} 500 100 0 0 {name=MNB0
L=0.5
W=2
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 520 70 520 50 {lab=i_dz}
C {devices/lab_pin.sym} 520 50 1 1 {name=l20 sig_type=std_logic lab=i_dz}
N 480 100 460 100 {lab=i_dz}
C {devices/lab_pin.sym} 460 100 0 0 {name=l21 sig_type=std_logic lab=i_dz}
N 520 130 520 150 {lab=vss}
C {devices/lab_pin.sym} 520 150 3 1 {name=l22 sig_type=std_logic lab=vss}
N 520 100 540 100 {lab=vss}
C {devices/lab_pin.sym} 540 100 0 1 {name=l23 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 750 100 0 0 {name=MNB1
L=0.5
W=2
nf=1
mult=20
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 770 70 770 50 {lab=nsw}
C {devices/lab_pin.sym} 770 50 1 1 {name=l24 sig_type=std_logic lab=nsw}
N 730 100 710 100 {lab=i_dz}
C {devices/lab_pin.sym} 710 100 0 0 {name=l25 sig_type=std_logic lab=i_dz}
N 770 130 770 150 {lab=vss}
C {devices/lab_pin.sym} 770 150 3 1 {name=l26 sig_type=std_logic lab=vss}
N 770 100 790 100 {lab=vss}
C {devices/lab_pin.sym} 790 100 0 1 {name=l27 sig_type=std_logic lab=vss}
C {sky130_fd_pr/nfet_01v8.sym} 750 -100 0 0 {name=MSW
L=0.15
W=10
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 770 -130 770 -150 {lab=x}
C {devices/lab_pin.sym} 770 -150 1 1 {name=l28 sig_type=std_logic lab=x}
N 730 -100 710 -100 {lab=ben}
C {devices/lab_pin.sym} 710 -100 0 0 {name=l29 sig_type=std_logic lab=ben}
N 770 -70 770 -50 {lab=nsw}
C {devices/lab_pin.sym} 770 -50 3 1 {name=l30 sig_type=std_logic lab=nsw}
N 770 -100 790 -100 {lab=vss}
C {devices/lab_pin.sym} 790 -100 0 1 {name=l31 sig_type=std_logic lab=vss}
T {UB: MPB1 idles at 10 uA into a 20 uA dead-zone sink (i_dz) => pull-down off at rest; a VOUT dip lowers gsu, MPB1 current exceeds the sink and MNB1 (x20) discharges X} 0 230 0 0 0.25 0.25 {}
C {devices/res.sym} 1100 -150 0 0 {name=Rbo value="1Meg" m=1}
N 1100 -180 1100 -200 {lab=ibn}
C {devices/lab_pin.sym} 1100 -200 1 1 {name=l32 sig_type=std_logic lab=ibn}
N 1100 -120 1100 -100 {lab=gso}
C {devices/lab_pin.sym} 1100 -100 3 1 {name=l33 sig_type=std_logic lab=gso}
C {devices/capa.sym} 1200 -150 0 0 {name=Cbo value="0.5p" m=1}
N 1200 -180 1200 -200 {lab=vout}
C {devices/lab_pin.sym} 1200 -200 1 1 {name=l34 sig_type=std_logic lab=vout}
N 1200 -120 1200 -100 {lab=gso}
C {devices/lab_pin.sym} 1200 -100 3 1 {name=l35 sig_type=std_logic lab=gso}
C {sky130_fd_pr/nfet_01v8.sym} 1100 100 0 0 {name=MND
L=1
W=4
nf=1
mult=2
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 1120 70 1120 50 {lab=vout}
C {devices/lab_pin.sym} 1120 50 1 1 {name=l36 sig_type=std_logic lab=vout}
N 1080 100 1060 100 {lab=gso}
C {devices/lab_pin.sym} 1060 100 0 0 {name=l37 sig_type=std_logic lab=gso}
N 1120 130 1120 150 {lab=vss}
C {devices/lab_pin.sym} 1120 150 3 1 {name=l38 sig_type=std_logic lab=vss}
N 1120 100 1140 100 {lab=vss}
C {devices/lab_pin.sym} 1140 100 0 1 {name=l39 sig_type=std_logic lab=vss}
T {OB: MND = 40 uA minimum-load bleeder whose gate is AC-coupled to VOUT (overshoot => more sink)} 1000 230 0 0 0.25 0.25 {}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1500 -150 0 0 {name=MPDZ
L=0.5
W=40
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
N 1520 -180 1520 -200 {lab=vin}
C {devices/lab_pin.sym} 1520 -200 1 1 {name=l40 sig_type=std_logic lab=vin}
N 1480 -150 1460 -150 {lab=i_bu}
C {devices/lab_pin.sym} 1460 -150 0 0 {name=l41 sig_type=std_logic lab=i_bu}
N 1520 -120 1520 -100 {lab=ndo}
C {devices/lab_pin.sym} 1520 -100 3 1 {name=l42 sig_type=std_logic lab=ndo}
N 1520 -150 1540 -150 {lab=vin}
C {devices/lab_pin.sym} 1540 -150 0 1 {name=l43 sig_type=std_logic lab=vin}
C {sky130_fd_pr/nfet_01v8.sym} 1500 100 0 0 {name=MNS1
L=1
W=2
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
N 1520 70 1520 50 {lab=ndo}
C {devices/lab_pin.sym} 1520 50 1 1 {name=l44 sig_type=std_logic lab=ndo}
N 1480 100 1460 100 {lab=gso}
C {devices/lab_pin.sym} 1460 100 0 0 {name=l45 sig_type=std_logic lab=gso}
N 1520 130 1520 150 {lab=vss}
C {devices/lab_pin.sym} 1520 150 3 1 {name=l46 sig_type=std_logic lab=vss}
N 1520 100 1540 100 {lab=vss}
C {devices/lab_pin.sym} 1540 100 0 1 {name=l47 sig_type=std_logic lab=vss}
C {sky130_fd_pr/pfet_01v8.sym} 1750 -150 0 0 {name=MPO0
L=0.5
W=4
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
N 1770 -180 1770 -200 {lab=vin}
C {devices/lab_pin.sym} 1770 -200 1 1 {name=l48 sig_type=std_logic lab=vin}
N 1730 -150 1710 -150 {lab=ndo}
C {devices/lab_pin.sym} 1710 -150 0 0 {name=l49 sig_type=std_logic lab=ndo}
N 1770 -120 1770 -100 {lab=ndo}
C {devices/lab_pin.sym} 1770 -100 3 1 {name=l50 sig_type=std_logic lab=ndo}
N 1770 -150 1790 -150 {lab=vin}
C {devices/lab_pin.sym} 1790 -150 0 1 {name=l51 sig_type=std_logic lab=vin}
C {sky130_fd_pr/pfet_01v8.sym} 2000 -150 0 0 {name=MPO1
L=0.5
W=4
nf=1
mult=20
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
N 2020 -180 2020 -200 {lab=vin}
C {devices/lab_pin.sym} 2020 -200 1 1 {name=l52 sig_type=std_logic lab=vin}
N 1980 -150 1960 -150 {lab=ndo}
C {devices/lab_pin.sym} 1960 -150 0 0 {name=l53 sig_type=std_logic lab=ndo}
N 2020 -120 2020 -100 {lab=psw}
C {devices/lab_pin.sym} 2020 -100 3 1 {name=l54 sig_type=std_logic lab=psw}
N 2020 -150 2040 -150 {lab=vin}
C {devices/lab_pin.sym} 2040 -150 0 1 {name=l55 sig_type=std_logic lab=vin}
C {sky130_fd_pr/pfet_01v8.sym} 2000 100 0 0 {name=MPSW
L=0.15
W=20
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
N 2020 70 2020 50 {lab=psw}
C {devices/lab_pin.sym} 2020 50 1 1 {name=l56 sig_type=std_logic lab=psw}
N 1980 100 1960 100 {lab=benb}
C {devices/lab_pin.sym} 1960 100 0 0 {name=l57 sig_type=std_logic lab=benb}
N 2020 130 2020 150 {lab=x}
C {devices/lab_pin.sym} 2020 150 3 1 {name=l58 sig_type=std_logic lab=x}
N 2020 100 2040 100 {lab=vin}
C {devices/lab_pin.sym} 2040 100 0 1 {name=l59 sig_type=std_logic lab=vin}
C {onetops/inv.sym} 2300 0 0 0 {name=xinv}
N 2200 0 2180 0 {lab=ben}
C {devices/lab_pin.sym} 2180 0 0 0 {name=l60 sig_type=std_logic lab=ben}
N 2400 0 2420 0 {lab=benb}
C {devices/lab_pin.sym} 2420 0 0 1 {name=l61 sig_type=std_logic lab=benb}
N 2300 -50 2300 -70 {lab=vin}
C {devices/lab_pin.sym} 2300 -70 1 1 {name=l62 sig_type=std_logic lab=vin}
N 2300 50 2300 70 {lab=vss}
C {devices/lab_pin.sym} 2300 70 3 1 {name=l63 sig_type=std_logic lab=vss}
T {OBX: MNS1 idles at 10 uA against a 20 uA PMOS dead-zone source; a VOUT rise lifts gso, MNS1 exceeds it and MPO1 (x20) pulls X up (pass device off fast)} 1500 230 0 0 0.25 0.25 {}
