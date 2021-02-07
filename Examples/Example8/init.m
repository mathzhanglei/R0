function Data=init(Time,Tlen,Xlen,c)%%%%%%%initial

X=1;
T=12;
dx=X/(Xlen-1);
dt=T/Tlen;
x=linspace(0,X,Xlen)';
t=0:dt:T-dt;
Enum=1;

Data.Xlen=Xlen;
Data.Time=Time;
Data.X=X;
Data.Tlen=Tlen;
Data.T=T;
Data.dx=dx;
Data.dt=dt;
Data.x=x;
Data.t=t;
Data.Enum=1;

%%%%%%%%%%%%%%%%%parameters




D1 = 0.01;

mx=1+0.5*cos(x*pi/2);
mt=1+0.5*cos((t+dt)/T*2*pi);



fx=1*(1+0.5*sin(x*pi/2));
ft=1+0.5*cos(t/T*2*pi);





%%%%%%%%%%%%%%%%%%%%%%init Diff


d=ones(1,Xlen);
D_1=diag([2*d(1),d(2:Xlen-1)],1);%%%%% To generate a matrix D_1, please see help
D_2=diag([d(2:Xlen-1),2*d(Xlen)],-1);
D_3=diag(d);
D_4=diag(d);

Diff=(-D_3-D_4+D_1+D_2)/(Data.dx)^2;
clear D_1 D_2 D_3 D_4
V=zeros(Xlen,Xlen,Tlen);
for i=1:Tlen
    Vi=mt(i)*diag(mx)-Diff*D1;
    Fi=ft(i)*diag(fx);

    V(:,:,i)=Vi;
    F(:,:,i)=Fi;
end
Data.V=V;
Data.F=F;
%save data
