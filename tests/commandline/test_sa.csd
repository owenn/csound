<CsoundSynthesizer>
<CsOptions>
-n --sample-accurate
</CsOptions>
<CsInstruments>
0dbfs = 1
ksmps = 10

opcode Test,0,i
 i1 xin
 ioffs offsetsmps
 if ioffs != i1 then
  exitnow(-1)
 else
  print ioffs
 endif
endop

instr 1
 ioffs offsetsmps
 if ioffs == 0 then
  exitnow(-1)
 else
  print ioffs
endif
Test ioffs
endin

schedule(1,6/sr,0.5)
</CsInstruments>
<CsScore>
f 0 1
</CsScore>
</CsoundSynthesizer>