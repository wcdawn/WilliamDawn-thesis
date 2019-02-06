clear
close all

lef_ht9 = @(T)(-2.191e-3 + 5.678e-6*T + 8.111e-9*T.^2 + -2.576e-12*T.^3);
lef_fuel_lo = @(T)(-7.3e-3 + 3.489e-5*T - 5.154e-8*T.^2 + 4.39e-11*T.^3);
lef_fuel_hi = @(T)(-0.25252 + 6.669e-4*T - 5.441e-7*T.^2 + 1.518e-10*T.^3);
lef_fuel = @(T)(lef_fuel_lo(T)+heaviside(T-923).*(lef_fuel_hi(T)-lef_fuel_lo(T)));

fprintf('lef_ht9==0 = %.6f\n',fzero(lef_ht9,200.));
fprintf('lef_fuel==0 = %.6f\n',fzero(lef_fuel,200.));

LW = 2;

T = linspace(400,1200,1000);

ndot = 10;
ntest = length(T);
delta_selected = ntest/ndot;
selected = floor(1:delta_selected:ntest);

matlab_blue = [0.00 0.447 0.741];
matlab_orange = [0.91 0.41 0.17];

lef_fuel_data = lef_fuel(T);

figure
hold on
plot(T,lef_fuel_data,'-o','Color',matlab_blue,'LineWidth',LW,'MarkerIndices',selected,'MarkerFaceColor',matlab_blue)
plot(T,lef_ht9(T),'-^','Color',matlab_orange,'LineWidth',LW,'MarkerIndices',selected,'MarkerFaceColor',matlab_orange)
hold off
legend({'LEF U10Zr','LEF HT9'},'Location','NorthWest')
xlabel('Temperature [K]')
ylabel('Linear Expansion Factor (LEF)')
xlim([T(1),T(end)])
ylim([0,max(lef_fuel_data)*1.05])
ax = gca;
ax.YAxis.Exponent=-2; % this is the same as percentage results
set(gca,'FontName','Times New Roman')
print(gcf,'../figs/lef_plot.eps','-depsc2');
close(gcf)
