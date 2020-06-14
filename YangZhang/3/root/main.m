clc
clear




Time=20;
Xlen=80;
PTlen=8000;


tic


C=linspace(0,0.95,100);


RR0=zeros(length(C),1);

%parfor k=1:length(Para)
for k=1:length(C)
    c=C(k);
    Data=init(Time,PTlen,Xlen,c);
    
    mu1=0.1;
    mu2=10;
    
    r1=com_r(mu1,Data);
    r2=com_r(mu2,Data);
    while r1<1 || r2>1
        if r1<1
            mu2=mu1;
            r2=r1;
            mu1=mu1/2;
            r1=com_r(mu1,Data);
        end
        if r2>1
            mu1=mu2;
            r1=r2;
            mu2=2*mu2;
            r2=com_r(mu2,Data);
        end
    end
    
    
    mu=(mu1+mu2)/2;
    r=com_r(mu,Data);
    while abs(r-1) > 10^-4 && abs(mu1-mu2) > 10^-6
        
        if r > 1
            mu1 = mu;
        else
            mu2 = mu;
        end
        
        mu=(mu1+mu2)/2;
        r=com_r(mu,Data);
        
        
    end
    [mu,r,c,k]
    RR0(k)=mu;
save dataroot C RR0
end
programetime=toc
save dataold C RR0 programetime

