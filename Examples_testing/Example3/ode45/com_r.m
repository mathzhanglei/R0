function r=com_r(mu,Data)
T=Data.T;
%oTions = odeset('RelTol',1e-8,'AbsTol',[1e-8 1e-8]);

v=[1 ;0];
[TT,v] = ode45(@(t,y) func(t,y,mu,T),[0 T],v);
V(:,1)=v(end,:)';
v=[0 ;1];
[TT,v] = ode45(@(t,y) func(t,y,mu,T),[0 T],v);
V(:,2)=v(end,:)';
r=max(eig(V))


[mu r j];
