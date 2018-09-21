clear
close all

Lx = 1;
ntest = 100;

qfixed = 1;
sigma_r = 1;
nusigma_f = 2;

xtest = linspace(0,Lx,ntest);

fixed = @(x)((qfixed/sigma_r)*(1-cosh(sigma_r*x))+ ...
    ((-qfixed/sigma_r)*(1-cosh(sigma_r*Lx))/(sinh(sigma_r*Lx)))*sinh(sigma_r*x));
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
plot(xtest,ytestc)
plot(xtest,ytestf)
legend({'Fixed Source', 'Criticality'})
hold off