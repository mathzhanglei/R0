function v = exam5f(t,y,Z,Data)
dt=Data.dt;
T=Data.T;
ylag1 = Z(:,1);
v = zeros(1,1);
ft=0.35*(1+0.2*cos(t/T*2*pi));
mt=0.2*(1+0.2*cos((t+dt)/T*2*pi));
v(1) = -mt*y(1)+ ft*( ylag1(1)+ y(1));