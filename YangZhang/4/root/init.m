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

Data.M1=0.2*(1+0*cos(t/PT*2*pi));
Data.M2=0.3*(1+0*cos(t/PT*2*pi));
Data.f12=0.35*(1+0.8*cos(t/PT*2*pi));
Data.f21=0.5*(1+0.8*sin(t/PT*2*pi));


Data.tau=c;
Data.taulen=round(Data.tau/dt)+1;

for i=1:PTlen
    V11=Data.M1(i);
    V12=zeros(1);
    V21=zeros(1);
    V22=Data.M2(i);
    Data.V(:,:,i)=[V11,V12;V21,V22];
end
%save data
