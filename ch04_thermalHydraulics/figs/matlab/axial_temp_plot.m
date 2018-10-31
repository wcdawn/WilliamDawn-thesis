clear
close all

fname = '~/dev/thesis/sfr/fort.999';

LW = 2;  % line width
FS = 13; % font size
descriptor = '-';

data = csvread(fname);
z = data(:,1);
enthalpy = data(:,2);
tcool = data(:,3);
tclad = data(:,4);
tbond = data(:,5);
tfuel = data(:,6);

figure
hold on
h = plot(tcool,z,descriptor,'LineWidth',LW);
set(h, 'MarkerFaceColor', get(h,'Color'));
h = plot(tclad,z,descriptor,'LineWidth',LW);
set(h, 'MarkerFaceColor', get(h,'Color'));
h = plot(tbond,z,descriptor,'LineWidth',LW);
set(h, 'MarkerFaceColor', get(h,'Color'));
h = plot(tfuel,z,descriptor,'LineWidth',LW);
set(h, 'MarkerFaceColor', get(h,'Color'));
hold off
legend_labels = {'T_{cool}','T_{clad}','T_{bond}','T_{fuel}'};
legend(legend_labels,'Location','NorthWest');
ylabel('Elevation [cm]')
xlabel('Temperature [K]')
title('Typical Axial Temperature Plot')