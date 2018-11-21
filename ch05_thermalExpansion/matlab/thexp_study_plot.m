clear
close all

fname = '../data/thexp_study.csv';
data = csvread(fname);

LW = 2;

temperature = data(:,1);
k = data(:,2);

figure
plt = plot(temperature,k,'-o','LineWidth',LW);
set(plt,'MarkerFaceColor',get(plt,'Color'));
title('Thermal Expansion Reactivity Study')
xlabel('Thermal Expansion Temperature [K]')
ylabel('k_{eff}')
set(gca,'FontName','Times New Roman')
print(gcf,'../figs/thexp_study.eps','-depsc2');
close(gcf)