-= Lilienblum
Dror Ayalon
October 5, 2016
d.stamail@gmail.com
www.drorayalon.com

;<CsOptions>
;
;-odac
;
;</CsOptions>

<CsoundSynthesizer>
<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1
0dbfs = 1.0

strset 1, "samples/084_this-bass-swings-weird.wav"
strset 2, "samples/093_ambient-snaploop.aiff"
strset 3, "samples/greatest_moment.aif"
strset 4, "samples/085_deep-acoustic-bass.aif"
strset 5, "samples/ambient-void-pad.wav"
strset 6, "samples/bd1.wav"
strset 7, "samples/_077_rolling-down-machine.wav"

;a1[, a2[, ... aN]] diskin2 ifilcod [kpitch, iskiptim , iwrap, iformat, iwsize, ibufsize, iskipinit]

instr 1
	iamp = p4   ; Amplitude
	ipch = p5   ; Pitch. 1 = normal, >1 = faster, <1 = slower.
	Sfile strget p6

    a1 diskin2 Sfile, ipch, 0, 1
    out a1 * iamp
endin



instr 2
	iamp = p4
	Sfile strget p6
	ipch = p5 ; Pitch. 1 = normal, >1 = faster, <1 = slower.

	ares linseg iamp, p3*.1, iamp, p3*.8, iamp, p3*.1, 0 

	a1 diskin2 Sfile, ipch, 0.1, 40
	out a1 * ares
endin



instr 3
	iamp = p4
	Sfile strget p6
	ipch = p5 ; Pitch. 1 = normal, >1 = faster, <1 = slower.

	a1 diskin2 Sfile, ipch, 1, 40
	out a1 * iamp
endin

instr 4
	iamp = p4   ; Amplitude
	ipch = p5   ; Pitch. 1 = normal, >1 = faster, <1 = slower.
	iskp = p7
	Sfile strget p6

;	ares adsr 1, 0.1, iamp, 5
	ares linseg 0, p3*.1, iamp, p3*.7, iamp*.9, p3*.2, 0 


		   ; ifilcod, kpitch, iskiptim , iwrap
    	a1 diskin2 Sfile, ipch, iskp, 100
    	out a1 * ares
    
endin

instr 5

	iamp = p4
;	Sfile strget p6
;	iskp = p7
	ipch = p5 ; Pitch. 1 = normal, >1 = faster, <1 = slower.

	ares linseg 0, p3*.4, iamp, p3*.2, iamp*.9, p3*.4, 0 

	a1 oscil ares, ipch, 1
	out a1 * iamp
	
endin

instr 6

	iamp = p4
;	Sfile strget p6
;	iskp = p7
;	ipch = p5 ; Pitch. 1 = normal, >1 = faster, <1 = slower.

	ares linseg 0, p3*.1, iamp, p3*.5, iamp*.9, p3*.4, 0 
	
	kline line 22, 0.2, 10

	a1 oscil ares, kline, 1
	out a1 * iamp
	
endin




</CsInstruments>
<CsScore>
;fnumber	load-time	table-size	GEN		Routine	parameter1	parameter...   ; COMMENT 
f1		0		1024		20		7       1       2



;inst(p1)	start(p2)	duration(p3)	amplitude(p4)	pitch(p5)	filename(p6)	iskiptim(p7)
i4		0		72			0.4			0.2			5			1.5
i4		12		60			0.4			0.4			5			0.2
i4		31		36			0.4			1			4			0
i6		43		10			0.4
i5		45		18			0.2			360
i2		62		1			0.2			1			3
i2		+		0.2			.			1			3
i2		+		0.2			.			1			3
i2		+		0.2			.			1			3
i2		+		0.2			.			1			3
i2		+		0.2			.			1			3
i2		+		0.2			.			1			3

i2		+		0.2			.18			1			3
i2		+		0.2			.15			1			3
i2		+		0.2			.10			1			3
i2		+		0.2			.08			1			3
i2		+		0.2			.04			1			3
i2		+		0.2			.01			1			3
i2		+		0.2			.005			1			3
i2		+		0.2			.002			1			3
i2		+		0.2			.001			1			3
i2		+		0.4			.6			0.6			1

i1		66		66			0.4			1			2

i2		74.6		8			0.6			0.6			1
i2		+		1			.			0.2			.
i2		+		1			.			0.2			.
i2		+		1			.			0.2			.
i2		+		1			.			0.2			.

i2		90		3			.			1			3
i2		+		0.2			.			0.12			.
i2		+		0.2			.			0.12			.
i2		+		0.2			.			0.12			.
i2		+		0.2			.			4.4			.
i2		+		0.2			.			4.4			.
i2		+		0.2			.			4.4			.

i2		99.8		10			.			0.8			1
i2		+		1			.			0.2			.
i2		+		1			.			0.2			.
i2		+		5			.			1.2			.


i2		119		1			.			0.2			.
i2		+		1			.			1			.
i2		+		2			.			1.5			.
i2		+		.			.			0.2			.
i2		+		2.8			.			1			3

i2		130		1			.			1			3
i3		131		0.6			0.6			1			3




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
