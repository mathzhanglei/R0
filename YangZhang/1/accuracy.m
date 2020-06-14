
clear
%%%%initial
tic
PTlen=8000;
Xlen=1;
Xnum=1;
PT=12;

Rnum=20;

dt=PT/PTlen;
t=0:dt:PT-dt;
C=linspace(0,0.95,100);

for ii=1:100
    c=C(ii);
    M= 0.2*(1+c*cos(t/PT*2*pi));
    f=0.35*(1+c*cos(t/PT*2*pi));
    
    UU=ones(Xlen*Xnum,PTlen);
    W=ones(Xlen*Xnum,PTlen);
    U=ones(Xlen*Xnum,PTlen);
    %%%Step1
    V=zeros(Xlen*Xnum,Xlen*Xnum,PTlen);
    F=zeros(Xlen*Xnum,Xlen*Xnum,PTlen);
    Q=zeros(Xlen*Xnum,Xlen*Xnum,PTlen);
    for i=1:PTlen
        Vi=M(i);
        Fi=f(i);
        V(:,:,i)=Vi;
        F(:,:,i)=Fi;
        Qi=eye(Xlen*Xnum)+Vi*dt;
        Q(:,:,i)=Qi;
    end
    clear Fi Vi Qi
    
    R=zeros(Xlen*Xnum,Xlen*Xnum,PTlen);
    R(:,:,PTlen)=eye(Xlen*Xnum);
    for i=PTlen-1:-1:1
        Qi=Q(:,:,i);
        Pi=Qi\eye(Xlen*Xnum);
        Ri=R(:,:,i+1)*Pi;
        R(:,:,i)=Ri;
    end
    
    r=rand(1,Rnum);
    r0=rand(1,Rnum);
    
    for j=1:Rnum
        v0=R(:,:,i)*F(:,:,1)*UU(:,1);
        for i=2:PTlen-1
            v0=v0+R(:,:,i)*F(:,:,i)*UU(:,i);
        end
        v0=v0+R(:,:,end)*F(:,:,end)*UU(:,end);
        v0=v0*dt;
        v0=(eye(Xlen*Xnum)-R(:,:,1))\v0;
        
        for i=1:PTlen
            %%%Nonlinear parts
            
            u0=v0+F(:,:,i)*UU(:,i)*dt;
            
            %%%% evol
            E=eye(Xlen*Xnum)+V(:,:,i)*dt;
            v0=E\u0;
            U(:,i)=v0;
            v=v0;
        end
        r(j)=max(max(U));
        UU=U/r(j);
        if j>2
            if abs(r(j)-r(j-1))<10^(-4)
                break
            end
        end
    end
    R0=r(j);
    RR0(ii)=R0;
end
toc
save data RR0 C
mean(abs(RR0))
mean(abs(RR0-1.75))/1.75*100