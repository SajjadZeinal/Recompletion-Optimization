RECOMP_TOP_BLOCK_DEPTH = 15020;
global attempt2 NPV_MATRIX
NPV_MATRIX=0;
attempt2 = 1;
for ii = 100:200:2600
    x=[ii,RECOMP_TOP_BLOCK_DEPTH];
    cal_NPV=NPV_2_Var(x);
end