function Data=init(Time,Tlen,Xlen,c)%%%%%%%initial

X=1;
T=12;
dx=X/(Xlen-1);
dt=T/Tlen;
x=linspace(0,X,Xlen)';
t=0:dt:T-dt;
Enum=2;

Data.Xlen=Xlen;
Data.Time=Time;
Data.X=X;
Data.Tlen=Tlen;
Data.T=T;
Data.dx=dx;
Data.dt=dt;
Data.x=x;
Data.t=t;
Data.Enum=Enum;
%%%%%%%%%%%%%%%%%parameters




D1 = 0.01;
D2 = 0.02;


mx1=1+0.5*cos(x*pi/2);
mt1= 1*(1+0.5*cos((t+dt)/T*pi*2));

mx2=1+0.5*sin(x*pi/2);
mt2= 1*(1+0.5*cos((t+dt)/T*2*pi));

f12x=1*(1+0.5*cos(x*pi/2));
f12t=1*(1+0.5*sin(t/T*pi*2));

f21x=1*(1+0.5*sin(x*pi/2));
f21t=1*(1+0.5*sin(t/T*pi*2));




%%%%%%%%%%%%%%%%%%%%%%init Diff


d=ones(1,Xlen);
D_1=diag([2*d(1),d(2:Xlen-1)],1);%%%%% To generate a matrix D_1, please see help
D_2=diag([d(2:Xlen-1),2*d(Xlen)],-1);
D_3=diag(d);
D_4=diag(d);

Diff=(-D_3-D_4+D_1+D_2)/(Data.dx)^2;
clear D_1 D_2 D_3 D_4
V=zeros(Xlen*Enum,Xlen*Enum,Tlen);
F=zeros(Xlen*Enum,Xlen*Enum,Tlen);
for i=1:Tlen
    V11=mt1(i)*diag(mx1)-Diff*D1;
    V22=mt2(i)*diag(mx2)-Diff*D2;
    V12=zeros(Xlen);
    V21=zeros(Xlen);
    Vi=[V11,V12;V21,V22];
    V(:,:,i)=Vi;
    F11=zeros(Xlen);
    F22=zeros(Xlen);
    F12=diag(f12x*f12t(i));
    F21=diag(f21x*f21t(i));
    Fi=[F11,F12;F21,F22];
    F(:,:,i)=Fi;
end
Data.V=V;
Data.F=F;
%save data
