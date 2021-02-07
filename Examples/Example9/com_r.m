function r=com_r(mu,Data)


%%%%% initial data
v=ones(Data.Xlen*Data.Enum,1);

%%%%Iteration
for j=1:Data.Time
    %%%%%Evolution progress
    v=poincare(mu,Data,v);
    index(j)=max(v);
    v=v/index(j);
    
    %%%% condition to break
    if j>1 && abs(index(j)-index(j-1))<10^(-5)   
        break
    end
    
end
r=index(end);

[mu r j];
