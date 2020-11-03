function dy = func(t,y,mu,T)
dy = zeros(2,1);    % a column vector
m1= 0.2*(1+0.8*cos(t/T*2*pi));
m2= 0.3*(1+0.8*cos(t/T*2*pi));
f12=0.35*(1+0.8*cos(t/T*2*pi));
f21=0.5*(1+0.8*sin(t/T*2*pi));
dy(1) = -m1*y(1) + f12*y(2)/mu;
dy(2) = f21*y(1)/mu - m2*y(2);
