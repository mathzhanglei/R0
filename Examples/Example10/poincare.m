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

U=zeros(2*Xlen,taulen+Tlen);
U(:,1:taulen)=v;
for i=1:Tlen
    %%%Nonlinear parts
    j=i+taulen-1;
    Fi=F(:,:,i);
    v1=[U(1:Xlen,j+1-taulen);U(Xlen+1:end,j)];
    u0=U(:,j)+dt*Fi*v1/mu;
    
    %%%%Linear partss

    Vi=V(:,:,i);
    %%%% evol
    E=eye(2*Xlen)+Vi*dt;
    U(:,j+1)=E\u0;

end
v=U(:,end-taulen+1:end);
