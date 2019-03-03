clear
close all

analtyic_fname = '../data/axial_analytic_results.csv';
data = csvread(analtyic_fname,1,0);
LW = 2;

z    = data(:,1);
qp   = data(:,2);
h    = data(:,3);

Tinf = data(:,4);
TC = data(:,5);
TB = data(:,6);
TF = data(:,7);
T0 = data(:,8);

Tcool = data(:,9);
Tclad = data(:,10);
Tbond = data(:,11);
Tfuel = data(:,12);

tester_fname = '../data/axial_test_results.csv';
data = csvread(tester_fname,1,0);
z_tester = data(:,1);
h_tester = data(:,2);
Tfuel_tester = data(:,3);
Tbond_tester = data(:,4);
Tclad_tester = data(:,5);
Tcool_tester = data(:,6);
T0_tester = data(:,7);

% figure
% hold on
% plot(h,z,'LineWidth',LW);
% plot(h_tester,z_tester,'LineWidth',LW);
% hold off
% legend({'Analtyic','Model'},'Location','SouthEast')
% xlabel('h [kJ/kg]')
% ylabel('z [m]')
% ylim([0,z(end)])
% title('Enthalpy')

% figure
% hold on
% plot(Tinf,z);
% plot(TC,z);
% plot(TB,z);
% plot(TF,z);
% plot(T0,z);
% hold off
% legend({'T_{\infty}','T_C','T_B','T_F','T_0'},'Location','SouthEast')
% ylim([0,z(end)])
% title('Surface Temperature')

% figure
% hold on
% plot(Tcool,z);
% plot(Tclad,z);
% plot(Tbond,z);
% plot(Tfuel,z);
% hold off
% legend({'T_{cool}','T_{clad}','T_{bond}','T_{fuel}'},'Location','SouthEast')
% ylim([0,z(end)])
% title('Analytic Average Temperature')

figure
hold on
plot(Tcool_tester,z_tester,'-','LineWidth',LW);
plot(Tclad_tester,z_tester,'--','LineWidth',LW);
plot(Tbond_tester,z_tester,'-.','LineWidth',LW);
plot(Tfuel_tester,z_tester,':','LineWidth',LW);
hold off
legend({'T_{cool}','T_{clad}','T_{bond}','T_{fuel}'},'Location','SouthEast')
ylim([0,z(end)])
xlabel('Temperature [K]')
ylabel('Elevation [m]')
title('Modeled Axial Temperature')
set(gca,'FontName','Times New Roman','FontSize',12);
print('../figs/axial_temp_plot.eps','-depsc2');
% close(gcf);

% matlab_blue = [0.00 0.447 0.741];
% matlab_orange = [0.91 0.41 0.17];
% figure
% hold on
% plot(Tcool_tester,z_tester,'Color',matlab_blue);
% plot(Tcool,z,'Color',matlab_orange);
% plot(Tclad_tester,z_tester,'Color',matlab_blue);
% plot(Tbond_tester,z_tester,'Color',matlab_blue);
% plot(Tfuel_tester,z_tester,'Color',matlab_blue);
% plot(Tclad,z,'Color',matlab_orange);
% plot(Tbond,z,'Color',matlab_orange);
% plot(Tfuel,z,'Color',matlab_orange);
% hold off
% legend({'Model Average Temperature','Analytic Average Temperature'},'Location','SouthEast')
% ylim([0,z(end)])
% ylabel('z [m]')
% xlabel('Temperature [K]')
% title('Temperature Comparison')

% project analytic solution onto model grid
Tcool_project = interp1(z,Tcool,z_tester);
figure('pos',[1000 1000 850 1000])
hold on
yyaxis left
ylabel('Temperature [K]')
plot(z,Tcool,'LineWidth',LW);
plot(z_tester,Tcool_tester,'LineWidth',LW);
yyaxis right
h = plot(z_tester,Tcool_project-Tcool_tester,'-o','LineWidth',LW);
set(h,'MarkerFaceColor',get(h,'Color'));
hold off
legend({'T_{cool} Analytic','T_{cool} Model','Analytic-Model'},'Location','southoutside')
title('Temperature Difference')
xlabel('z [m]')
xlim([0,z(end)])
ylabel('Temperature Difference [K]')
set(gca,'FontName','Times New Roman','FontSize',20);
print('../figs/axial_difference_plot.eps','-depsc2');
% close(gcf);