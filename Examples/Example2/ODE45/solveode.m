%%% this file tell us how to solve an ODE by Matlab


tic
C=[0 0 1];%%%%% in this program, it is useless
Data=init();
v=[0 1]';
mu=1;
T=Data.T;
[TT,VV] = ode15s(@(t,y) func(t,y,mu,T),[0 T],v);
VV(end,:)'
% v=[0 1]';
% [PT,v] = ode15s(@(t,y) func(t,y,mu,PT),[0 PT],v);
% v(end,:)'
