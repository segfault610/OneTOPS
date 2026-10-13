v {xschem version=3.4.8RC file_version=1.2 }

G {}
K {}
V {}
S {}
E {}
T {tb_ldo_core_ac -- L2: Tian loop gain (PM/UGF) and PSRR vs load} -300 -380 0 0 0.6 0.6 {}
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
C {devices/vsource.sym} 0 0 0 0 {name=Vref value="dc 1.2"}
N 0 -30 0 -50 {lab=vref}
C {devices/lab_pin.sym} 0 -50 1 1 {name=l4 sig_type=std_logic lab=vref}
N 0 30 0 50 {lab=0}
C {devices/lab_pin.sym} 0 50 3 1 {name=l5 sig_type=std_logic lab=0}
C {onetops/ldo_core.sym} 300 0 0 0 {name=xldo}
N 200 -30 180 -30 {lab=vref}
C {devices/lab_pin.sym} 180 -30 0 0 {name=l6 sig_type=std_logic lab=vref}
N 200 10 180 10 {lab=ibn}
C {devices/lab_pin.sym} 180 10 0 0 {name=l7 sig_type=std_logic lab=ibn}
N 400 0 420 0 {lab=vout}
C {devices/lab_pin.sym} 420 0 0 1 {name=l8 sig_type=std_logic lab=vout}
N 300 -70 300 -90 {lab=vin}
C {devices/lab_pin.sym} 300 -90 1 1 {name=l9 sig_type=std_logic lab=vin}
N 300 70 300 90 {lab=0}
C {devices/lab_pin.sym} 300 90 3 1 {name=l10 sig_type=std_logic lab=0}
C {devices/isource.sym} 600 0 0 0 {name=Il value="dc 1m"}
N 600 -30 600 -50 {lab=vout}
C {devices/lab_pin.sym} 600 -50 1 1 {name=l11 sig_type=std_logic lab=vout}
N 600 30 600 50 {lab=0}
C {devices/lab_pin.sym} 600 50 3 1 {name=l12 sig_type=std_logic lab=0}
C {devices/capa.sym} 700 0 0 0 {name=Cl value="20p" m=1}
N 700 -30 700 -50 {lab=vout}
C {devices/lab_pin.sym} 700 -50 1 1 {name=l13 sig_type=std_logic lab=vout}
N 700 30 700 50 {lab=0}
C {devices/lab_pin.sym} 700 50 3 1 {name=l14 sig_type=std_logic lab=0}
C {devices/code_shown.sym} -300 400 0 0 {name=MODELS only_toplevel=true value=".lib /usr/local/share/pdk/sky130A/libs.tech/combined/sky130.lib.spice tt
.temp 27
.option savecurrents"}
C {devices/code_shown.sym} 400 400 0 0 {name=NGSPICE only_toplevel=true value=".control
foreach il 10u 100u 1m 5m 10m
  alter il dc=$il
  alter @vin[acmag]=0
  alter @v.xldo.xprobe.vbrk[acmag]=1
  ac dec 20 10 10G
  let vx1 = v(xldo.xg)
  let iv1 = v.xldo.xprobe.vbrk#branch
  set p1 = $curplot
  alter @v.xldo.xprobe.vbrk[acmag]=0
  alter @i.xldo.xprobe.iinj[acmag]=1
  ac dec 20 10 10G
  let vx2 = v(xldo.xg)
  let iv2 = v.xldo.xprobe.vbrk#branch
  let vx1 = \{$p1\}.vx1
  let iv1 = \{$p1\}.iv1
  let lg = -1/(1-1/(2*(iv1*vx2-vx1*iv2)+vx1+iv2))
  let tdb = db(lg)
  let tph = 180/pi*cph(lg)
  meas ac t0 find tdb at=10
  meas ac ugf when tdb=0
  meas ac phu find tph at=ugf
  let pm = 180 + phu
  echo LG ILOAD=$il T0dB=$&t0 UGF=$&ugf PM=$&pm
  alter @i.xldo.xprobe.iinj[acmag]=0
  alter @vin[acmag]=1
  ac dec 20 10 10G
  meas ac ps1k find vdb(vout) at=1k
  meas ac ps1m find vdb(vout) at=1Meg
  echo PSRR ILOAD=$il 1k=$&ps1k 1M=$&ps1m
end
.endc"}
