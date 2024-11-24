<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
 myInstrument:InstrDef = createinstr({{
  out oscili(p4,p5)
 }})
 myInstance:Instr = perf(myInstrument, 0dbfs/2, 440)
 turnoff(myInstance, times:k() > 1 ? 1 : 0)
endin

</CsInstruments>
<CsScore>
i1 0 2
</CsScore>
</CsoundSynthesizer>
