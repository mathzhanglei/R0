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



U=zeros(Data.Enum,taulen+Tlen);
U(:,1:taulen)=v;
for i=1:Tlen
    %%%Nonlinear parts
    j=i+taulen-1;
    F12=1/mu * f12(i);
    F21=1/mu * f21(i);
    taut1=funtaut1(Data,i*dt);
    taut2=funtaut2(Data,i*dt);
    taut1len= round(taut1/dt)+1;
    taut2len= round(taut2/dt)+1;
    u0=U(:,j)+dt*[F12*U(2,j-taut2len+1);F21*U(1,j - taut1len+1)];
    
    %%%%Linear partss
    V11=M1(i);
    V12=zeros(1);
    V21=zeros(1);
    V22=M2(i);
    V=[V11,V12;V21,V22];
    %%%% evol
    E=eye(2) + V*dt;
    U(:,j+1)=E\u0;
    

end
v=U(:,end-taulen+1:end);
