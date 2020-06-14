clear
clc

load dataroot
%%%%%%%%

plot(C,RR0);
xlabel('c')
ylabel('$\mathcal{R}_0$','Interpreter','latex')


hold on
load datadirect
plot(C,RR0,'r.');
xlabel('c')
ylabel('$\mathcal{R}_0$','Interpreter','latex')

legend('Root methd','Direct method','Location','best') 
set (gcf,'Position',[400,100,800,300])
saveas(gcf,'R0c3','epsc')
