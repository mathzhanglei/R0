%%%%%%%%%%% How to compute R_0
%%%%First we need clear the workspace and our screen.
clear
clc

tic  %%%%% timing start
Xlen=100;   %%%%%%  the total number to devide our space $X$, this will determain our one step of our space
x=linspace(0,1,Xlen);  %%% to devide our space $X$, our space $X=[0,1]$, x will be a vector which is a arithmetic progression(等差数列) and one step is $1/len$.
h=1/(Xlen-1);  %%%%%% the length of one step of our space $X$, this will determain the accuracy of our result

%%%%%%%The following is our parameters

f12=1+0.6*cos(pi/2*x);
f21=1+0.5*sin(pi/2*x);
m1=1+0.5*cos(pi/2*x);
m2=1+0.5*sin(pi/2*x);

d=ones(1,Xlen); %%%%%% ones() is to generate a matrix whose every element is 1.
%%%%%%%%%%%  The following is to generate a matrix A
D_1=diag(d(2:end),1);%%%%% To generate a matrix D_1, please see help
D_2=diag(d(2:end),-1);
D_3=diag([d(2:end),0]);
D_4=diag([0,d(2:end)]);
Diff=(-D_3- D_4+ D_1+ D_2)*1/h^2;
clear D_1 D_2 D_3 D_4  %%%%% If the matrix is useless, please clear it. If the data is large, this can accelerate our program(程序提速)

F12= diag(f12);
F11= zeros(Xlen);
F21= diag(f21);
F22= zeros(Xlen);
F=[F11 F12;F21 F22];
clear F11 F12 F21 F22

%%%%%generate a matrix D
d1=0.01;
d2=0.02;
D11=d1*Diff;
D12=zeros(Xlen);
D21=zeros(Xlen);
D22=d2*Diff;

D=[D11 D12; D21 D22];
clear D11 D12 D21 D22
M=[m1 m2];
VV=D - diag(M);
V=-VV;

%%%%%%Notice: put all parameters together is a good habit, except do some circulate parameters

v=ones(Xlen*2,1);
Time=100;
for j=1:Time
    %%%%%Evolution progress
    u=(V\F+eye(Xlen*2))*v;
    index(j)=max(max(u));
    v=u/index(j);
    
    %%%% condition to break
    if j>1 && abs(index(j)-index(j-1))<10^(-5)   
        break
    end
    
end

m=index(end)-1  %%%%%%% principal eigenvalue which is R_0
toc
