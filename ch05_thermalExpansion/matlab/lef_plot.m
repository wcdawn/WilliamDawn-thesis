clear
close all

fname = './lef.csv';
data = csvread(fname,1,0);
LW = 2;

T = data(:,1);
lef_fuel  = data(:,2);
lef_steel = data(:,3);

ndot = 10;
ntest = length(T);
delta_selected = ntest/ndot;
selected = floor(1:delta_selected:ntest);

matlab_blue = [0.00 0.447 0.741];
matlab_orange = [0.91 0.41 0.17];

figure
hold on
plot(T,lef_fuel ,'-o','Color',matlab_blue,'LineWidth',LW,'MarkerIndices',selected,'MarkerFaceColor',matlab_blue)
plot(T,lef_steel,'-^','Color',matlab_orange,'LineWidth',LW,'MarkerIndices',selected,'MarkerFaceColor',matlab_orange)
hold off
legend({'LEF U10Zr','LEF HT9'},'Location','NorthWest')
xlabel('Temperature [K]')
ylabel('Linear Expansion Factor (LEF)')
xlim([T(1),T(end)])
ylim([0,max(lef_fuel)*1.05])
ax = gca;
ax.YAxis.Exponent=-2; % this is the same as percentage results
set(gca,'FontName','Times New Roman')
print(gcf,'../figs/lef_plot.eps','-depsc2');
