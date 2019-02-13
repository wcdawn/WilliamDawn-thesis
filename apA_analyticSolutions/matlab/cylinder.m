clear
close all

T = 1;
H = 2;
ntest = 100; 

alpha_0 = fzero(@(z) besselj(0, z), 3);
% besselj(0, alpha_0); % Should be small

fun = @(r,z)(besselj(0,(alpha_0/T)*r).*sin((pi/H)*z));

dr = T/ntest;
dz = H/ntest;
r = 0.5*dr:dr:T;
z = 0.5*dz:dz:H;

[R,Z] = meshgrid(r,z);

val = fun(R,Z)';

figure('pos',[1000 1000 650 1000]);
imagesc(r,z,val');
view([0,90]);
colormap(viridis);
colorbar;
xlabel('r [cm]');
ylabel('z [cm]');
xlim([0 T]);
ylim([0 H]);
title('Slice of Finite Cylinder');

set(gca,'FontName','Times New Roman','FontSize',20);
print('../figs/finite_cyl.eps','-depsc2');
close(gcf)