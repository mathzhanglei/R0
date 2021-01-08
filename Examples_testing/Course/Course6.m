clc
clear


tic

%%%% Determain a suibable Domain
mu1=rand();
mu2=rand()+mu1;

r1=func6(mu1);
r2=func6(mu2);
while r1<1 || r2>1
    if r1<1
        mu2=mu1;
        r2=r1;
        mu1=mu1/2;
        r1=func6(mu1);
    end
    if r2>1
        mu1=mu2;
        r1=r2;
        mu2=2*mu2;
        r2=func6(mu2);
    end
    [r1 r2 mu1 mu2];
end


%%%%%Search the root
mu=(mu1+mu2)/2;
r=func6(mu);
while abs(r-1) > 10^-4 && abs(mu1-mu2) > 10^-6
    
    if r > 1
        mu1 = mu;
    else
        mu2 = mu;
    end
    
    mu=(mu1+mu2)/2;
    r=func6(mu);

   [r mu1 mu2 mu];
end
[mu,r]


toc
