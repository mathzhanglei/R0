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

U=zeros(Data.Enum,taulen+Tlen);
U(:,1:taulen)=v;

for i=1:Tlen
    %%%Nonlinear parts
    j=i+taulen-1;
    taulen1= round(tau1/dt)+1;
    taulen2= round(tau2/dt)+1;
    Fi=F(:,:,i);
    v1=[U(1,j - taulen1+1);U(2,j-taulen2+1)];
    
    u0=U(:,j)+dt*Fi*v1/mu;
    
    %%%%Linear partss
    Vi=V(:,:,i);
    %%%% evol
    E=eye(Enum) + Vi*dt;
    U(:,j+1)=E\u0;
    
end
v=U(:,end-taulen+1:end);
