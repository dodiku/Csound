<CsoundSynthesizer>
<CsInstruments>
sr     = 44100
kr     = 4410
ksmps  = 10
nchnls = 2
0dbfs = 1.0


instr 102

inoteC = cpspch (7.0)
inoteD = cpspch (3.2)
kNotesArray[] init 2
kNotesArray[] fillarray inoteC, inoteD
iRandomNote random 0, 1

; kNotesArray[] init 16
; kNotesArray[] fillarray 196, 261, 330, 261, 349, 330, 261, 196,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0

iduration = p3
iamplitude = p4 ;;;; add envelope
iattack = 0.5

inotesLeft = p6
; kfreq = p5
kfreq = inoteC

;envelope
aenv linseg 0, iduration * iattack, iamplitude, iduration * ( 1 - iattack ), 0


ares oscil3 aenv, kfreq, 2
outs ares, ares


; gareverb = ares

; if (p6 = 1) then
; 	schedule p1, p2, iduration, iamplitude, kNotesArray[iRandomNote] ,5
; endif

; if ( p6 <= 1 ) igoto bypassScheduler

; 		schedule p1, 2.6, iduration, iamplitude, kNotesArray[iRandomNote] ,inotesLeft-1
			
; 		printf_i "%d note in melody", 1, inotesLeft - 1

; 	bypassScheduler:

endin



</CsInstruments>
<CsScore>


; High resolution sine table
f 1 0 [2^16] 10 1 0.15
f 2 0 [2^16] 10 1 0.15 0.5 0.1


;	p1		p2		p3		p4		p5		p6

; i	201		0		240		0.5 					;Envelope
; i	202		0		240		1 						;Vibrato


; i	100		10		0.2		0.2		200
; i	101		0		240		0.2
i	102		0		10		0.2		0		1



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
