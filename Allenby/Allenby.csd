 diskin2
Jacob Joaquin
October 12, 2010
jacobjoaquin@gmail.com
csoundblog.com
<CsOptions>

-odac

</CsOptions>

<CsoundSynthesizer>
<CsInstruments>
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1
0dbfs = 1.0

strset 1, "084_this-bass-swings-weird.wav"
strset 2, "093_ambient-snaploop.aiff"
strset 3, "greatest_moment.aif"


instr 1
iamp = p4   ; Amplitude
ipch = p5   ; Pitch. 1 = normal, >1 = faster, <1 = slower.
Sfile strget p6

    a1 diskin2 Sfile, ipch, 0, 1, 0, 4
    out a1
endin


instr 2
Sfile strget p6
ipch = p5 ; Pitch. 1 = normal, >1 = faster, <1 = slower.

		;ifilcod, kpitch, iskiptim, iwarp, iformat, iwsize
a1 diskin2 Sfile, ipch, 0.1, 40, 4

out a1
endin


instr 3
Sfile strget p6
ipch = p5 ; Pitch. 1 = normal, >1 = faster, <1 = slower.

		;ifilcod, kpitch, iskiptim, iwarp, iformat, iwsize
a1 diskin2 Sfile, ipch, 1, 40, 4
out a1
endin




</CsInstruments>
<CsScore>
;fnumber	load-time	table-size	GEN		Routine	parameter1	parameter...   ; COMMENT 


;inst(p1)	start(p2)	duration(p3)	amplitude(p4)	frequency(p5)	filename(p6)
i1		0		66			0.4			1			2


i2		8.6		8			0.25			0.6			1
i2		+		1			.			0.2			.
i2		+		1			.			0.2			.
i2		+		1			.			0.2			.
i2		+		1			.			0.2			.

i2		24		3			0.25			1			3
i2		+		0.2			0.25			0.12			.
i2		+		0.2			0.25			0.12			.
i2		+		0.2			0.25			0.12			.
i2		+		0.2			0.25			4.4			.
i2		+		0.2			0.25			4.4			.
i2		+		0.2			0.25			4.4			.

i2		33.8		10			0.25			0.8			1
i2		+		1			.			0.2			.
i2		+		1			.			0.2			.
i2		+		5			.			1.2			.


i2		53		1			.			0.2			.
i2		+		1			.			1			.
i2		+		2			.			1.5			.
i2		+		.			.			0.2			.
i2		+		2.8			0.25			1			3

i2		64		1			0.25			1			3
i3		65		0.6			0.25			1			3


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
