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

taulen=Data.taulen;
V=Data.V;
v0=v(:,end);

for i=1:PTlen
    %%%Nonlinear parts
    
    F12=1/mu * diag(f12(i));
    F21=1/mu * diag(f21(i));
    u0=v0+dt*[F12*v(Xlen+1:end,end);F21*v(1:Xlen,end+1-taulen)];
    
    %%%%Linear partss

    Vi=V(:,:,i);
    %%%% evol
    E=eye(2*Xlen)+Vi*dt;
    v0=E\u0;
    u(:,1:taulen-1)=v(:,2:taulen);
    u(:,taulen)=v0;
    v=u;
end
