<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

opcode assert(g:InstrDef,h:InstrDef):void
if instrnum(g) != instrnum(h) then
  prints "assert error for instrument number\n"
  exitnow(-1)
endif
S1 = str(g)
S2 = str(h)
if strcmp(S1,S2) != 0 then
  prints "assert error for instrument name\n"
  exitnow(-1)
endif
endop

instr Test
 test2:InstrDef = Test
 assert(test2, this_instr)
 schedule this_instr, 0.5, 0.5
endin

event_i "i", Test, 0, 0.5

</CsInstruments>
<CsScore>
f0 1
</CsScore>
</CsoundSynthesizer>
