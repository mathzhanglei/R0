clc
clear

%%%%%%Initial parts
Time=200;
Tlen=1000;
C=[0 0 1];%%%%% in this program, it is useless
Data=init(Time,Tlen,C);
mu1=rand();
v=ones(Data.Enum,1);
v=poincare(mu1,Data,v);
r1=com_r(mu1,Data);

