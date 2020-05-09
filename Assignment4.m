y=randn(1,500)%creats a vector of 500 random numbers with normal distribution.
x=2+5*y%creates a vector with mean 2 and sdt 5 along with normal distribution.
mean(x)%find the mean of x,to check whether it is 2 or not.
std(x)%finds std of x,to chech whether it is 5 or not.


T_H=[0,1];%head is 1 and 0 is tail
coin_tose=randi(T_H,1,5000);%coinSimulation
s=cumsum(coin_tose);
t=[1:5000];
p=s./t;%probability 
plot(t,0.5*ones(1,length(t)))%plotting fair coin probability
hold on
plot(p,'.r','markersize',5)%ploting estimated probability
legend('fair coin','estimated probability')

x=poissrnd(5,1,1000);%generating poisson distributed numbers
hist(x,14,1);%histogram with normalization
hold on
y=poisspdf(x,5);%estimating the probability density
s=interp1(x,y,[0:0.01:max(x)])%smoothing the curve 
plot([0:0.01:max(x)],s,'r')%ploting poisson distribution


x=[0:0.01:2*pi];%creating x with values from 0 to pi
y=sin(x);%find sin of x
plot(x,y,'r')
xlim([0,2*pi])%setting x limits
set(gca,'xTick',[0 pi 2*pi])%changing xtick of current axis
set(gca,'xTicklabel',{'0' '1' '2'})%changing xticklable of current axis
set(gca,'yTick',[0:0.5:1])%changing ytick of current axis
grid on%turning on the grid
set(gca,'ycolor','g')%changing color of current yaxis
set(gca,'xcolor','c')%changing color of current xaxis
set(gca,'color','k')%changing background color
set(gcf,'color',[0.4 0.4 0.4])%changing figure color
title({'One sine wave from 0 to2\pi'},'FontSize',14,'Color','w','FontWeight','bold')
xlabel({'X values in term of \pi'},'FontSize',12,'Color','c')%formating the xlabel
ylabel({'Sin(x)'},'FontSize',12,'Color','c')%formating ylabel



