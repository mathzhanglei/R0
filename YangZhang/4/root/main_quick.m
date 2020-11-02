clc
clear




Time=20;
PTlen=8000;


tic
C=1:60;
C=C/30;
RR0=zeros(1,length(C));
for k=1:length(C)
    c=C(k);
    Data=init(Time,PTlen,c);
    
    if k==1
        mu1=0.1;
        mu2=10;
    else
        mu1=RR0(k-1)/1.05;
        mu2=RR0(k-1)*1.05;
    end
    
    r1=com_r(mu1,Data);%%%fast
    r2=com_r(mu2,Data);%%%fast
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
        [r1 r2 mu1 mu2];
    end
    
    
    mu=(mu1+mu2)/2;
    r=com_r(mu,Data);%%%fast
    while abs(r-1) > 10^-4 && abs(mu1-mu2) > 10^-6
        
        if r > 1
            mu1 = mu;
        else
            mu2 = mu;
        end
        
        mu=(mu1+mu2)/2;
        r=com_r(mu,Data);%%%fast
        
        [r mu1 mu2 mu];
    end
    [mu,r,c,k]
    RR0(k)=mu;
save dataroot C RR0
end
programetime=toc
save dataold C RR0 programetime
