function v=poincare(mu,Data,v)




Time=Data.Time;
PTlen=Data.PTlen;
PT=Data.PT;

dt=Data.dt;

t=Data.t;
f12=Data.f12;
f21=Data.f21;
V=Data.V;
taulen=Data.taulen;

v0=v(:,end);

for i=1:PTlen
    %%%Nonlinear parts
    
    F12=1/mu * f12(i);
    F21=1/mu * f21(i);

    u0=v0+dt*[F12*v(2,end);F21*v(1,end - taulen+1)];
    
    %%%%Linear partss

    Vi=V(:,:,i);
    %%%% evol
    E=eye(2)+Vi*dt;
    v0=E\u0;
    
    u(:,1:taulen-1)=v(:,2:taulen);
    u(:,taulen)=v0;
    v=u;
end