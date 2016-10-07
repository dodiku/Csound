based on music by Jean-Luc Cohen

<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr     = 30000
kr     = 30000
ksmps  = 1
nchnls = 1

garvbsig  init      0    /* global "a" variable initialized to 0 */


instr 100
aout oscil 10000, p6, 1
out aout
endin

instr 101
	/* P-field from score */
	
	idiv = int(p4)  /* Integer division of clock. Range 1 - 32. */
	itab = p5		/* selects the waveform */

	/* Limit clock division to a range between 1 and 32 */
	idiv limit idiv, 1, 32

	/* Convert clock division to frequency */
	ifreq = sr / 16 / idiv /* adds table length to pitch value, longer tables lower pitch */
	print ifreq	

	/* Oscillator */
	a1 oscil p8, ifreq, 2

	/* Output audio */
	out a1
endin

instr 102

	/* P-fields from score */
	idur  = p3  /* Duration of instance */
	ienv1 = p4  /* Starting envelope value. Range 1 - 32 */
	ienv2 = p5  /* Ending envelope value. Range 1 - 32 */
	itab	= p7	/* selects the waveform */
	

	/* Limit envelope end points to a range between 1 and 32 */
	ienv1 limit ienv1, 1, 24
	ienv2 limit ienv2, 1, 24

	/* Envelope to control the clock divider */
	kline line ienv1, idur, ienv2
	
	/* The original atari 2600 clock uses integers to divide the clock.
	 * Thus, the envelope is quantized from a continuous signal to a
	 * signal composed of whole numbers.
	 */
	kline = int(kline)

	/* Convert clock division to frequency */
	kfreq = sr / 16 / kline

	/* Oscillator */
	a1 oscil 5000, kfreq, itab

	/* Output audio */
	out a1
	
	garvbsig	=	garvbsig + a1*.05		/* 1 1/10th of the dry signal is sent to the reverb */ 	
	
endin

instr 103

	/* P-fields from score */
	idur  = p3  /* Duration of instance */
	ienv1 = p4  /* Starting envelope value. Range 1 - 32 */
	ienv2 = p5  /* Ending envelope value. Range 1 - 32 */
	itab	= p7	/* selects the waveform */
	

	/* Limit envelope end points to a range between 1 and 32 */
	ienv1 limit ienv1, 1, 24
	ienv2 limit ienv2, 1, 24

	/* Envelope to control the clock divider */
	kline = ienv1
	
	/* The original atari 2600 clock uses integers to divide the clock.
	 * Thus, the envelope is quantized from a continuous signal to a
	 * signal composed of whole numbers.
	 */
	kline = int(kline)

	/* Convert clock division to frequency */
	kfreq = sr / 16 / kline

	/* Oscillator */
	a1 oscil 8000, kfreq, itab

	/* Output audio */
	out a1
	
	garvbsig	=	garvbsig + a1*.05		/* 1 1/10th of the dry signal is sent to the reverb */ 	
	
endin

instr 104

	/* P-fields from score */
	idur  = p3  /* Duration of instance */
	ienv1 = p4  /* Starting envelope value. Range 1 - 32 */
	ienv2 = p5  /* Ending envelope value. Range 1 - 32 */
	itab	= p7	/* selects the waveform */
	

	/* Limit envelope end points to a range between 1 and 32 */
	ienv1 limit ienv1, 1, 24
	ienv2 limit ienv2, 1, 24

	/* Envelope to control the clock divider */
	kline = p6
	
	/* The original atari 2600 clock uses integers to divide the clock.
	 * Thus, the envelope is quantized from a continuous signal to a
	 * signal composed of whole numbers.
	 */
	kline = int(kline)

	/* Convert clock division to frequency */
	kfreq = sr / 16 / p6

	/* Oscillator */
	a1 oscil 8000, kfreq, itab
;	a1 oscil 8000, p6, itab

	/* Output audio */
	out a1
	
	garvbsig	=	garvbsig + a1*.05		/* 1 1/10th of the dry signal is sent to the reverb */ 	
	
endin

instr 105

	/* P-fields from score */
	idur  = p3  /* Duration of instance */
	ienv1 = p4  /* Starting envelope value. Range 1 - 32 */
	ienv2 = p5  /* Ending envelope value. Range 1 - 32 */
	itab	= p7	/* selects the waveform */
	

	/* Limit envelope end points to a range between 1 and 32 */
	ienv1 limit ienv1, 1, 24
	ienv2 limit ienv2, 1, 24

	/* Envelope to control the clock divider */
	kline = p6
	
	/* The original atari 2600 clock uses integers to divide the clock.
	 * Thus, the envelope is quantized from a continuous signal to a
	 * signal composed of whole numbers.
	 */
	kline = int(kline)

	/* Convert clock division to frequency */
	kfreq = sr / 16 / p6

	/* Oscillator */
;	a1 oscil 8000, kfreq, itab
	a1 oscil 6000, p6, itab

	/* Output audio */
	out a1
	
	garvbsig	=	garvbsig + a1*.05		/* 1 1/10th of the dry signal is sent to the reverb */ 	
	
endin



</CsInstruments>
<CsScore>

;fnumber	load-time	table-size	GEN		Routine	parameter1	parameter...   ; COMMENT 
f1		0		1024		10		1
f2		0		16		-2		0		0 1 1 0 1 0 0 0 1 1 1 0 1 1 1
f3		0		16		-2		1		0 1 0 0 1 0 1 0 0 1 1 0 0 1 1
f4		0		16		-2		1		1 1 1 1 1 1 1 1 1 1 1 0 0 1 1

;p1	p2	p3	p4	p5	p6[frq]	p7[waveform]	p8[amp]

i102	0	6	31	1	0		3
i103	6	0.2	31	1	0		4
i103	8	0.2	31	1	0		4
i103	8.5	0.2	31	1	0		4

;e

i101	0	1	31	1	0		0			800
i101	+	1	31	1	0		0			2500
i101	+	1	31	1	0		0			3000
i101	+	1	31	1	0		0			3500
i101	+	1	31	1	0		0			4000
i101	+	1	31	1	0		0			4500
i101	+	50	31	1	0		0			5000

i100	11.5	0.5	0	0	140
i100	+	0.5	0	0	180
i100	+	0.5	0	0	240
i100	+	0.5	0	0	280
i100	+	0.5	0	0	340
i100	+	0.5	0	0	280
i100	+	0.5	0	0	480
i100	+	0.5	0	0	540
i100	+	0.5	0	0	280
i100	+	1.5	0	0	640
i100	+	0.5	0	0	540
i100	+	1	0	0	580

i100	20	0.5	0	0	140
i100	+	0.5	0	0	180
i100	+	0.5	0	0	240
i100	+	0.5	0	0	280
i100	+	0.5	0	0	340
i100	+	0.5	0	0	280
i100	+	0.5	0	0	480
i100	+	0.5	0	0	540
i100	+	0.5	0	0	280
i100	+	1.5	0	0	640
i100	+	0.5	0	0	580
i100	+	1	0	0	480

i103	30	0.2	31	1	0		4
i103	32	0.2	31	1	0		4
i103	32.5	0.2	31	1	0		4 ; need a change of note

i100	36	0.5	0	0	140
i100	+	0.5	0	0	180
i100	+	0.5	0	0	240
i100	+	0.5	0	0	280
i100	+	0.5	0	0	340
i100	+	0.5	0	0	280
i100	+	0.5	0	0	480
i100	+	0.5	0	0	540
i100	+	0.5	0	0	280
i100	+	1.5	0	0	640
i100	+	0.5	0	0	580
i100	+	1	0	0	540

i104	36	0.5	31	1	140		4
i104	+	0.5	31	1	180		4
i104	+	0.5	31	1	240		4
i104	+	0.5	31	1	280		4
i104	+	0.5	31	1	340		4
i104	+	0.5	31	1	280		4
i104	+	0.5	31	1	480		4
i104	+	0.5	31	1	540		4
i104	+	0.5	31	1	280		4
i104	+	1.5	31	1	640		4
i104	+	0.5	13	1	580		4
i104	+	1	13	1	540		4

i104	+	0.5	31	1	140		4
i104	+	0.5	31	1	180		4
i104	+	0.5	31	1	240		4
i104	+	0.5	31	1	280		4
i104	+	0.5	31	1	340		4
i104	+	0.5	31	1	280		4
i104	+	0.5	31	1	480		4
i104	+	0.5	31	1	540		4
i104	+	0.5	31	1	280		4
i104	+	1.5	31	1	640		4
i104	+	0.5	13	1	580		4
i104	+	1	13	1	540		4

i104	+	0.5	31	1	140		4
i104	+	0.5	31	1	180		4
i104	+	0.5	31	1	240		4
i104	+	0.5	31	1	280		4
i104	+	0.5	31	1	340		4
i104	+	0.5	31	1	280		4
i104	+	0.5	31	1	480		4
i104	+	0.5	31	1	540		4
i104	+	0.5	31	1	280		4
i104	+	1.5	31	1	640		4
i104	+	0.5	13	1	580		4
i104	+	1	13	1	540		4

i105	44.5	0.5	31	1	140		4
i105	+	0.5	31	1	180		4
i105	+	0.5	31	1	240		4
i105	+	0.5	31	1	280		4
i105	+	0.5	31	1	340		4
i105	+	0.5	31	1	280		4
i105	+	0.5	31	1	480		4
i105	+	0.5	31	1	540		4
i105	+	0.5	31	1	280		4
i105	+	1.5	31	1	640		4
i105	+	0.5	13	1	580		4
i105	+	1	13	1	480		4





 

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
