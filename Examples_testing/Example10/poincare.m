function v=poincare(mu,Data,v)



Xlen=Data.Xlen;
Time=Data.Time;
X=Data.X;
Tlen=Data.Tlen;
T=Data.T;
dx=Data.dx;
dt=Data.dt;
x=Data.x;
t=Data.t;
F=Data.F;


taulen=Data.taulen;
V=Data.V;
v0=v(:,end);

for i=1:Tlen
    %%%Nonlinear parts
    
    Fi=F(:,:,i);
    v1=[v(1:Xlen,end+1-taulen);v(Xlen+1:end,end)];
    u0=v0+dt*Fi*v1/mu;
    
    %%%%Linear partss

    Vi=V(:,:,i);
    %%%% evol
    E=eye(2*Xlen)+Vi*dt;
    v0=E\u0;
    u(:,1:taulen-1)=v(:,2:taulen);
    u(:,taulen)=v0;
    v=u;
end
