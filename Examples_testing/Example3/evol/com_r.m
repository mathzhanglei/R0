function r=com_r(mu,Data)


%%%%% initial data
v=ones(Data.Enum,1);

%%%%Iteration
for j=1:Data.Time
    %%%%%Evolution progress
    u=poincare(mu,Data,v);
    indexmax(j)=max(max(u./v));
    indexmin(j)=min(min(u./v));
    %%%% condition to break
    
    if indexmax(j)<1-10^-4
        index(j)=indexmax(j);
        break
    elseif indexmin(j)>1+10^-4
        index(j)=indexmax(j);
        break
    else
        index(j)=max(max(u));
    end
    
    if indexmax(j)-indexmin(j)<10^-5
        break
    end
    v=u/index(j);
    
    
end
r=index(end);

[mu r j];
