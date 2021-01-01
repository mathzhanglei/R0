clear
clc


T=12;
Tlen=1000;
dt=T/Tlen;
t=0:dt:T-dt;
Enum=1;
m=0.2*(1+0.2*cos((t+dt)/T*2*pi));
f=0.35*(1+0.2*sin(t/T*2*pi));
v0=ones(Enum,1);
mu=1.7;

for i=1:Tlen
    %%%Nonlinear parts
    
    Fi=f(i);

    u0=v0+dt*Fi*v0/mu;
    
    %%%%Linear partss
    Vi=m(i);
    %%%% evol
    E=eye(Enum)+Vi*dt;
    v0=E\u0;
    VV1(i,:)=v0;
end
v=v0


v=1 ;
opts = odeset('RelTol',1e-2,'AbsTol',1e-8);
[TT2,VV2] = ode45(@(t,y) func2(t,y,mu,T),[0 T],v,opts);
VV2(end)

plot(t(1:end),VV1)
hold on
plot(TT2,VV2)
