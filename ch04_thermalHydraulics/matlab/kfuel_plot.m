clear
close all

x = 0.1; % U10Zr

kU   = @(T)(21.73 + 1.591e-2*T + 5.907e-6*T^2);
kZr  = @(T)(8.853 + 7.082e-3*T + 2.533e-6*T^2 + 2.992e3/T);
kcZr = @(T,x)(-102.0 + 200.1*x - 109.2*x^2 +9.453e-3*T + ...
    3.459e-5*T^2 - 0.02093*x*T);
kUZr = @(T,x)((1 - sqrt(1-x))*kZr(T) + sqrt(1-x)*((1-x)*kU(T) + x*kcZr(T,x)));

kHT9 = 64.33; % [W/m/K]
kNa  = 25.81; % [W/m/K]

Ttest = linspace(400,1200);
ktest = zeros(size(Ttest));
for i = 1:length(Ttest)
    ktest(i) = kUZr(Ttest(i),x);
end

LW = 3;

figure
hold on
plot(Ttest,ktest,'LineWidth',LW);
plot([Ttest(1),Ttest(end)],[kHT9,kHT9],'--','LineWidth',LW)
plot([Ttest(1),Ttest(end)],[kNa,kNa],'-.','LineWidth',LW)
hold off
xlim([Ttest(1),Ttest(end)])
xlabel('T [K]')
ylabel('Thermal Conductivity [W/m/K]')
title('Thermal Conductivity of Reactor Materials')
legend({'k_{U10Zr}','k_{HT9}','k_{Na}'})
set(gca,'FontName','Times New Roman','FontSize',12);
print('../figs/kfuel_plot.eps','-depsc2');
% close(gcf)