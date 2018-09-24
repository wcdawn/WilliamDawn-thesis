clear
close all

Lx = 1;
ntest = 100;

diffusion = 1;
qfixed = 1;
sigma_r = 1;
nusigma_f = 2;

Bf = sqrt(sigma_r/diffusion);

xtest = linspace(0,Lx,ntest);

fixed = @(x)((qfixed/Bf^2)*(1-cosh(Bf*x))+ ...
    ((qfixed/Bf^2)*(cosh(Bf*Lx)-1)/(sinh(Bf*Lx)))*sinh(Bf*x));
critical = @(x)(sin((pi/Lx)*x));

ytestf = zeros(size(xtest));
ytestc = zeros(size(xtest));
for i = 1:length(xtest)
    ytestf(i) = fixed(xtest(i));
    ytestc(i) = critical(xtest(i));
end
ytestc = ytestc * norm(ytestf,inf);

figure
hold on
title('One-Dimension, One-Group, Fixed and Critical')
plot(xtest,ytestc,'LineWidth',2)
plot(xtest,ytestf,'LineWidth',2)
legend({'Fixed Source', 'Criticality'})
hold off