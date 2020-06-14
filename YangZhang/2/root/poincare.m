function v=poincare(mu,Data,v)




Time=Data.Time;
PTlen=Data.PTlen;
PT=Data.PT;

dt=Data.dt;

t=Data.t;
f12=Data.f12;
f21=Data.f21;
M2=Data.M2;
M1=Data.M1;

v0=v;

for i=1:PTlen
    %%%Nonlinear parts
    
    F12=1/mu * f12(i);
    F21=1/mu * f21(i);
    u0=v0+dt*[F12*v(2);F21*v(1)];
    
    %%%%Linear partss
    V11=-M1(i);
    V12=zeros(1);
    V21=zeros(1);
    V22=-M2(i);
    V=[V11,V12;V21,V22];
    %%%% evol
    E=eye(2)-V*dt;
    v0=E\u0;
    
    v=v0;
end
