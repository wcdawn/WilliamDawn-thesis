clear
close all

Lx = 100;
LW = 2;
ntest = 100;

D1 = 1.3466;
D2 = 0.37169;
sigma_r1 = 2.5255e-2;
sigma_r2 = 6.4277e-2;
nusf1 = 4.4488e-3;
nusf2 = 7.3753e-2;
sigma_1to2 = 1.6893e-2;

B = pi/Lx;
c = sigma_1to2/ (D2*B^2+sigma_r2);

fun1 = @(x)(sin((pi/Lx)*x));
fun2 = @(x)(c*sin((pi/Lx)*x));

xtest = linspace(0,Lx,ntest);
ytest = zeros(2,ntest);
for i = 1:ntest
    ytest(1,i) = fun1(xtest(i));
    ytest(2,i) = fun2(xtest(i));
end


figure
hold on
title('One-Dimension, Two-Group, Criticality')
plot(xtest,ytest(1,:),'LineWidth',LW)
plot(xtest,ytest(2,:),'LineWidth',LW)
legend({'g=1','g=2'})
xlabel('x [cm]')
ylabel('\phi(x)')
hold off