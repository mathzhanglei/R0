function Data=init(Time,Tlen,C)%%%%%%%initial


T=12;
dt=T/Tlen;
t=0:dt:T-dt;
Data.Enum=2;%%The number of equations


Data.Time=Time;

Data.Tlen=Tlen;
Data.T=T;
Data.dt=dt;
Data.t=t;

%%%%%%%%%%%%%%%%%parameters





Data.M1= 0.2*(1+0.8*cos((t+dt)/T*2*pi));
Data.M2= 0.3*(1+0.8*cos((t+dt)/T*2*pi));
Data.f12=0.35*(1+0.8*cos(t/T*2*pi));
Data.f21=0.5*(1+0.8*sin(t/T*2*pi));


Data.tau=max([funtaut1(Data,t),funtaut2(Data,t)]);
Data.taulen=round(Data.tau/dt)+1;




%save data
