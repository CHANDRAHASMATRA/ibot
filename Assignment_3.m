x=[3,6,4;1,5,0;0,7,7]%creating x vector
y=[1;2;3]%creating y vector
s=x\y%solution vector
errVector=y-x*s%error vector


y=@(x) x*exp(-x/3)%creating a fuction y
I=quad(y,0,5)%integreting our in limits
Error=(I-24*exp(-5/3)+9)%displaying error value

load('randomdata.mat')%loading data
plot(x,y,'.b','markersize',17)%ploting raw data
hold on
[p1,s1,c1]=polyfit(x,y,1);%creating a fit of order 1 along with scaling and center factors
[p2,s2,c2]=polyfit(x,y,2);%creating a fit of order 2 along with scaling and center factors
[p3,s3,c3]=polyfit(x,y,3);%creating a fit of order 3 along with scaling and center factors
[p4,s4,c4]=polyfit(x,y,4);%creating a fit of order 4 along with scaling and center factors
[p5,s5,c5]=polyfit(x,y,5);%creating a fit of order 5 along with scaling and center factors
plot(x,polyval(p1,x,s1,c1),'r')%creating a plot from the data of polyfit
hold on
plot(x,polyval(p2,x,s2,c2),'y')%creating a plot from the data of polyfit
hold on
plot(x,polyval(p3,x,s3,c3),'c')%creating a plot from the data of polyfit
hold on
plot(x,polyval(p4,x,s4,c4),'m')%creating a plot from the data of polyfit
hold on
plot(x,polyval(p5,x,s5,c5),'k')%creating a plot from the data of polyfit
hold on
legend('data','order1','order2','order3','order 4','order5')%setting legends






