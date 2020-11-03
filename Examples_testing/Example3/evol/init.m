function Data=init(Time,Tlen,c)%%%%%%%initial


T=12;
dt=T/Tlen;
t=0:dt:T-dt;



Data.Time=Time;

Data.Tlen=Tlen;
Data.T=T;
Data.dt=dt;
Data.t=t;

%%%%%%%%%%%%%%%%%parameters





m1=0.2*(1+0.8*cos((t+dt)/T*2*pi));
m2=0.3*(1+0.8*cos((t+dt)/T*2*pi));
f12=0.35*(1+0.8*cos(t/T*2*pi));
f21=0.5*(1+0.8*sin(t/T*2*pi));
Enum=2;%%% the number of equations
Data.Enum=Enum;

V=zeros(Enum,Enum,Tlen);
for i=1:Tlen
    V11=m1(i);
    V12=zeros(1);
    V21=zeros(1);
    V22=m2(i);
    Vi=[V11,V12;V21,V22];
    
    F11=zeros(1);
    F12=f12(i);
    F21=f21(i);
    F22=zeros(1);
    Fi=[F11,F12;F21,F22];
    
    V(:,:,i)=Vi;
    F(:,:,i)=Fi;
end
Data.V=V;
Data.F=F;




%save data
