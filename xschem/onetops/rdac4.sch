v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {rdac4 -- L1 4-bit R-string DAC + TG mux tree: out = vlo + code*(vhi-vlo)/16 (DVS reference)} -300 -380 0 0 0.6 0.6 {}
C {devices/ipin.sym} -300 -300 0 0 {name=p0 lab=d0}
C {devices/ipin.sym} -300 -280 0 0 {name=p1 lab=d1}
C {devices/ipin.sym} -300 -260 0 0 {name=p2 lab=d2}
C {devices/ipin.sym} -300 -240 0 0 {name=p3 lab=d3}
C {devices/opin.sym} -180 -300 0 0 {name=p4 lab=out}
C {devices/iopin.sym} -60 -300 0 0 {name=p5 lab=vhi}
C {devices/iopin.sym} -60 -280 0 0 {name=p6 lab=vlo}
C {devices/iopin.sym} -60 -260 0 0 {name=p7 lab=vdd}
C {devices/iopin.sym} -60 -240 0 0 {name=p8 lab=vss}
C {devices/res.sym} 0 0 0 0 {name=R0 value="10k" m=1}
N 0 -30 0 -50 {lab=t1}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l9 sig_type=std_logic lab=t1}
N 0 30 0 50 {lab=vlo}
C {devices/lab_pin.sym} 0 50 3 1 {name=l10 sig_type=std_logic lab=vlo}
C {devices/res.sym} 0 -150 0 0 {name=R1 value="10k" m=1}
N 0 -180 0 -200 {lab=t2}
C {devices/lab_pin.sym} 0 -200 1 1 {name=l11 sig_type=std_logic lab=t2}
N 0 -120 0 -100 {lab=t1}
C {devices/lab_pin.sym} 0 -100 3 1 {name=l12 sig_type=std_logic lab=t1}
C {devices/res.sym} 0 -300 0 0 {name=R2 value="10k" m=1}
N 0 -330 0 -350 {lab=t3}
C {devices/lab_pin.sym} 0 -350 1 1 {name=l13 sig_type=std_logic lab=t3}
N 0 -270 0 -250 {lab=t2}
C {devices/lab_pin.sym} 0 -250 3 1 {name=l14 sig_type=std_logic lab=t2}
C {devices/res.sym} 0 -450 0 0 {name=R3 value="10k" m=1}
N 0 -480 0 -500 {lab=t4}
C {devices/lab_pin.sym} 0 -500 1 1 {name=l15 sig_type=std_logic lab=t4}
N 0 -420 0 -400 {lab=t3}
C {devices/lab_pin.sym} 0 -400 3 1 {name=l16 sig_type=std_logic lab=t3}
C {devices/res.sym} 0 -600 0 0 {name=R4 value="10k" m=1}
N 0 -630 0 -650 {lab=t5}
C {devices/lab_pin.sym} 0 -650 1 1 {name=l17 sig_type=std_logic lab=t5}
N 0 -570 0 -550 {lab=t4}
C {devices/lab_pin.sym} 0 -550 3 1 {name=l18 sig_type=std_logic lab=t4}
C {devices/res.sym} 0 -750 0 0 {name=R5 value="10k" m=1}
N 0 -780 0 -800 {lab=t6}
C {devices/lab_pin.sym} 0 -800 1 1 {name=l19 sig_type=std_logic lab=t6}
N 0 -720 0 -700 {lab=t5}
C {devices/lab_pin.sym} 0 -700 3 1 {name=l20 sig_type=std_logic lab=t5}
C {devices/res.sym} 0 -900 0 0 {name=R6 value="10k" m=1}
N 0 -930 0 -950 {lab=t7}
C {devices/lab_pin.sym} 0 -950 1 1 {name=l21 sig_type=std_logic lab=t7}
N 0 -870 0 -850 {lab=t6}
C {devices/lab_pin.sym} 0 -850 3 1 {name=l22 sig_type=std_logic lab=t6}
C {devices/res.sym} 0 -1050 0 0 {name=R7 value="10k" m=1}
N 0 -1080 0 -1100 {lab=t8}
C {devices/lab_pin.sym} 0 -1100 1 1 {name=l23 sig_type=std_logic lab=t8}
N 0 -1020 0 -1000 {lab=t7}
C {devices/lab_pin.sym} 0 -1000 3 1 {name=l24 sig_type=std_logic lab=t7}
C {devices/res.sym} 0 -1200 0 0 {name=R8 value="10k" m=1}
N 0 -1230 0 -1250 {lab=t9}
C {devices/lab_pin.sym} 0 -1250 1 1 {name=l25 sig_type=std_logic lab=t9}
N 0 -1170 0 -1150 {lab=t8}
C {devices/lab_pin.sym} 0 -1150 3 1 {name=l26 sig_type=std_logic lab=t8}
C {devices/res.sym} 0 -1350 0 0 {name=R9 value="10k" m=1}
N 0 -1380 0 -1400 {lab=t10}
C {devices/lab_pin.sym} 0 -1400 1 1 {name=l27 sig_type=std_logic lab=t10}
N 0 -1320 0 -1300 {lab=t9}
C {devices/lab_pin.sym} 0 -1300 3 1 {name=l28 sig_type=std_logic lab=t9}
C {devices/res.sym} 0 -1500 0 0 {name=R10 value="10k" m=1}
N 0 -1530 0 -1550 {lab=t11}
C {devices/lab_pin.sym} 0 -1550 1 1 {name=l29 sig_type=std_logic lab=t11}
N 0 -1470 0 -1450 {lab=t10}
C {devices/lab_pin.sym} 0 -1450 3 1 {name=l30 sig_type=std_logic lab=t10}
C {devices/res.sym} 0 -1650 0 0 {name=R11 value="10k" m=1}
N 0 -1680 0 -1700 {lab=t12}
C {devices/lab_pin.sym} 0 -1700 1 1 {name=l31 sig_type=std_logic lab=t12}
N 0 -1620 0 -1600 {lab=t11}
C {devices/lab_pin.sym} 0 -1600 3 1 {name=l32 sig_type=std_logic lab=t11}
C {devices/res.sym} 0 -1800 0 0 {name=R12 value="10k" m=1}
N 0 -1830 0 -1850 {lab=t13}
C {devices/lab_pin.sym} 0 -1850 1 1 {name=l33 sig_type=std_logic lab=t13}
N 0 -1770 0 -1750 {lab=t12}
C {devices/lab_pin.sym} 0 -1750 3 1 {name=l34 sig_type=std_logic lab=t12}
C {devices/res.sym} 0 -1950 0 0 {name=R13 value="10k" m=1}
N 0 -1980 0 -2000 {lab=t14}
C {devices/lab_pin.sym} 0 -2000 1 1 {name=l35 sig_type=std_logic lab=t14}
N 0 -1920 0 -1900 {lab=t13}
C {devices/lab_pin.sym} 0 -1900 3 1 {name=l36 sig_type=std_logic lab=t13}
C {devices/res.sym} 0 -2100 0 0 {name=R14 value="10k" m=1}
N 0 -2130 0 -2150 {lab=t15}
C {devices/lab_pin.sym} 0 -2150 1 1 {name=l37 sig_type=std_logic lab=t15}
N 0 -2070 0 -2050 {lab=t14}
C {devices/lab_pin.sym} 0 -2050 3 1 {name=l38 sig_type=std_logic lab=t14}
C {devices/res.sym} 0 -2250 0 0 {name=R15 value="10k" m=1}
N 0 -2280 0 -2300 {lab=vhi}
C {devices/lab_pin.sym} 0 -2300 1 1 {name=l39 sig_type=std_logic lab=vhi}
N 0 -2220 0 -2200 {lab=t15}
C {devices/lab_pin.sym} 0 -2200 3 1 {name=l40 sig_type=std_logic lab=t15}
T {tap t0 = vlo, t16 = vhi (unused); code k selects t_k} -200 -2500 0 0 0.3 0.3 {}
C {onetops/inv.sym} 300 -2300 0 0 {name=xinv0}
N 200 -2300 180 -2300 {lab=d0}
C {devices/lab_pin.sym} 180 -2300 0 0 {name=l41 sig_type=std_logic lab=d0}
N 400 -2300 420 -2300 {lab=d0b}
C {devices/lab_pin.sym} 420 -2300 0 1 {name=l42 sig_type=std_logic lab=d0b}
N 300 -2350 300 -2370 {lab=vdd}
C {devices/lab_pin.sym} 300 -2370 1 1 {name=l43 sig_type=std_logic lab=vdd}
N 300 -2250 300 -2230 {lab=vss}
C {devices/lab_pin.sym} 300 -2230 3 1 {name=l44 sig_type=std_logic lab=vss}
C {onetops/inv.sym} 300 -2100 0 0 {name=xinv1}
N 200 -2100 180 -2100 {lab=d1}
C {devices/lab_pin.sym} 180 -2100 0 0 {name=l45 sig_type=std_logic lab=d1}
N 400 -2100 420 -2100 {lab=d1b}
C {devices/lab_pin.sym} 420 -2100 0 1 {name=l46 sig_type=std_logic lab=d1b}
N 300 -2150 300 -2170 {lab=vdd}
C {devices/lab_pin.sym} 300 -2170 1 1 {name=l47 sig_type=std_logic lab=vdd}
N 300 -2050 300 -2030 {lab=vss}
C {devices/lab_pin.sym} 300 -2030 3 1 {name=l48 sig_type=std_logic lab=vss}
C {onetops/inv.sym} 300 -1900 0 0 {name=xinv2}
N 200 -1900 180 -1900 {lab=d2}
C {devices/lab_pin.sym} 180 -1900 0 0 {name=l49 sig_type=std_logic lab=d2}
N 400 -1900 420 -1900 {lab=d2b}
C {devices/lab_pin.sym} 420 -1900 0 1 {name=l50 sig_type=std_logic lab=d2b}
N 300 -1950 300 -1970 {lab=vdd}
C {devices/lab_pin.sym} 300 -1970 1 1 {name=l51 sig_type=std_logic lab=vdd}
N 300 -1850 300 -1830 {lab=vss}
C {devices/lab_pin.sym} 300 -1830 3 1 {name=l52 sig_type=std_logic lab=vss}
C {onetops/inv.sym} 300 -1700 0 0 {name=xinv3}
N 200 -1700 180 -1700 {lab=d3}
C {devices/lab_pin.sym} 180 -1700 0 0 {name=l53 sig_type=std_logic lab=d3}
N 400 -1700 420 -1700 {lab=d3b}
C {devices/lab_pin.sym} 420 -1700 0 1 {name=l54 sig_type=std_logic lab=d3b}
N 300 -1750 300 -1770 {lab=vdd}
C {devices/lab_pin.sym} 300 -1770 1 1 {name=l55 sig_type=std_logic lab=vdd}
N 300 -1650 300 -1630 {lab=vss}
C {devices/lab_pin.sym} 300 -1630 3 1 {name=l56 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 700 -2300 0 0 {name=xm0_0}
N 600 -2370 580 -2370 {lab=vlo}
C {devices/lab_pin.sym} 580 -2370 0 0 {name=l57 sig_type=std_logic lab=vlo}
N 600 -2330 580 -2330 {lab=t1}
C {devices/lab_pin.sym} 580 -2330 0 0 {name=l58 sig_type=std_logic lab=t1}
N 600 -2290 580 -2290 {lab=d0}
C {devices/lab_pin.sym} 580 -2290 0 0 {name=l59 sig_type=std_logic lab=d0}
N 600 -2250 580 -2250 {lab=d0b}
C {devices/lab_pin.sym} 580 -2250 0 0 {name=l60 sig_type=std_logic lab=d0b}
N 800 -2300 820 -2300 {lab=n1_0}
C {devices/lab_pin.sym} 820 -2300 0 1 {name=l61 sig_type=std_logic lab=n1_0}
N 700 -2410 700 -2430 {lab=vdd}
C {devices/lab_pin.sym} 700 -2430 1 1 {name=l62 sig_type=std_logic lab=vdd}
N 700 -2190 700 -2170 {lab=vss}
C {devices/lab_pin.sym} 700 -2170 3 1 {name=l63 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 700 -2000 0 0 {name=xm0_1}
N 600 -2070 580 -2070 {lab=t2}
C {devices/lab_pin.sym} 580 -2070 0 0 {name=l64 sig_type=std_logic lab=t2}
N 600 -2030 580 -2030 {lab=t3}
C {devices/lab_pin.sym} 580 -2030 0 0 {name=l65 sig_type=std_logic lab=t3}
N 600 -1990 580 -1990 {lab=d0}
C {devices/lab_pin.sym} 580 -1990 0 0 {name=l66 sig_type=std_logic lab=d0}
N 600 -1950 580 -1950 {lab=d0b}
C {devices/lab_pin.sym} 580 -1950 0 0 {name=l67 sig_type=std_logic lab=d0b}
N 800 -2000 820 -2000 {lab=n1_1}
C {devices/lab_pin.sym} 820 -2000 0 1 {name=l68 sig_type=std_logic lab=n1_1}
N 700 -2110 700 -2130 {lab=vdd}
C {devices/lab_pin.sym} 700 -2130 1 1 {name=l69 sig_type=std_logic lab=vdd}
N 700 -1890 700 -1870 {lab=vss}
C {devices/lab_pin.sym} 700 -1870 3 1 {name=l70 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 700 -1700 0 0 {name=xm0_2}
N 600 -1770 580 -1770 {lab=t4}
C {devices/lab_pin.sym} 580 -1770 0 0 {name=l71 sig_type=std_logic lab=t4}
N 600 -1730 580 -1730 {lab=t5}
C {devices/lab_pin.sym} 580 -1730 0 0 {name=l72 sig_type=std_logic lab=t5}
N 600 -1690 580 -1690 {lab=d0}
C {devices/lab_pin.sym} 580 -1690 0 0 {name=l73 sig_type=std_logic lab=d0}
N 600 -1650 580 -1650 {lab=d0b}
C {devices/lab_pin.sym} 580 -1650 0 0 {name=l74 sig_type=std_logic lab=d0b}
N 800 -1700 820 -1700 {lab=n1_2}
C {devices/lab_pin.sym} 820 -1700 0 1 {name=l75 sig_type=std_logic lab=n1_2}
N 700 -1810 700 -1830 {lab=vdd}
C {devices/lab_pin.sym} 700 -1830 1 1 {name=l76 sig_type=std_logic lab=vdd}
N 700 -1590 700 -1570 {lab=vss}
C {devices/lab_pin.sym} 700 -1570 3 1 {name=l77 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 700 -1400 0 0 {name=xm0_3}
N 600 -1470 580 -1470 {lab=t6}
C {devices/lab_pin.sym} 580 -1470 0 0 {name=l78 sig_type=std_logic lab=t6}
N 600 -1430 580 -1430 {lab=t7}
C {devices/lab_pin.sym} 580 -1430 0 0 {name=l79 sig_type=std_logic lab=t7}
N 600 -1390 580 -1390 {lab=d0}
C {devices/lab_pin.sym} 580 -1390 0 0 {name=l80 sig_type=std_logic lab=d0}
N 600 -1350 580 -1350 {lab=d0b}
C {devices/lab_pin.sym} 580 -1350 0 0 {name=l81 sig_type=std_logic lab=d0b}
N 800 -1400 820 -1400 {lab=n1_3}
C {devices/lab_pin.sym} 820 -1400 0 1 {name=l82 sig_type=std_logic lab=n1_3}
N 700 -1510 700 -1530 {lab=vdd}
C {devices/lab_pin.sym} 700 -1530 1 1 {name=l83 sig_type=std_logic lab=vdd}
N 700 -1290 700 -1270 {lab=vss}
C {devices/lab_pin.sym} 700 -1270 3 1 {name=l84 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 700 -1100 0 0 {name=xm0_4}
N 600 -1170 580 -1170 {lab=t8}
C {devices/lab_pin.sym} 580 -1170 0 0 {name=l85 sig_type=std_logic lab=t8}
N 600 -1130 580 -1130 {lab=t9}
C {devices/lab_pin.sym} 580 -1130 0 0 {name=l86 sig_type=std_logic lab=t9}
N 600 -1090 580 -1090 {lab=d0}
C {devices/lab_pin.sym} 580 -1090 0 0 {name=l87 sig_type=std_logic lab=d0}
N 600 -1050 580 -1050 {lab=d0b}
C {devices/lab_pin.sym} 580 -1050 0 0 {name=l88 sig_type=std_logic lab=d0b}
N 800 -1100 820 -1100 {lab=n1_4}
C {devices/lab_pin.sym} 820 -1100 0 1 {name=l89 sig_type=std_logic lab=n1_4}
N 700 -1210 700 -1230 {lab=vdd}
C {devices/lab_pin.sym} 700 -1230 1 1 {name=l90 sig_type=std_logic lab=vdd}
N 700 -990 700 -970 {lab=vss}
C {devices/lab_pin.sym} 700 -970 3 1 {name=l91 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 700 -800 0 0 {name=xm0_5}
N 600 -870 580 -870 {lab=t10}
C {devices/lab_pin.sym} 580 -870 0 0 {name=l92 sig_type=std_logic lab=t10}
N 600 -830 580 -830 {lab=t11}
C {devices/lab_pin.sym} 580 -830 0 0 {name=l93 sig_type=std_logic lab=t11}
N 600 -790 580 -790 {lab=d0}
C {devices/lab_pin.sym} 580 -790 0 0 {name=l94 sig_type=std_logic lab=d0}
N 600 -750 580 -750 {lab=d0b}
C {devices/lab_pin.sym} 580 -750 0 0 {name=l95 sig_type=std_logic lab=d0b}
N 800 -800 820 -800 {lab=n1_5}
C {devices/lab_pin.sym} 820 -800 0 1 {name=l96 sig_type=std_logic lab=n1_5}
N 700 -910 700 -930 {lab=vdd}
C {devices/lab_pin.sym} 700 -930 1 1 {name=l97 sig_type=std_logic lab=vdd}
N 700 -690 700 -670 {lab=vss}
C {devices/lab_pin.sym} 700 -670 3 1 {name=l98 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 700 -500 0 0 {name=xm0_6}
N 600 -570 580 -570 {lab=t12}
C {devices/lab_pin.sym} 580 -570 0 0 {name=l99 sig_type=std_logic lab=t12}
N 600 -530 580 -530 {lab=t13}
C {devices/lab_pin.sym} 580 -530 0 0 {name=l100 sig_type=std_logic lab=t13}
N 600 -490 580 -490 {lab=d0}
C {devices/lab_pin.sym} 580 -490 0 0 {name=l101 sig_type=std_logic lab=d0}
N 600 -450 580 -450 {lab=d0b}
C {devices/lab_pin.sym} 580 -450 0 0 {name=l102 sig_type=std_logic lab=d0b}
N 800 -500 820 -500 {lab=n1_6}
C {devices/lab_pin.sym} 820 -500 0 1 {name=l103 sig_type=std_logic lab=n1_6}
N 700 -610 700 -630 {lab=vdd}
C {devices/lab_pin.sym} 700 -630 1 1 {name=l104 sig_type=std_logic lab=vdd}
N 700 -390 700 -370 {lab=vss}
C {devices/lab_pin.sym} 700 -370 3 1 {name=l105 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 700 -200 0 0 {name=xm0_7}
N 600 -270 580 -270 {lab=t14}
C {devices/lab_pin.sym} 580 -270 0 0 {name=l106 sig_type=std_logic lab=t14}
N 600 -230 580 -230 {lab=t15}
C {devices/lab_pin.sym} 580 -230 0 0 {name=l107 sig_type=std_logic lab=t15}
N 600 -190 580 -190 {lab=d0}
C {devices/lab_pin.sym} 580 -190 0 0 {name=l108 sig_type=std_logic lab=d0}
N 600 -150 580 -150 {lab=d0b}
C {devices/lab_pin.sym} 580 -150 0 0 {name=l109 sig_type=std_logic lab=d0b}
N 800 -200 820 -200 {lab=n1_7}
C {devices/lab_pin.sym} 820 -200 0 1 {name=l110 sig_type=std_logic lab=n1_7}
N 700 -310 700 -330 {lab=vdd}
C {devices/lab_pin.sym} 700 -330 1 1 {name=l111 sig_type=std_logic lab=vdd}
N 700 -90 700 -70 {lab=vss}
C {devices/lab_pin.sym} 700 -70 3 1 {name=l112 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 1200 -2300 0 0 {name=xm1_0}
N 1100 -2370 1080 -2370 {lab=n1_0}
C {devices/lab_pin.sym} 1080 -2370 0 0 {name=l113 sig_type=std_logic lab=n1_0}
N 1100 -2330 1080 -2330 {lab=n1_1}
C {devices/lab_pin.sym} 1080 -2330 0 0 {name=l114 sig_type=std_logic lab=n1_1}
N 1100 -2290 1080 -2290 {lab=d1}
C {devices/lab_pin.sym} 1080 -2290 0 0 {name=l115 sig_type=std_logic lab=d1}
N 1100 -2250 1080 -2250 {lab=d1b}
C {devices/lab_pin.sym} 1080 -2250 0 0 {name=l116 sig_type=std_logic lab=d1b}
N 1300 -2300 1320 -2300 {lab=n2_0}
C {devices/lab_pin.sym} 1320 -2300 0 1 {name=l117 sig_type=std_logic lab=n2_0}
N 1200 -2410 1200 -2430 {lab=vdd}
C {devices/lab_pin.sym} 1200 -2430 1 1 {name=l118 sig_type=std_logic lab=vdd}
N 1200 -2190 1200 -2170 {lab=vss}
C {devices/lab_pin.sym} 1200 -2170 3 1 {name=l119 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 1200 -2000 0 0 {name=xm1_1}
N 1100 -2070 1080 -2070 {lab=n1_2}
C {devices/lab_pin.sym} 1080 -2070 0 0 {name=l120 sig_type=std_logic lab=n1_2}
N 1100 -2030 1080 -2030 {lab=n1_3}
C {devices/lab_pin.sym} 1080 -2030 0 0 {name=l121 sig_type=std_logic lab=n1_3}
N 1100 -1990 1080 -1990 {lab=d1}
C {devices/lab_pin.sym} 1080 -1990 0 0 {name=l122 sig_type=std_logic lab=d1}
N 1100 -1950 1080 -1950 {lab=d1b}
C {devices/lab_pin.sym} 1080 -1950 0 0 {name=l123 sig_type=std_logic lab=d1b}
N 1300 -2000 1320 -2000 {lab=n2_1}
C {devices/lab_pin.sym} 1320 -2000 0 1 {name=l124 sig_type=std_logic lab=n2_1}
N 1200 -2110 1200 -2130 {lab=vdd}
C {devices/lab_pin.sym} 1200 -2130 1 1 {name=l125 sig_type=std_logic lab=vdd}
N 1200 -1890 1200 -1870 {lab=vss}
C {devices/lab_pin.sym} 1200 -1870 3 1 {name=l126 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 1200 -1700 0 0 {name=xm1_2}
N 1100 -1770 1080 -1770 {lab=n1_4}
C {devices/lab_pin.sym} 1080 -1770 0 0 {name=l127 sig_type=std_logic lab=n1_4}
N 1100 -1730 1080 -1730 {lab=n1_5}
C {devices/lab_pin.sym} 1080 -1730 0 0 {name=l128 sig_type=std_logic lab=n1_5}
N 1100 -1690 1080 -1690 {lab=d1}
C {devices/lab_pin.sym} 1080 -1690 0 0 {name=l129 sig_type=std_logic lab=d1}
N 1100 -1650 1080 -1650 {lab=d1b}
C {devices/lab_pin.sym} 1080 -1650 0 0 {name=l130 sig_type=std_logic lab=d1b}
N 1300 -1700 1320 -1700 {lab=n2_2}
C {devices/lab_pin.sym} 1320 -1700 0 1 {name=l131 sig_type=std_logic lab=n2_2}
N 1200 -1810 1200 -1830 {lab=vdd}
C {devices/lab_pin.sym} 1200 -1830 1 1 {name=l132 sig_type=std_logic lab=vdd}
N 1200 -1590 1200 -1570 {lab=vss}
C {devices/lab_pin.sym} 1200 -1570 3 1 {name=l133 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 1200 -1400 0 0 {name=xm1_3}
N 1100 -1470 1080 -1470 {lab=n1_6}
C {devices/lab_pin.sym} 1080 -1470 0 0 {name=l134 sig_type=std_logic lab=n1_6}
N 1100 -1430 1080 -1430 {lab=n1_7}
C {devices/lab_pin.sym} 1080 -1430 0 0 {name=l135 sig_type=std_logic lab=n1_7}
N 1100 -1390 1080 -1390 {lab=d1}
C {devices/lab_pin.sym} 1080 -1390 0 0 {name=l136 sig_type=std_logic lab=d1}
N 1100 -1350 1080 -1350 {lab=d1b}
C {devices/lab_pin.sym} 1080 -1350 0 0 {name=l137 sig_type=std_logic lab=d1b}
N 1300 -1400 1320 -1400 {lab=n2_3}
C {devices/lab_pin.sym} 1320 -1400 0 1 {name=l138 sig_type=std_logic lab=n2_3}
N 1200 -1510 1200 -1530 {lab=vdd}
C {devices/lab_pin.sym} 1200 -1530 1 1 {name=l139 sig_type=std_logic lab=vdd}
N 1200 -1290 1200 -1270 {lab=vss}
C {devices/lab_pin.sym} 1200 -1270 3 1 {name=l140 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 1700 -2300 0 0 {name=xm2_0}
N 1600 -2370 1580 -2370 {lab=n2_0}
C {devices/lab_pin.sym} 1580 -2370 0 0 {name=l141 sig_type=std_logic lab=n2_0}
N 1600 -2330 1580 -2330 {lab=n2_1}
C {devices/lab_pin.sym} 1580 -2330 0 0 {name=l142 sig_type=std_logic lab=n2_1}
N 1600 -2290 1580 -2290 {lab=d2}
C {devices/lab_pin.sym} 1580 -2290 0 0 {name=l143 sig_type=std_logic lab=d2}
N 1600 -2250 1580 -2250 {lab=d2b}
C {devices/lab_pin.sym} 1580 -2250 0 0 {name=l144 sig_type=std_logic lab=d2b}
N 1800 -2300 1820 -2300 {lab=n3_0}
C {devices/lab_pin.sym} 1820 -2300 0 1 {name=l145 sig_type=std_logic lab=n3_0}
N 1700 -2410 1700 -2430 {lab=vdd}
C {devices/lab_pin.sym} 1700 -2430 1 1 {name=l146 sig_type=std_logic lab=vdd}
N 1700 -2190 1700 -2170 {lab=vss}
C {devices/lab_pin.sym} 1700 -2170 3 1 {name=l147 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 1700 -2000 0 0 {name=xm2_1}
N 1600 -2070 1580 -2070 {lab=n2_2}
C {devices/lab_pin.sym} 1580 -2070 0 0 {name=l148 sig_type=std_logic lab=n2_2}
N 1600 -2030 1580 -2030 {lab=n2_3}
C {devices/lab_pin.sym} 1580 -2030 0 0 {name=l149 sig_type=std_logic lab=n2_3}
N 1600 -1990 1580 -1990 {lab=d2}
C {devices/lab_pin.sym} 1580 -1990 0 0 {name=l150 sig_type=std_logic lab=d2}
N 1600 -1950 1580 -1950 {lab=d2b}
C {devices/lab_pin.sym} 1580 -1950 0 0 {name=l151 sig_type=std_logic lab=d2b}
N 1800 -2000 1820 -2000 {lab=n3_1}
C {devices/lab_pin.sym} 1820 -2000 0 1 {name=l152 sig_type=std_logic lab=n3_1}
N 1700 -2110 1700 -2130 {lab=vdd}
C {devices/lab_pin.sym} 1700 -2130 1 1 {name=l153 sig_type=std_logic lab=vdd}
N 1700 -1890 1700 -1870 {lab=vss}
C {devices/lab_pin.sym} 1700 -1870 3 1 {name=l154 sig_type=std_logic lab=vss}
C {onetops/mux2_tg.sym} 2200 -2300 0 0 {name=xm3_0}
N 2100 -2370 2080 -2370 {lab=n3_0}
C {devices/lab_pin.sym} 2080 -2370 0 0 {name=l155 sig_type=std_logic lab=n3_0}
N 2100 -2330 2080 -2330 {lab=n3_1}
C {devices/lab_pin.sym} 2080 -2330 0 0 {name=l156 sig_type=std_logic lab=n3_1}
N 2100 -2290 2080 -2290 {lab=d3}
C {devices/lab_pin.sym} 2080 -2290 0 0 {name=l157 sig_type=std_logic lab=d3}
N 2100 -2250 2080 -2250 {lab=d3b}
C {devices/lab_pin.sym} 2080 -2250 0 0 {name=l158 sig_type=std_logic lab=d3b}
N 2300 -2300 2320 -2300 {lab=out}
C {devices/lab_pin.sym} 2320 -2300 0 1 {name=l159 sig_type=std_logic lab=out}
N 2200 -2410 2200 -2430 {lab=vdd}
C {devices/lab_pin.sym} 2200 -2430 1 1 {name=l160 sig_type=std_logic lab=vdd}
N 2200 -2190 2200 -2170 {lab=vss}
C {devices/lab_pin.sym} 2200 -2170 3 1 {name=l161 sig_type=std_logic lab=vss}
