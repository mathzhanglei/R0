clc
clear




Time=20;
Xlen1=30;
PTlen1=800;
C=[0 0 1];
Data=init(Time,PTlen1,Xlen1,C);%%% fast


tic
r=com_r(1,Data);
toc
log(r)/12
