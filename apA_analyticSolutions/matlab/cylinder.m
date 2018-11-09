clear
close all

T = 1;
H = 2;
ntest = 1000;

alpha_0 = fzero(@(z) besselj(0, z), 3);
% besselj(0, alpha_0); % Should be small

fun = @(r,z)(besselj(0,(alpha_0/T)*r)*sin((pi/H)*z));

rtest = linspace(0,T,ntest);
ztest = linspace(0,H,ntest);
ftest = zeros(length(rtest),length(ztest));
for i = 1:ntest
    for j = 1:ntest
        ftest(i,j) = fun(rtest(i),ztest(j));
    end
end

figure('pos',[1000 1000 650 1000])
surf(rtest,ztest,ftest','EdgeColor','none')
view([0,90])
colormap(viridis)
colorbar
xlabel('r [cm]')
ylabel('z [cm]')
xlim([0 T])
ylim([0 H])
% set(gcf,'PaperPositionMode','manual');
% set(gcf,'PaperUnits','centimeters')
% set(gcf,'PaperPosition',[0 0 130 200])

title('Slice of Finite Cylinder')


