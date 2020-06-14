
clear
%%%%initial
tic
PTlen=8000;
Xlen=1;
Xnum=2;
PT=12;

Rnum=20;

dt=PT/PTlen;
t=0:dt:PT-dt;
C=1:60;
C=C/30;
RR0=zeros(1,length(C));
for ii=1:length(C)
    c=C(ii);
    tau=c;
    taulen=round(tau/dt)+1;
    index(2,:)=[1:PTlen];
    index(1,:)=[1:PTlen]-taulen+1;
    for i=1:taulen-1
        index(1,i)=index(1,i)+PTlen;
    end
    
    M1= 0.2*(1+0*cos(t/PT*2*pi));
    M2= 0.3*(1+0*cos(t/PT*2*pi));
    f12=0.35*(1+0.8*cos(t/PT*2*pi));
    f21=0.5*(1+0.8*sin(t/PT*2*pi));
    % f12(1:Tlen/2)=0.7;
    % f12(Tlen/2+1:end)=0;
    % f12(1:Tlen/2)=0.7;
    % f12(Tlen/2+1:end)=0;
    
    UU=ones(Xlen*Xnum,PTlen);
    W=ones(Xlen*Xnum,PTlen);
    U=ones(Xlen*Xnum,PTlen);
    %%%Step1
    V=zeros(Xlen*Xnum,Xlen*Xnum,PTlen);
    F=zeros(Xlen*Xnum,Xlen*Xnum,PTlen);
    Q=zeros(Xlen*Xnum,Xlen*Xnum,PTlen);
    for i=1:PTlen
        
        Vi=[M1(i) 0;0 M2(i)];
        Fi=[0 f12(i); f21(i) 0];
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
    
    for j=1:20
        uu=[UU(1,index(1,1));UU(2,index(2,1))];
        v0=R(:,:,1)*F(:,:,1)*uu/2;
        for i=2:PTlen-1
            uu=[UU(1,index(1,i));UU(2,index(2,i))];
            v0=v0+R(:,:,i)*F(:,:,i)*uu;
        end
        uu=[UU(1,index(1,end));UU(2,index(2,end))];
        v0=v0+R(:,:,end)*F(:,:,end)*uu/2;
        v0=v0*dt;
        v0=(eye(Xlen*Xnum)-R(:,:,1))\v0;
        
        for i=1:PTlen
            %%%Nonlinear parts
            uu=[UU(1,index(1,i));UU(2,index(2,i))];
            u0=v0+F(:,:,i)*uu*dt;
            
            %%%% evol
            E=eye(Xlen*Xnum)+V(:,:,i)*dt;
            v0=E\u0;
            U(:,i)=v0;
            v=v0;
        end
        r(j)=max(max(U));
        UU=U/r(j);
        if j>2
            r0(j)=r(j)*r(j-1);
            if abs(r0(j)-r0(j-2))<10^(-4)
                break
            end
        end
    end
    R0=r0(j)^(1/Xnum);
    RR0(ii)=R0;
[R0,ii]
save datadirect C RR0 
end
programetime=toc
save datanew C RR0 programetime
