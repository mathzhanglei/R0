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


V=Data.V;
v0=v;

for i=1:Tlen
    %%%Nonlinear parts
    
    Fi=F(:,:,i);
    u0=v0+dt*Fi*v0/mu;
    
    %%%%Linear partss

    Vi=V(:,:,i);
    %%%% evol
    E=eye(Xlen)+Vi*dt;
    v0=E\u0;
end

v=v0;
