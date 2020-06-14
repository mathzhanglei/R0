function r=com_r(mu,Data)


%%%%% initial data
v=ones(Data.Xlen*2,Data.taulen);

%%%%Iteration
for j=1:Data.Time
    %%%%%Evolution progress
    v=poincare(mu,Data,v);
    index(j)=max(max(v));
    v=v/index(j);
    
    %%%% condition to break
    if j>1 && abs(index(j)-index(j-1))<10^(-5)   
        break
    end
    
%    if index(j)>2 || index(j)<0.99
%        break
%    end
        
end
r=index(end);

[mu r j]
