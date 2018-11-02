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

clad_factor = zeros(size(tfuel));
cool_factor = zeros(size(tfuel));
Ttbl = [400,600,900,1200];
for i = 1:length(tfuel)
    hi_val = min(Ttbl(Ttbl > tfuel(i)));
    lo_val = max(Ttbl(Ttbl < tfuel(i)));
    clad_factor(i) = tclad(i) / hi_val;
    cool_factor(i) = tcool(i) / hi_val;
end

clad_factor = tclad./tfuel;
cool_factor = tcool./tfuel;
[max_tfuel,idx_tfuel] = max(tfuel);
figure
hold on
plot(tfuel,clad_factor)
plot(tfuel,cool_factor)
plot([max_tfuel,max_tfuel],ylim(),'k')
hold off
fprintf('clad_factor = %.6f\n',clad_factor(idx_tfuel));
fprintf('cool_factor = %.6f\n',cool_factor(idx_tfuel));