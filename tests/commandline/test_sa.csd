<CsoundSynthesizer>
<CsOptions>
-n --sample-accurate
</CsOptions>
<CsInstruments>
0dbfs = 1
ksmps = 10

opcode Test,0,ik
 i1,k1 xin
 ioffs offsetsmps
 if ioffs != i1 then
  exitnow(-1)
 else
  print ioffs
 endif
 kearly earlysmps
 if kearly != k1 then
  schedulek(2,0,0)
 else
  printk2 kearly
 endif
endop

instr 1
 ioffs offsetsmps
 if ioffs == 0 then
  exitnow(-1)
 else
  print ioffs
 endif

kearly earlysmps
Test ioffs,kearly

if release() != 0 then
 if kearly == 0 then
  schedulek(2,0,0)
 else
  printk2 kearly
 endif
endif

endin

instr 2
exitnow(-1)
endin

schedule(1,6/sr,0.5)
</CsInstruments>
<CsScore>
f 0 1
</CsScore>
</CsoundSynthesizer>

