function v=poincare(mu,Data,v)


Tlen=Data.Tlen;
T=Data.T;

dt=Data.dt;


F=Data.F;
V=Data.V;
Enum=Data.Enum;

v0=v;

for i=1:Tlen
    %%%Nonlinear parts
    
    Fi=F(i);

    u0=v0+dt*Fi*v0/mu;
    
    %%%%Linear partss
    Vi=V(i);
    %%%% evol
    E=eye(Enum)+Vi*dt;
    v0=E\u0;
    
end
v=v0;
