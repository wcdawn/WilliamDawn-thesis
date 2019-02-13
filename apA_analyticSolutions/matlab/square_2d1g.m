clear
close all

Lx = 1;
Ly = 1;
ntest = 100;

qfixed = 1;
sigma_r = 1;
nusigma_f = 2;

fun = @(x,y)(sin((pi/Lx)*x).*sin((pi/Ly)*y));

dx = Lx/ntest;
dy = Ly/ntest;

x = 0.5*dx:dx:Lx;
y = 0.5*dy:dy:Ly;

[X,Y]=meshgrid(x,y);

val = fun(X,Y);

figure
imagesc(x,y,val);
view([0,90])
colormap(viridis)
colorbar
xlabel('x [cm]')
ylabel('y [cm]')
title('Two-Dimension, One-Group, Criticality')

set(gca,'FontName','Times New Roman','FontSize',12);
print('../figs/2d1g.eps','-depsc2');
% close(gcf)