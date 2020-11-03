function v=poincare(mu,Data,v)

Time=Data.Time;
Tlen=Data.Tlen;
T=Data.T;

Enum=Data.Enum;
dt=Data.dt;

t=Data.t;

taulen=Data.taulen;
tau1=Data.tau1;
tau2=Data.tau2;

F=Data.F;
V=Data.V;

v0=v(:,end);

for i=1:Tlen
    %%%Nonlinear parts

    taulen1= round(tau1/dt)+1;
    taulen2= round(tau2/dt)+1;
    Fi=F(:,:,i);
    v1=[v(1,end - taulen1+1);v(2,end-taulen2+1)];
    
    u0=v0+dt*Fi*v1/mu;
    
    %%%%Linear partss
    Vi=V(:,:,i);
    %%%% evol
    E=eye(Enum) + Vi*dt;
    v0=E\u0;
    
    u(:,1:taulen-1)=v(:,2:taulen);
    u(:,taulen)=v0;
    v=u;
end
