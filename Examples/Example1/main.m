clear
clc

Len=3;
V=[1 0 0; 0 2 0; 0 0 3];    % evolution matrix, -V is cooperative
F=[0 0 1;1 0 0; 0 1 0];     % infection matrix
Time=1000;

%%%%% initial data
%v=ones(Len,1);
v=[1;1;1];
%%%%Iteration
for j=1:Time
    
    u=(V\F+eye(Len))*v;
    index(j)=max(u);
    v=u/index(j);
    
    %%%% condition to break
    if j>1 && abs(index(j)-index(j-1))<10^(-5)   
        break
    end
    
end

R0=index(end)-1

max(real(eig(V\F)))
(1/6)^(1/3)
