clear
clc
T=12;
Tlen=2400;
dt=T/Tlen;
t=0:dt:T-dt;
tau=1;
taulen=round(tau/dt)+1;
Enum=1;
mu=1;
m= 0.2*(1+0.2*cos((t+dt)/T*2*pi));
f=0.35*(1+0.2*cos(t/T*2*pi));
%v=ones(Enum,taulen);
q=linspace(-tau,0,taulen);
v=exp(q);
v0=v(:,end);

for i=1:Tlen
    %%%Nonlinear parts

%    taulen= round(tau/dt)+1;
    Fi=f(i);
    v1=v(1,end - taulen+1)+v(1,end);
    
    u0=v0+dt*Fi*v1/mu;
    
    %%%%Linear partss
    Vi=m(i);
    %%%% evol
    E=eye(Enum) + Vi*dt;
    v0=E\u0;
    
    u(:,1:taulen-1)=v(:,2:taulen);
    u(:,taulen)=v0;
    v=u;
    VV(:,i)=v0;
end
plot(t,VV)

Data.dt=dt;
Data.T=T;
%opts = ddeset('RelTol',1e-5,'AbsTol',1e-8);
%sol = dde23(@(t,y,Z) exam5f(t,y,Z,Data),1,'exam5h',[0, T],opts);
sol = dde23(@(t,y,Z) exam5f(t,y,Z,Data),1,'exam5h',[0, T]);
hold on
plot(sol.x,sol.y,'.');