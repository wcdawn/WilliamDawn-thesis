clear
close all

fname = '../data/thexp_study.csv';
data = csvread(fname);

LW = 2;
kref = 1.1829318272893925;

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

rho = (k - kref)./(k * kref) * 1e5;
figure
plt = plot(temperature,rho,'-o','LineWidth',LW);
set(plt,'MarkerFaceColor',get(plt,'Color'));
title('Thermal Expansion Reactivity Study')
xlabel('Thermal Expansion Temperature [K]')
ylabel('\Delta \rho [pcm]')
set(gca,'FontName','Times New Roman')
print(gcf,'../figs/thexp_study_reactivity.eps','-depsc2');
close(gcf)