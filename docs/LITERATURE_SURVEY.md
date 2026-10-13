# Literature Survey: Capacitorless FVF LDOs, Transient Enhancement, DVS for Edge-AI

Compiled 2026-10-14 from memory as a reading list. Entries marked **[verify]** are ones where
I'm less sure of the exact title, authors or year. Please check them when fetching (IEEE Xplore /
Google Scholar). Priority: ★★★ read first, ★★ important, ★ background.

For each paper, note: architecture, process, C_L, Iq, load range, ΔV/edge time, and the FOM
(below), so we can build the comparison table for our paper.

## 1. Foundations: LDO and FVF

| # | Pri | Reference | Why it matters to us |
|---|---|---|---|
| 1 | ★★★ | R. G. Carvajal, J. Ramírez-Angulo, A. J. López-Martín, A. Torralba, J. A. G. Galán, A. Carlosena, F. M. Chavero, "The flipped voltage follower: a useful cell for low-voltage low-power circuit design," *IEEE TCAS-I*, vol. 52, no. 7, pp. 1276–1291, Jul. 2005. | The FVF cell itself: impedance, headroom (our X-node clamp) |
| 2 | ★★★ | P. Hazucha, T. Karnik, B. A. Bloechel, C. Parsons, D. Finan, S. Borkar, "Area-efficient linear regulator with ultra-fast load regulation," *IEEE JSSC*, vol. 40, no. 4, pp. 933–940, Apr. 2005. | Classic on-chip FVF-based regulator (Intel, 90 nm), fast local regulation |
| 3 | ★★★ | T. Y. Man, K. N. Leung, C. Y. Leung, P. K. T. Mok, M. Chan, "Development of single-transistor-control LDO based on flipped voltage follower for SoC," *IEEE TCAS-I*, vol. 55, no. 5, pp. 1392–1401, Jun. 2008. | **Closest to our baseline**: single-transistor-control FVF LDO, stability and compensation |
| 4 | ★★ | G. A. Rincón-Mora, P. E. Allen, "A low-voltage, low quiescent current, low drop-out regulator," *IEEE JSSC*, vol. 33, no. 1, pp. 36–44, Jan. 1998. | Classic LDO design trade-offs (Iq vs. speed) |
| 5 | ★ | G. A. Rincón-Mora, *Analog IC Design with Low-Dropout Regulators*, McGraw-Hill, 2009 (2nd ed. 2014). | Textbook reference |
| 6 | ★ | J. Torres, M. El-Nozahi, A. Amer, S. Gopalraju, R. Abdullah, K. Entesari, E. Sánchez-Sinencio, "Low drop-out voltage regulators: capacitor-less architecture comparison," *IEEE Circuits and Systems Magazine*, vol. 14, no. 2, pp. 6–26, 2014. | Survey of OCL-LDO topologies, good for our related-work section |

## 2. Output-capacitorless (OCL) LDO stability and compensation

| # | Pri | Reference | Why |
|---|---|---|---|
| 7 | ★★★ | R. J. Milliken, J. Silva-Martínez, E. Sánchez-Sinencio, "Full on-chip CMOS low-dropout voltage regulator," *IEEE TCAS-I*, vol. 54, no. 9, pp. 1879–1890, Sep. 2007. | Canonical capacitorless LDO; differentiator-based fast path (like our UB) |
| 8 | ★★ | K. N. Leung, P. K. T. Mok, "A capacitor-free CMOS low-dropout regulator with damping-factor-control frequency compensation," *IEEE JSSC*, vol. 38, no. 10, pp. 1691–1702, Oct. 2003. | Compensation for wide load range without C_out |
| 9 | ★★ | S. K. Lau, P. K. T. Mok, K. N. Leung, "A low-dropout regulator for SoC with Q-reduction," *IEEE JSSC*, vol. 42, no. 3, pp. 658–664, Mar. 2007. | Light-load stability (our worst PM corner) |
| 10 | ★★ | J. Guo, K. N. Leung, "A 6-µW chip-area-efficient output-capacitorless LDO in 90-nm CMOS technology," *IEEE JSSC*, vol. 45, no. 9, pp. 1896–1905, Sep. 2010. | Very low Iq OCL-LDO, relevant to our Iq target |
| 11 | ★★ | M. Ho, K. N. Leung, K.-L. Mak, "A low-power fast-transient 90-nm low-dropout regulator with multiple small-gain stages," *IEEE JSSC*, vol. 45, no. 11, pp. 2466–2475, Nov. 2010. | Speed vs. power with multi-stage gain |
| 12 | ★ | M. Tian, V. Visvanathan, J. Hantgan, K. Kundert, "Striving for small-signal stability," *IEEE Circuits and Devices Magazine*, vol. 17, no. 1, pp. 31–41, Jan. 2001. | **The loop-gain method used in our `lg_probe`** |

## 3. Transient enhancement (our `tr_boost`)

| # | Pri | Reference | Why |
|---|---|---|---|
| 13 | ★★★ | P. Y. Or, K. N. Leung, "An output-capacitorless low-dropout regulator with direct voltage-spike detection," *IEEE JSSC*, vol. 45, no. 2, pp. 458–466, Feb. 2010. | **Capacitive spike detection driving the pass gate**, the closest prior art to our UB/OBX. Must cite and differentiate |
| 14 | ★★★ | E. N. Y. Ho, P. K. T. Mok, "A capacitor-less CMOS active feedback low-dropout regulator with slew-rate enhancement for portable on-chip application," *IEEE TCAS-II*, vol. 57, no. 2, pp. 80–84, Feb. 2010. | Slew-rate enhancement at the gate node |
| 15 | ★★ | Y.-I. Kim, S.-S. Lee, "A capacitorless LDO regulator with fast feedback technique and low-quiescent current error amplifier," *IEEE TCAS-II*, vol. 60, no. 6, pp. 326–330, Jun. 2013. **[verify]** | Fast feedback path + low-Iq EA |
| 16 | ★★ | S. Bu, K. N. Leung, Y. Lu, J. Guo, Y. Zheng, "A fully integrated low-dropout regulator with differentiator-based active zero compensation," *IEEE TCAS-I*, vol. 65, no. 10, 2018. **[verify]** | Differentiator in the loop: stability + transient |

## 4. Adaptive biasing / dynamic current (our next block)

| # | Pri | Reference | Why |
|---|---|---|---|
| 17 | ★★★ | C. Zhan, W.-H. Ki, "Output-capacitor-free adaptively biased low-dropout regulator for system-on-chips," *IEEE TCAS-I*, vol. 57, no. 5, pp. 1017–1028, May 2010. | Adaptive bias for an OCL-LDO; directly relevant to replacing our 100 µA bleeder |
| 18 | ★★★ | X. Ming, Q. Li, Z.-K. Zhou, B. Zhang, "An ultrafast adaptively biased capacitorless LDO with dynamic charging control," *IEEE TCAS-II*, vol. 59, no. 1, pp. 40–44, Jan. 2012. | Adaptive bias + dynamic charging of the pass gate |
| 19 | ★★ | Search: "FVF LDO adaptive bias light-load stability" (2015–2025, TCAS-I/II, JSSC). | Several recent FVF-specific adaptive-bias papers; please pull 3–4 recent ones |

## 5. PSRR (our weak spot: −31 dB)

| # | Pri | Reference | Why |
|---|---|---|---|
| 20 | ★★ | Y. Lu, Y. Wang, Q. Pan, W.-H. Ki, C. P. Yue, "A fully-integrated low-dropout regulator with full-spectrum power supply rejection," *IEEE TCAS-I*, vol. 62, no. 3, pp. 707–716, Mar. 2015. | PSR techniques for fully integrated LDOs |
| 21 | ★ | Search: "FVF LDO PSRR improvement replica / feed-forward ripple cancellation". | The FVF limit is PSRR ≈ 1/(g_mc·R_X); find the known fixes |

## 6. Digital / digitally assisted LDOs and DVS (our `dvs_ctrl`, workload hint)

| # | Pri | Reference | Why |
|---|---|---|---|
| 22 | ★★ | Y. Okuma, K. Ishida, Y. Ryu, X. Zhang, P.-H. Chen, K. Watanabe, M. Takamiya, T. Sakurai, "0.5-V input digital LDO with 98.7% current efficiency and 2.7-µA quiescent current in 65nm CMOS," *IEEE CICC*, 2010. | The original digital LDO; contrast with our analog + digital-assist approach |
| 23 | ★★ | S. B. Nasir, S. Gangopadhyay, A. Raychowdhury, "A 0.13 µm fully digital low-dropout regulator with adaptive control and reduced dynamic stability for ultra-wide dynamic range," *IEEE ISSCC*, 2015. **[verify]** | Adaptive control in digital LDOs |
| 24 | ★★ | Y.-H. Lee et al., "A low quiescent current asynchronous digital-LDO with PLL-modulated fast-DVS power management in 40 nm SoC for MIPS performance improvement," *IEEE JSSC*, vol. 48, no. 4, pp. 1018–1030, Apr. 2013. | Fast DVS with an LDO in an SoC |
| 25 | ★ | T. D. Burd, T. A. Pering, A. J. Stratakos, R. W. Brodersen, "A dynamic voltage scaled microprocessor system," *IEEE JSSC*, vol. 35, no. 11, pp. 1571–1580, Nov. 2000. | DVS background |
| 26 | ★★ | Search: "hybrid LDO analog digital assisted fast transient" and "predictive / feed-forward LDO load-current information" (2018–2025). | Closest to our *workload-hint* idea: the proposal says this is not new on its own, so we must cite it |

## 7. Edge-AI power delivery context

| # | Pri | Reference | Why |
|---|---|---|---|
| 27 | ★★ | Search: "distributed LDO accelerator power domain", "per-core LDO voltage droop AI accelerator" (ISSCC / JSSC 2019–2025). | Motivation: di/dt and droop in AI accelerators |
| 28 | ★ | Search: "workload-aware DVFS edge AI inference" (DAC / ISLPED / TCAD). | Workload-hint justification |

## 8. Methodology and open-source flow

| # | Pri | Reference | Why |
|---|---|---|---|
| 29 | ★★★ | P. G. A. Jespers, B. Murmann, *Systematic Design of Analog CMOS Circuits Using Pre-Computed Lookup Tables*, Cambridge Univ. Press, 2017. | **gm/Id method** used for all our sizing |
| 30 | ★ | SkyWater SKY130 PDK documentation (skywater-pdk.readthedocs.io); Tiny Tapeout analog specs (tinytapeout.com/specs/analog). | PDK facts, TT constraints |
| 31 | ★ | B. Murmann et al., open-source analog flows with xschem / ngspice / Magic (e.g. "Open-source IC design" tutorials, IEEE SSCS PICO / Chipathon 2022–2025). **[verify]** | Methodology citation for our open flow |

## Comparison metrics we should extract

- **FOM₁ = C_L · ΔV · Iq / ΔI_L²**, also written FOM = T_R·Iq/ΔI_L with T_R = C_L·ΔV/ΔI_L
  (the response-time FOM used in Guo & Leung 2010 and later). Lower is better.
- ΔV_under / ΔV_over at a stated ΔI_L and edge time; Iq; C_L on-chip; process; area; PSRR at 1 kHz / 1 MHz.

## What to fetch first

1. #13 (Or & Leung, direct voltage-spike detection): closest to our boost path
2. #3 (Man et al., single-transistor-control FVF LDO): closest to our baseline
3. #17 and #18 (adaptive bias): our next block
4. #7 (Milliken): canonical OCL-LDO
5. #29 (gm/Id book, if it isn't already in the library)
6. 3–4 recent (2020–2025) FVF OCL-LDO papers with adaptive bias or transient enhancement (#19, #26)
