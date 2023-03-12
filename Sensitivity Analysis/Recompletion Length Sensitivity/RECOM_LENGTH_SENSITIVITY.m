RECOMP_TIME = 1000;
global attempt2 NPV_MATRIX
NPV_MATRIX=0;
attempt2 = 1;
for ii = 15035:-4:15002
    x=[RECOMP_TIME,ii];
    cal_NPV=NPV_2_Var(x);
end