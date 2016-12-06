<CsoundSynthesizer>
<CsInstruments>
sr     = 44100
kr     = 4410
ksmps  = 10
nchnls = 2
0dbfs = 1.0

; gawave init 0; global wave
gaenvelope init 0;
gkvibrato init 0;
gareverb init 0;


;------------------------------------------------------------------------------
; Instrument: beats
;------------------------------------------------------------------------------

instr 100

kNotesArray[] init 3
kNotesArray[] fillarray 40, 80

iduration = p3
iamplitude = p4
iattack = 0.001

inotesLeft = p5
kfreq = kNotesArray[rnd(1)]
istartMin = 0.2
istartMax = 4

;envelope
aenv linseg 0, iduration * iattack, iamplitude, iduration * ( 1 - iattack ), 0

ares oscil3 aenv, kfreq, 1
outs ares, ares

if ( inotesLeft <= 1 ) igoto bypassScheduler

		istartNext = rnd( istartMax - istartMin ) + istartMin
		schedule p1, istartNext, iduration, iamplitude ,inotesLeft - 1
		
		printf_i "%d notes left\n", 1, inotesLeft - 1

	bypassScheduler:

endin

;------------------------------------------------------------------------------
; Instrument: background
;------------------------------------------------------------------------------

instr 101

kNotesArray[] init 1
kNotesArray[] fillarray 80;, 80

iduration = p3
iamplitude = p4

inotesLeft = p5
kfreq = kNotesArray[rnd(0)]
istartMin = 1
istartMax = 0.5

ares oscil3 iamplitude, kfreq+gkvibrato, 2
;outs ares*gaenvelope, ares*gaenvelope


afltenv	linseg	300, p3/3, 1000
afltenv = afltenv + gaenvelope
aresmoog	moogvcf	ares, afltenv,	 .1, 1500
outs aresmoog, aresmoog


endin


;------------------------------------------------------------------------------
; Instrument: melody [=== notes]
;------------------------------------------------------------------------------


instr 102

inoteC = cpspch (3.0)
inoteD = cpspch (3.2)
kNotesArray[] init 2
kNotesArray[] fillarray inoteC, inoteD
iRandomNote random 0, 1

; kNotesArray[] init 16
; kNotesArray[] fillarray 196, 261, 330, 261, 349, 330, 261, 196,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0

iduration = p3
iamplitude = p4 ;;;; add envelope
iattack = 0.3

inotesLeft = p6
kfreq = p5

;envelope
aenv linseg 0, iduration * iattack, iamplitude, iduration * ( 1 - iattack ), 0


ares oscil3 aenv, kfreq, 1
outs ares, ares


; gareverb = ares

if (p6 = 1) then
	schedule p1, p2, iduration, iamplitude, kNotesArray[iRandomNote] ,5
endif

if ( p6 <= 1 ) igoto bypassScheduler

		; schedule p1, 2.6, iduration, iamplitude, kNotesArray[16-p6] ,inotesLeft-1
			
		printf_i "%d note in melody", 1, inotesLeft - 1

	bypassScheduler:

endin

;------------------------------------------------------------------------------
; Envelope
;------------------------------------------------------------------------------

instr 201

;iduration random 20, 40
iduration = p3;
iamplitude = p4;

;aenv linseg 0, idur * iattack, iamp * 0dbfs, idur * ( 1 - iattack ), 0

aenv linseg 0, iduration*0.25, iamplitude, iduration* ( 0.65 ), 0.1

gaenvelope = aenv

;gaenvelope linseg 0, idur * iattack, iamp * 0dbfs, idur * ( 1 - iattack ), 0

;gaenvelope adsr 1 , 0.1 , .1 , .001

endin



</CsInstruments>
<CsScore>


; High resolution sine table
f 1 0 [2^16] 10 1 0.15
f 2 0 [2^16] 10 1 0.15 0.5 0.1

; Start Sine Box
;	p1		p2		p3		p4		p5		p6

i	201		0		240		0.5 					;Envelope
i	202		0		240		1 						;Vibrato


; i	100		10		0.2		0.2		200
i	101		0		240		0.2
i	102		5		10		0.1		0		1



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
