function v=poincare(mu,Data,v)



Xlen=Data.Xlen;
Time=Data.Time;
X=Data.X;
PTlen=Data.PTlen;
PT=Data.PT;
dx=Data.dx;
dt=Data.dt;
x=Data.x;
t=Data.t;
f12=Data.f12;
f21=Data.f21;

V=Data.V;
v0=v;

for i=1:PTlen
    %%%Nonlinear parts
    
    F12=1/mu * diag(f12(i));
    F21=1/mu * diag(f21(i));
    u0=v0+dt*[F12*v0(Xlen+1:end);F21*v0(1:Xlen)];
    
    %%%%Linear partss

    Vi=V(:,:,i);
    %%%% evol
    E=eye(2*Xlen)+Vi*dt;
    v0=E\u0;
end

v=v0;
