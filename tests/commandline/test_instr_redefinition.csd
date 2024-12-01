<CsoundSynthesizer>
<CsOptions>
-n --allow-redefinition
</CsOptions>
<CsInstruments>
0dbfs = 1

givar init 0
instr 1
givar = 1
endin

instr 1
givar = 2
endin

instr 2
if givar != 2 then
  exitnow(-1)
endif
print givar
endin


</CsInstruments>
<CsScore>
i1 0 1
i2 1 1
</CsScore>
</CsoundSynthesizer>
