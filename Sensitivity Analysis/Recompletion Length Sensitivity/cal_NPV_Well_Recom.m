function [NPV,totNPV,QOP,QWp,days,WBHP,WOPT,WWCT]= cal_NPV_Well_Recom
%All the prices are calculated based on 2016 prices
b=2.78;%global inflation rate(percent)
r0=50;%$/STB
rsepw=6;%$/STB
%riw=0.5;%$/STB
%rio=1;%$/STB
rates=dataimport_WELL_RECOM;
days=rates(:,1);
firstyear=1989;
totaltime=2016-firstyear;
tk = totaltime - days./365;
for ii=2:length(days)
    delt(ii)=days(ii)-days(ii-1);
end
delt=delt';
QOP=rates(:,3);
QWp=rates(:,4);
WWCT=rates(:,5);
WBHP=rates(:,6);
WOPT=rates(:,7);
NPV=delt.*(QOP*r0-QWp*rsepw)./(1+b/100).^tk;
totNPV=sum(NPV);
end
