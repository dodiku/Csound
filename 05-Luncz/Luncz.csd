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
iduration = 1
iamplitude = 0.2
iattack = 0.001
iinstrument = p1
itime = p2
iduration = p3
; itime = p4
ifreq = p5
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

chnset itempo, "tempo"
chnset ifreq1, "ifreq1"
chnset ifreq2, "ifreq2"
chnset ifreq3, "ifreq3"



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
	printf_i "number of notes = %d\n", 0.1, gibeats
endif

if (gifreq1 > 0) then

	if (gibeats <= inote_number) && (giversion == iversion) then
		itime = itime1 + idelta
		ifreq = cpspch (ifreq1)
		inote_number = 1 
		printf_i "inote_number = %d\n", 0.1, inote_number
		schedule 100, itime, 1, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo

	elseif (inote_number == 1)  && (giversion == iversion) then
		itime = itime2 - itime1
		ifreq = cpspch (ifreq2)
		inote_number = 2
		printf_i "inote_number = %d\n", 0.1, inote_number
		schedule 100, itime, 1, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo

	elseif (inote_number == 2)  && (giversion == iversion) then
		itime = itime3 - itime2
		ifreq = cpspch (ifreq3)
		inote_number = 3
		printf_i "inote_number = %d\n", 0.1, inote_number
		schedule 100, itime, 1, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo


	elseif (inote_number == 3)  && (giversion == iversion) then
		itime = itime4 - itime3
		ifreq = cpspch (ifreq4)
		inote_number = 4
		printf_i "inote_number = %d\n", 0.1, inote_number
		schedule 100, itime, 1, itime, ifreq, itime1, ifreq1, itime2, ifreq2, itime3, ifreq3, itime4, ifreq4, idelta, inote_number, 0, iversion, itempo

	endif

endif


aenv linseg 0, iduration * iattack, iamplitude, iduration * ( 1 - iattack ), 0
ares poscil3 aenv, ifreq, 1
ares moogvcf ares, 2000, 0.8
outs ares, ares





	
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


instr 102

iduration = p3
iamplitude1 = 0.2
iamplitude2 = 0.2
iamplitude3 = 0.2
iattack = 0.5

; print 1, gitime

; Sbpm init "0"
; kans OSClisten gihandle, "/csound", "s", Sbpm
; kbpm strtolk Sbpm
if (gifreq1 > 0) then
	inoteC = cpspch (gifreq1-1.0)
	itimbre = 3

	if (gifreq2 > 0) then
		inoteG = cpspch (gifreq2-1.0)
	else
		inoteG = inoteC
		; iamplitude2 = 0
	endif

	if (gifreq3 > 0) then
		inoteD = cpspch (gifreq3-1.0)
	else
		inoteD = inoteG
		; iamplitude3 = 0
	endif
	
else
	inoteC = cpspch (6.0)
	inoteG = cpspch (6.07)
	inoteD = cpspch (5.2)
	itimbre = 2
endif

kNotesArray[] init 3
kNotesArray[] fillarray inoteC, inoteG, inoteD
aRandomNote random 0, 2

; kNotesArray[] init 16
; kNotesArray[] fillarray 196, 261, 330, 261, 349, 330, 261, 196,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0



; inotesLeft = p6
kfreq = kNotesArray[p6]


; printk 1, kfreq
; printk 1, p6
; printk 1, kans
; printk 1, kbpm

; schedule p1, 8, iduration, iamplitude, 1 ,round(aRandomNote)

; if (giversion > 1) then
; 	schedule p1, 8, iduration, iamplitude, 1 ,1
; endif
; itempo chnget "tempo"
; ifreq1 chnget "ifreq1"
; ifreq2 chnget "ifreq2"
; ifreq3 chnget "ifreq3"



; ktempo_print = itempo
; kfreq_print = ifreq1

printk 1, kfreq
; printk 1, kfreq_print
printf_i "gifreq1 = %d\n", 0.1, gifreq1
printf_i "gifreq2 = %d\n", 0.1, gifreq2
printf_i "gifreq3 = %d\n", 0.1, gifreq3
printf_i "gitempo = %d\n", 0.1, gitempo
printf_i "gibeats = %d\n", 0.1, gibeats
printf_i "giversion = %d\n", 0.1, giversion
; if (p6 == 0) && (gifreq1 > 0) then
; 	kfreq = gifreq1
; 	schedule p1, 10*60/itempo*0.8, 10*60/itempo, iamplitude*2, 1, 1 

; elseif (p6 == 1) && (gifreq2 > 0) then
; 	kfreq = gifreq2
; 	schedule p1, 10*60/itempo*0.8, 10*60/itempo, iamplitude*2, 0, 2 

; elseif (p6 == 2) && (gifreq3 > 0) then
; 	kfreq = gifreq3
; 	schedule p1, 10*60/itempo*0.8, 10*60/itempo, iamplitude*2, 1, 0 

if (p6 == 0) then
	schedule p1, 10*60/gitempo*0.8, 10*60/gitempo, iamplitude2, 1 ,1

elseif (p6 == 1) then
	schedule p1, 10*60/gitempo*0.8, 10*60/gitempo, iamplitude3, 0 ,2

elseif (p6 == 2) then
	schedule p1, 10*60/gitempo*0.8, 10*60/gitempo, iamplitude1, 1 ,0

; else
; 	kfreq = ifreq1
; 	schedule p1, 10*60/itempo*0.8, 10*60/itempo, iamplitude*2, 1, 1 
; 	printf_i "scheduked = %d\n", 0.1, ifreq1
	
endif


; ktempo tempoval
; if (p6 == 0) kgoto speedup
; 	kgoto play

; speedup:
  ; Increase the tempo to 150 beats per minute.
  ; tempo 150, 60



; if (p6 != 2) igoto bypassScheduler
; 	schedule p1, 8, iduration, iamplitude, 0 ,1
	; tempo 150, 60
; bypassScheduler: 
; printk 1, ktempo
	;envelope:
	aenv linseg 0, iduration * iattack, p4, iduration * ( 1 - iattack ), 0


	ares poscil3 aenv, kfreq, itimbre
	ares moogvcf ares, 4000, 0.8
	outs ares, ares

endin



</CsInstruments>
<CsScore>


; High resolution sine table

f 1 0 [2^16] 10 1 0 0 0 
f 2 0 [2^16] 10 1 1
f 3 0 [2^16] 10 1 0.15 6 2 1

; t 0 60 4 120 4 60 4 120
; t 4 120

; Start Sine Box
;	p1		p2		p3		p4		p5		p6
; i	100		0		0.3		0.2		200
; i	101		0		240		0.1
i	102		0		10		0.2		0		0



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
