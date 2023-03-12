function [RECOMP_BLOCK_NO,LENGTH_RECOMPLETED_BLOCK] =FUN_RECOMP_TRANSLATION_DEPTH(RECOMP_TOP_BLOCK_DEPTH,OIL_BOTTOM_COMPLETION_DEPTH)
%This Function converts recompletion depth to block Number.
PLUG_LENGTH = OIL_BOTTOM_COMPLETION_DEPTH - RECOMP_TOP_BLOCK_DEPTH;

for ii = 0:5:45
if PLUG_LENGTH <= (ii+5) && PLUG_LENGTH > ii
   RECOMP_BLOCK_NO = (ii+5)/5;
   LENGTH_RECOMPLETED_BLOCK = PLUG_LENGTH/RECOMP_BLOCK_NO;
end
end


end
