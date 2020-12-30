function dy = func(t,y,mu,T)
dy = zeros(1,1);    % a column vector
m= 0.2*(1+0.2*cos(t/T*2*pi));
f= 0.35*(1+0.2*sin(t/T*2*pi));
dy = -m*y(1) + f*y(1)/mu;

