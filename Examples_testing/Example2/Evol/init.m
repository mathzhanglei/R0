function Data=init(Time,Tlen,C)%%%%%%%initial


T=12;
dt=T/Tlen;
t=0:dt:T-dt;
Enum=1;%the number of the equation


Data.Time=Time;

Data.Tlen=Tlen;
Data.Enum=Enum;
Data.T=T;
Data.dt=dt;
Data.t=t;

%%%%%%%%%%%%%%%%%parameters





m=0.2*(1+0.2*cos((t+dt)/T*2*pi));

f=0.35*(1+0.2*cos(t/T*2*pi));

Data.V=m;
Data.F=f;







%save data
