function Data=init(Time,PTlen,Xlen,c)%%%%%%%initial

X=1;
PT=12;
dx=X/(Xlen-1);
dt=PT/PTlen;
x=linspace(0,X,Xlen)';
t=0:dt:PT-dt;


Data.Xlen=Xlen;
Data.Time=Time;
Data.X=X;
Data.PTlen=PTlen;
Data.PT=PT;
Data.dx=dx;
Data.dt=dt;
Data.x=x;
Data.t=t;

%%%%%%%%%%%%%%%%%parameters




D1 = 0.01;
D2 = 0.02;
M1= 0.2*(1+c*cos(t/PT*2*pi));
m1=1+c*cos(x/X*2*pi);
M2= 0.3*(1+c*cos(t/PT*2*pi));
m2=1+c*sin(x/X*2*pi);

Data.f12=0.35*(1+c*cos(t/PT*2*pi));
Data.f21=0.5*(1+c*sin(t/PT*2*pi));




%%%%%%%%%%%%%%%%%%%%%%init Diff


d=ones(1,Xlen);
D_1=diag([2*d(1),d(2:Xlen-1)],1);%%%%% To generate a matrix D_1, please see help
D_2=diag([d(2:Xlen-1),2*d(Xlen)],-1);
D_3=diag(d);
D_4=diag(d);

Diff=(-D_3-D_4+D_1+D_2)/(Data.dx)^2;
clear D_1 D_2 D_3 D_4
V=zeros(Xlen*2,Xlen*2,PTlen);
for i=1:PTlen
    V11=M1(i)*diag(m1)-Diff*D1;
    V22=M2(i)*diag(m2)-Diff*D2;
    V12=zeros(Xlen);
    V21=zeros(Xlen);
    Vi=[V11,V12;V21,V22];
    V(:,:,i)=Vi;
end
Data.V=V;
%save data
