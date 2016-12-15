<CsoundSynthesizer>
<CsInstruments>
sr     = 44100
kr     = 4410
ksmps  = 10
nchnls = 2
0dbfs = 1.0

; gawave init 0; global wave
; gaenvelope init 0;
; gkvibrato init 0;
; gareverb init 0;

; gitime = 5
gibeats = 0
giversion = 0
gitempo = 60.0
gifreq1 = 0.0
gifreq2 = 0.0
gifreq3 = 0.0
gifreq4 = 0.0
giloop_length = 6
;------------------------------------------------------------------------------
; Instrument: beats
;------------------------------------------------------------------------------

instr 100

kNotesArray[] init 2
kNotesArray[] fillarray 220, 220




; krepeat = p5
; kfirst = p6
; kfreq = kNotesArray[rnd(1)]
; gitime = p2
; itiming init
; itiming = p2
; istartMin = 0.2
; istartMax = 4
; printk 0.1, ktime
;envelope

						    ; p1  p2 p3   p4    p5    p6     p7     p8      p9     p10    p11    p12    p13  p14     p15        p16
; pt.scoreEvent(False, 'i', (100, 0, 1, time, freq, time1, freq1, time2, freq2, time3, freq3, time4, freq4, delta, note_number, 1))
iduration = 2
iamplitude = 0.3
iattack = 0.001
iinstrument = p1
itime = p2
iduration = p3
; itime = p4
; ifreq = p5
ifreq = cpspch (p5-1)
itime1 = p6
ifreq1 = p7
itime2 = p8
ifreq2 = p9
itime3 = p10
ifreq3 = p11
itime4 = p12
ifreq4 = p13
idelta = p14
inote_number = p15
iglobal = p16
iversion = p17
itempo = p18

; chnset itempo, "tempo"
; chnset ifreq1, "ifreq1"
; chnset ifreq2, "ifreq2"
; chnset ifreq3, "ifreq3"

; printf_i "gifreq1 = %f\n", 0.1, gifreq1
; printf_i "gifreq2 = %f\n", 0.1, gifreq2
; printf_i "gifreq3 = %f\n", 0.1, gifreq3
; printf_i "gifreq4 = %f\n", 0.1, gifreq4
; printf_i "gitempo = %f\n", 0.1, gitempo
; printf_i "p6 = %f\n", 0.1, itime1
; printf_i "giversion = %f\n", 0.1, giversion
; printf_i "number of notes = %f\n", 0.1, gibeats

;;; need to handle the case of 1 beat

; if (iglobal == 3) then
; 	schedule 100, itime, 1, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 3
; 	printf_i "silence... %d\n", 0.1, iglobal
; endif


if (iglobal == 1) then
	giversion = iversion
	gibeats = inote_number
	gitempo = itempo
	gifreq1 = ifreq1
	gifreq2 = ifreq2
	gifreq3 = ifreq3
	gifreq4 = ifreq4

	; schedule 100, 60/gitempo, 0.3;, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo
endif

if (gifreq1 > 0) then

	if (gibeats <= inote_number) && (giversion == iversion) then
		itime = itime1 + idelta
		ifreq = cpspch (ifreq1-1)
		inote_number = 1 
		printf_i "inote_number = %d\n", 0.1, inote_number
		schedule 100, itime, 1, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo
	
	elseif (inote_number == 1)  && (giversion == iversion) then
		itime = itime2 - itime1
		ifreq = cpspch (ifreq2-1)
		inote_number = 2
		printf_i "inote_number = %d\n", 0.1, inote_number
		schedule 100, itime, 1, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo
	
	elseif (inote_number == 2)  && (giversion == iversion) then
		itime = itime3 - itime2
		ifreq = cpspch (ifreq3-1)
		inote_number = 3
		printf_i "inote_number = %d\n", 0.1, inote_number
		schedule 100, itime, 1, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo

	elseif (inote_number == 3)  && (giversion == iversion) then
		itime = itime4 - itime3
		ifreq = cpspch (ifreq4-1)
		inote_number = 4
		printf_i "inote_number = %d\n", 0.1, inote_number
		schedule 100, itime, 1, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo
		
	endif

endif

if (p7 == 1) then
	; giversion = p6
	gitempo = p8
	giloop_length = p9
endif


aenv linseg 0, iduration * iattack, iamplitude, iduration * ( 1 - iattack ), 0
ares poscil3 aenv, ifreq, 1
ares moogvcf ares, 2000, 0.2
outs ares, ares



if (p6 == giversion) then
	schedule 100, 6, p3, p4, p5, p6, 0, p8
	gifreq1 = p5
endif

; schedule 100, p2, p3, p4;, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo


	
; if (krepeat == 0) igoto delayScheduler
	; krepeati = p2 + 5
; schedule 100, p2, iduration, iamplitude; ,krepeati, 1

; if ( inotesLeft <= 1 ) igoto bypassScheduler

; 		istartNext = rnd( istartMax - istartMin ) + istartMin
; 		schedule p1, istartNext, iduration, iamplitude ,inotesLeft - 1
		
; 		printf_i "%d notes left\n", 1, inotesLeft - 1

	; delayScheduler:
	; 	gitime = gitime + p2
	; 	schedule 100, p5, iduration, iamplitude ,krepeat, 0

endin


;------------------------------------------------------------------------------
; Instrument: melody [=== notes]
;------------------------------------------------------------------------------

instr 101

giversion = p4

endin

instr 103

endin
;------------------------------------------------------------------------------


instr 102



; if (gifreq1 > 0) then
; 	inoteC = cpspch (gifreq1-1.0)
; 	itimbre = 2
; 	iamplitude = 0.1

; 	if (gifreq2 > 0) then
; 		inoteG = cpspch (gifreq2-1.0)
; 	else
; 		inoteG = inoteC
; 		; iamplitude2 = 0
; 	endif

; 	if (gifreq3 > 0) then
; 		inoteD = cpspch (gifreq3-1.0)
; 	else
; 		inoteD = inoteG
; 		; iamplitude3 = 0
; 	endif
	
; else
; 	inoteC = cpspch (6.0)
; 	inoteG = cpspch (6.07)
; 	inoteD = cpspch (5.2)
; 	itimbre = 3
; endif

; if (gifreq1 > 0) then
; 	inoteC = cpspch (gifreq1-1.0)
; 	inoteC = cpspch (gifreq1-1.0)
; 	inoteC = cpspch (gifreq1-1.0)
iduration = p3
; iamplitude = p4
; iamplitude2 = 0.2
; iamplitude3 = 0.2
iattack = 0.5
icurrentnote = 0
inoteC = cpspch (6.0)
inoteG = cpspch (6.07)
inoteD = cpspch (5.2)
itimbre = p7

kNotesArray[] init 3
kNotesArray[] fillarray inoteC, inoteG, inoteD
; aRandomNote random 0, 2
alfo = 0

if (gifreq1 == 0) then
	kfreq = kNotesArray[p6]
	iamplitude = 0.1
	itable1 = 2
	itable2 = 2
	; alfo lfo 2, 8
else
	icurrentnote = gifreq1
	kfreq = cpspch (icurrentnote)
	iamplitude = 0.1
	itable1 = 3
	itable2 = 2
	alfo lfo 2, 8
endif



if (p6 == 0) && (p5 == 1) then
	schedule p1, 12*60/gitempo*0.8, 12*60/gitempo, iamplitude, 1 ,1, itable1
	schedule p1, 12*60/gitempo*0.8, 12*60/gitempo, iamplitude, 0 ,1, itable2

elseif (p6 == 1) && (p5 == 1)  then
	schedule p1, 12*60/gitempo*0.8, 12*60/gitempo, iamplitude, 1 ,2, itable1
	schedule p1, 12*60/gitempo*0.8, 12*60/gitempo, iamplitude, 0 ,2, itable2

elseif (p6 == 2) && (p5 == 1)  then
	schedule p1, 12*60/gitempo*0.8, 12*60/gitempo, iamplitude, 1 ,0, itable1
	schedule p1, 12*60/gitempo*0.8, 12*60/gitempo, iamplitude, 0 ,0, itable2

endif

aenv linseg 0, iduration * iattack, p4, iduration * ( 1 - iattack ), 0


ares poscil3 aenv, kfreq+alfo, itimbre
ares moogvcf ares, 400, 0.8
outs ares, ares

; printk 0.1, kfreq
; printk 1, kfreq_print
printf_i "gifreq1 = %f\n", 1, gifreq1
; printf_i "gifreq1 (hz) = %f\n", 1, cpspch (gifreq1)
printf_i "background = %f\n", 1, (icurrentnote-1.0)
printf_i "giloop_length = %f\n", 1, giloop_length
printf_i "gifreq2 = %f\n", 1, gifreq2
printf_i "gifreq3 = %f\n", 1, gifreq3
printf_i "gifreq4 = %f\n", 1, gifreq4
printf_i "gitempo = %f\n", 1, gitempo
printf_i "giversion = %f\n", 1, giversion
printf_i "number of notes = %f\n", 1, gibeats

endin



</CsInstruments>
<CsScore>


; High resolution sine table

f1 0 [2^16] 10 1 1 0.05 0 ; Sine
f2 0 [2^16] 10 1 0.15 6 2 1 ; default background sound
f3 0 [2^14] 10 1 0   0.3 0    0.2 0     0.14 0     .111
f4 0 [2^14] 10 1 1   1   1    0.7 0.5   0.3  0.1

; f 2 0 [2^16] 10 1 1
; f2 0 [2^16] 10 10 10


; f2 0 1024 10 1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 .111   ; Nice Sawtooth
; f3 0 16384 10 1 0   0.3 0    0.2 0     0.14 0     .111   ; NiceSquare
; f4 0 16384 10 1 1   1   1    0.7 0.5   0.3  0.1          ; Nice Pulse


; t 0 60 4 120 4 60 4 120
; t 4 120

; Start Sine Box
;	p1		p2		p3		p4		p5		p6
; i	100		0		0.3		0.2		200
; i	101		0		240		0.1
; i	102		0		12		0.2		1		0	3
i	102		0		12		0.2		1		0	2
i 103 0 99999999999


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
