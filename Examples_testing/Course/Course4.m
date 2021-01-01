
clear
clc


X=1;
T=12;
Tlen=5000;
Xlen=50;
dx=X/(Xlen-1);
dt=T/Tlen;
x=linspace(0,X,Xlen)';
t=0:dt:T-dt;
mu=1;

%%%%%%%%%%%%%%%%%parameters

D1 = 0.01;

mx=1+rand()*cos(x*pi/2);
mtr=rand();
mt=1+mtr*cos((t+dt)/T*2*pi);

fx=1*(1+rand()*sin(x*pi/2));
ftr=rand();
ft=1+ftr*cos(t/T*2*pi);
d=ones(1,Xlen);
D_1=diag([2*d(1),d(2:Xlen-1)],1);%%%%% To generate a matrix D_1, please see help
D_2=diag([d(2:Xlen-1),2*d(Xlen)],-1);
D_3=diag(d);
D_4=diag(d);

Diff=(-D_3-D_4+D_1+D_2)/(dx)^2;

v0=ones(Xlen,1);

for i=1:Tlen
    %%%Nonlinear parts
    
    Fi=ft(i)*diag(fx);
    u0=v0+dt*Fi*v0/mu;
    
    %%%%Linear partss

    Vi=mt(i)*diag(mx)-Diff*D1;
    %%%% evol
    E=eye(Xlen)+Vi*dt;
    v0=E\u0;
    VV1(i,:)=v0;
end

v=v0;

Data.Diff=Diff;
Data.Xlen=Xlen;
Data.mx=mx;
Data.fx=fx;
Data.mu=mu;
Data.T=T;
Data.dt=dt;
Data.D1=D1;
Data.mtr=mtr;
Data.ftr=ftr;
v=ones(Xlen,1) ;
opts = odeset('RelTol',1e-2,'AbsTol',1e-8);
[TT2,VV2] = ode45(@(t,y) func4(t,y,Data),[0 T],v,opts);

plot(t(1:end),VV1(:,2),'.')
pause(0.1)
hold on
plot(TT2,VV2(:,2))
