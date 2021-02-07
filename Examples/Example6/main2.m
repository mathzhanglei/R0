%%%%%%%%%%% How to compute R_0
%%%%First we need clear the workspace and our screen.
clear
clc

tic  %%%%% timing start
Xlen=50;   %%%%%%  the total number to devide our space $X$, this will determain our one step of our space
x=linspace(0,1,Xlen);  %%% to devide our space $X$, our space $X=[0,1]$, x will be a vector which is a arithmetic progression(等差数列) and one step is $1/len$.
h=1/(Xlen-1);  %%%%%% the length of one step of our space $X$, this will determain the accuracy of our result

%%%%%%%The following is our parameters

f=1+0.5*sin(pi/2*x);
m=1+0.5*cos(pi/2*x);

d=0.01*ones(1,Xlen); %%%%%% ones() is to generate a matrix whose every element is 1.
%%%%%%%%%%%  The following is to generate a matrix A
D_1=diag([2*d(1),d(2:Xlen-1)],1);%%%%% To generate a matrix D_1, please see help
D_2=diag([d(2:Xlen-1),2*d(Xlen)],-1);
D_3=diag(d);
D_4=diag(d);
Diff=(-D_3-D_4+D_1+D_2)*1/h^2;
clear D_1 D_2 D_3 D_4  %%%%% If the matrix is useless, please clear it. If the data is large, this can accelerate our program(程序提速)


F= diag(f);
%%%%%generate a matrix Q
VV=Diff - diag(m);
V=-VV;
%%%%%%Notice: put all parameters together is a good habit, except do some circulate parameters

v=ones(Xlen,1);
Time=100;
for j=1:Time
    %%%%%Evolution progress
    u=(V\F+eye(Xlen))*v;
    index(j)=max(u);
    v=u/index(j);
    
    %%%% condition to break
    if j>5 && abs(index(j)-index(j-1))<10^(-5)
        break
    end
    
end

R0=index(end)-1  %%%%%%% principal eigenvalue which is R_0
toc
