function Data=init(Time,PTlen,c)%%%%%%%initial


PT=12;
dt=PT/PTlen;
t=0:dt:PT-dt;



Data.Time=Time;

Data.PTlen=PTlen;
Data.PT=PT;
Data.dt=dt;
Data.t=t;

%%%%%%%%%%%%%%%%%parameters





Data.M1=0.2*(1+c*cos(t/PT*2*pi));
Data.M2=0.3*(1+c*cos(t/PT*2*pi));
Data.f12=0.35*(1+c*cos(t/PT*2*pi));
Data.f21=0.5*(1+c*sin(t/PT*2*pi));








%save data
