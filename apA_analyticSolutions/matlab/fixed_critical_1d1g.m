clear
close all

Lx = 1;
LW = 2;
ntest = 100;
num_dots = 11;
dot_size = 50;

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
plot(xtest,ytestc,'-','LineWidth',LW)
plot(xtest,ytestf,'--','LineWidth',LW)
xlabel('x [cm]')
ylabel('\phi(x)')
legend({'Criticality', 'Fixed Source'})
hold off

set(gca,'FontName','Times New Roman','FontSize',12);
print('../figs/fixed_critical.eps','-depsc2');
close(gcf)