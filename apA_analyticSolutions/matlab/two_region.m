clear
close all

% analytic solution to two-region one-group neutron diffusion equation
% reflective boundary condition at x=0
% material change at x=LF
% zero-flux  boundary condition at x=LR

% pseudo input
% geometry
LF = 50; % switch material
LR = 100; % end of problem
ntest = 200;
LW = 2;
FZ = 14;

% fuel material properties
D_F  = 1.2;
S_rF = 0.02;
nuS_fF = 0.02;
% refl material properties
D_R = 0.7;
S_rR = 0.015; % note very low
nuS_fR = 0;

% calculations
B_R = sqrt(S_rR/D_R);
syms x
lhs = D_F*x*tan(x*LF);
rhs = (D_R*B_R)/(tanh(B_R*(LR-LF)));
B_F = vpasolve(lhs==rhs,x,[0,0.03]);
B_F = double(B_F);

% B_F = binarySearch(lhs,rhs,lo,hi,1e-17);
keff = nuS_fF/(B_F^2*D_F+S_rF);
fprintf('B_F  = %.16f\n',B_F);
fprintf('keff = %.16f\n',keff);

% begin at 0
c1f = 1; % arbitrary
c2f = 0; % dictated by reflective b.c. at x=0
c1r = c1f*cos(B_F*LF); % dictated by flux continuity
c2r = -(D_F*c1f*B_F*sin(B_F*LF))/(D_R*B_R); % dictated current continuity

% generic form of flux solutions
fuel = @(x)(c1f*cos(B_F*x)+c2f*sin(B_F*x));
refl = @(x)(c1r*cosh(B_R*(x-LF))+c2r*sinh(B_R*(x-LF)));
% use the Heaviside function to switch materials
fun = @(x)(fuel(x)*heaviside(LF-x)+refl(x)*heaviside(x-LF));

xtest = linspace(0,LR,ntest);
ytest = zeros(size(xtest));
for i = 1:ntest
    ytest(i) = fun(xtest(i));
end

figure
hold on
title('One-Dimension, One-Group, Two Region, Criticality');
plot(xtest,ytest,'LineWidth',LW);
ylim([0,1])
plot([LF LF],ylim(),'k','LineWidth',1)
text(0.5*LF,0.5,'Fuel','FontSize',FZ);
text(0.5*(LF+LR),0.5,'Reflector','FontSize',FZ);
xlabel('x [cm]');
ylabel('\phi(x)');
hold off
print(gcf,'../figs/2reg.png','-dpng','-r800');