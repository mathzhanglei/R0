function dy = func(t,y,Data)
Diff=Data.Diff;
Xlen=Data.Xlen;
mx=Data.mx;
fx=Data.fx;
mu=Data.mu;
T=Data.T;
dt=Data.dt;
D1=Data.D1;
dy = zeros(Xlen,1);    % a column vector
ft=1+Data.ftr*cos(t/T*2*pi);
mt=1+Data.mtr*cos((t+dt)/T*2*pi);
V= mt*diag(mx)-Diff*D1;
F= ft*diag(fx);
dy = -V*y + F*y/mu;

