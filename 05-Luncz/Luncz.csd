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

;------------------------------------------------------------------------------
; Instrument: beats
;------------------------------------------------------------------------------

instr 100

kNotesArray[] init 3
kNotesArray[] fillarray 110, 220

iduration = p3
iamplitude = p4
iattack = 0.001

; inotesLeft = p5
kfreq = kNotesArray[rnd(1)]
istartMin = 0.2
istartMax = 4

;envelope
aenv linseg 0, iduration * iattack, iamplitude, iduration * ( 1 - iattack ), 0

ares poscil3 aenv, kfreq, 2

; ares reverb ares, 0.01
ares moogvcf ares, 2000, 0.8

outs ares, ares

; if ( inotesLeft <= 1 ) igoto bypassScheduler

; 		istartNext = rnd( istartMax - istartMin ) + istartMin
; 		schedule p1, istartNext, iduration, iamplitude ,inotesLeft - 1
		
; 		printf_i "%d notes left\n", 1, inotesLeft - 1

; 	bypassScheduler:

endin


;------------------------------------------------------------------------------
; Instrument: melody [=== notes]
;------------------------------------------------------------------------------


instr 102

; Sbpm init "0"
; kans OSClisten gihandle, "/csound", "s", Sbpm
; kbpm strtolk Sbpm

inoteC = cpspch (6.0)
inoteG = cpspch (6.07)
inoteD = cpspch (5.2)

kNotesArray[] init 2
kNotesArray[] fillarray inoteC, inoteG, inoteD
aRandomNote random 0, 2

; kNotesArray[] init 16
; kNotesArray[] fillarray 196, 261, 330, 261, 349, 330, 261, 196,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0

iduration = p3
iamplitude = p4 ;;;; add envelope
iattack = 0.5

; inotesLeft = p6
kfreq = kNotesArray[p6]


printk 1, kfreq
printk 1, p6
; printk 1, kans
; printk 1, kbpm

; schedule p1, 8, iduration, iamplitude, 1 ,round(aRandomNote)

if (p6 == 0) then
	schedule p1, 8, iduration, iamplitude, 1 ,1
endif


if (p6 == 1) then
	schedule p1, 8, iduration, iamplitude, 0 ,2
endif


if (p6 == 2) then
	schedule p1, 8, iduration, iamplitude, 1 ,0
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
	aenv linseg 0, iduration * iattack, iamplitude, iduration * ( 1 - iattack ), 0


	ares poscil3 aenv, kfreq, 1
	ares moogvcf ares, 4000, 0.8
	outs ares, ares

endin



</CsInstruments>
<CsScore>


; High resolution sine table
f 1 0 [2^16] 10 1 0.15 6 2 1
f 2 0 [2^16] 10 1 0 0 0 

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
