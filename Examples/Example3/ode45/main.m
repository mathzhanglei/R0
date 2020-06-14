clc
clear

%%%%%%Initial parts
Time=200;
Tlen=1000;


tic
C=[0 0 1];%%%%% in this program, it is useless
Data=init();



%%%% Determain a suibable Domain
mu1=rand();
mu2=rand()+mu1;

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
    [r1 r2 mu1 mu2];
end


%%%%%Search the root
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

   [r mu1 mu2 mu]
end
[mu,r]


toc
