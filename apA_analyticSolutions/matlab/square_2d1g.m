clear
close all

Lx = 1;
Ly = 1;
ntest = 1000;

qfixed = 1;
sigma_r = 1;
nusigma_f = 2;

fun = @(x,y)(sin((pi/Lx)*x)*sin((pi/Ly)*y));

xtest = linspace(0,Lx,ntest);
ytest = linspace(0,Ly,ntest);

val = zeros(length(xtest),length(ytest));
for i = 1:length(xtest)
    for j = 1:length(ytest)
        val(i,j) = fun(xtest(i),ytest(j));
    end
end

figure
surf(xtest,ytest,val,'EdgeColor','none')
view([0,90])
colormap(coolwarm)
colorbar
xlabel('x [cm]')
ylabel('y [cm]')
title('Two-Dimension, One-Group, Ciriticality')
