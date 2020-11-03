function v=poincare(mu,Data,v)

Time=Data.Time;
Tlen=Data.Tlen;
T=Data.T;

dt=Data.dt;

t=Data.t;
f12=Data.f12;
f21=Data.f21;
M2=Data.M2;
M1=Data.M1;
taulen=Data.taulen;


v0=v(:,end);

for i=1:Tlen
    %%%Nonlinear parts
    
    F12=1/mu * f12(i);
    F21=1/mu * f21(i);
    taut1=funtaut1(Data,i*dt);
    taut2=funtaut2(Data,i*dt);
    taut1len= round(taut1/dt)+1;
    taut2len= round(taut2/dt)+1;
    u0=v0+dt*[F12*v(2,end-taut2len+1);F21*v(1,end - taut1len+1)];
    
    %%%%Linear partss
    V11=M1(i);
    V12=zeros(1);
    V21=zeros(1);
    V22=M2(i);
    V=[V11,V12;V21,V22];
    %%%% evol
    E=eye(2) + V*dt;
    v0=E\u0;
    
    u(:,1:taulen-1)=v(:,2:taulen);
    u(:,taulen)=v0;
    v=u;
end
