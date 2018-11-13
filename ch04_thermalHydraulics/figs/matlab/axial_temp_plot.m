clear
close all

fname = '~/dev/thesis/sfr/fort.999';

LW = 2;  % line width
FS = 13; % font size
descriptor = '-';

data = csvread(fname);
z              = data(:,1);
chunkpwr       = data(:,2);
chunkqppp_fuel = data(:,3);
enthalpy       = data(:,4);
tcool          = data(:,5);
tclad          = data(:,6);
tbond          = data(:,7);
tfuel          = data(:,8);

z = z*1e-2;

qppp0 = max(chunkqppp_fuel);
H = z(end);
NPIN = 271;
mdot = 0.685613E+02; % [kg/s]
rfuel = 0.27051e-2; % [m]
afuel = pi * rfuel^2 * NPIN;

figure
hold on
plot(chunkqppp_fuel,z,'LineWidth',LW)
plot(qppp0 * sin(pi*z/H),z)
hold off
title("q'''")

enthalpy_test = calcEnthalpy(400.) + 1d-3 * qppp0*afuel/mdot *(H/pi)*(1-cos(pi*z/H));
% all of the following methods are equivalent
enthalpy_test(:) = 0;
for i = 1:length(enthalpy_test)
    prev = i-1;
    if (prev < 1)
        enthalpy_test(i) = calcEnthalpy(400.) + 1d-3 * (1/mdot) * chunkpwr(i);
    else
        enthalpy_test(i) = enthalpy_test(prev) + 1d-3 * (1/mdot) * chunkpwr(i);
    end
    enthalpy_test(i) = calcEnthalpy(400.) + 1d-3 * (1/mdot) * sum(chunkpwr(1:i));
    dumbsum = 0;
    for j = 1:i
        if (j == 1) 
            lo = 0;
        else
            lo = z(j-1);
        end
        dz = z(j) - lo;
        dumbsum = dumbsum + chunkqppp_fuel(j) * afuel * dz;
    end
    enthalpy_test(i) = calcEnthalpy(400.) + 1d-3 * (1/mdot) * dumbsum;
end
enthalpy = enthalpy - calcEnthalpy(400.);
enthalpy_test = enthalpy_test - calcEnthalpy(400.);
ratio = enthalpy./enthalpy_test;

figure
hold on
plot(z,enthalpy,descriptor,'LineWidth',LW)
plot(z,enthalpy_test,descriptor)
hold off
yyaxis right
plot(z,ratio)
legend({'enthalpy','enthalpy\_test','ratio'},'Location','NorthWest')
title('Enthalpy')


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
legend(legend_labels,'Location','SouthEast');
ylim([0,z(end)])
ylabel('Elevation [m]')
xlabel('Temperature [K]')
title('Typical Axial Temperature Plot')
print(gcf,'../axial_temp_plot.png','-dpng','-r800');

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
% figure
% hold on
% plot(tfuel,clad_factor)
% plot(tfuel,cool_factor)
% plot([max_tfuel,max_tfuel],ylim(),'k')
% hold off
fprintf('clad_factor = %.6f\n',clad_factor(idx_tfuel));
fprintf('cool_factor = %.6f\n',cool_factor(idx_tfuel));

figure(2)