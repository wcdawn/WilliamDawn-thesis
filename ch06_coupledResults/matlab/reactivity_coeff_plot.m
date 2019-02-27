clear
close all

fname = '../data/reactivity_study_smallDelta.csv';
LW = 2;
FN = 'Times New Roman';
FS = 12;
fuelfudge = 5.; % [K]
coolfudge = 5.; % [K]
powerfudge = 5.; % [%]

% [power, tfuel_avg, tclad_avg, tcool_avg, k_ref, k_perturb_power,
%    k_perturb_thexp, fuelfudge, coolfudge]
data = csvread(fname);
% data(size(data,1),:) = [];

% parse data
nPower = size(data,1);
nCondition = size(data,2)-4;
power = data(:,1);
temperature_avg = data(:,2:4);
keff = data(:,5:size(data,2));

% calculate reactivity
reac = zeros(nPower,nCondition);
for i = 1:nPower
    for j = 1:nCondition
        %reac(i,j) = (data(i,j+1)-data(1,j+1))/(data(i,j+1)*data(1,j+1));
        reac(i,j) = (keff(i,j) - 1.0)/keff(i,j);
    end
end
reac = reac * 1e5;

% calculate alphas
nCoeff = nCondition;
alpha = zeros(nPower,nCondition);
for i = 1:nPower
    % \alpha_{Power}
    alpha(i,1) = (reac(i,2)-reac(i,1))/powerfudge;
    % \alpha_{TE}
    alpha(i,2) = (reac(i,3)-reac(i,1))/powerfudge;
    % \alpha_{Tfuel} (Doppler)
    alpha(i,3) = (reac(i,4)-reac(i,1))/fuelfudge;
    % \alpha_{Tcool}
    alpha(i,4) = (reac(i,5)-reac(i,1))/coolfudge;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MS = 10;
LWs = 1;
% plot keff figure
figure
hold on
hfirst = plot(power,keff(:,1),'-o','LineWidth',LW);
set(hfirst, 'MarkerFaceColor', get(hfirst, 'Color'));
h = plot(power,keff(:,2),'s','LineWidth',LWs,'MarkerSize',MS);
set(h, 'MarkerFaceColor', get(h, 'Color'));
h = plot(power,keff(:,3),'^','LineWidth',LWs,'MarkerSize',8);
set(h, 'MarkerFaceColor', get(h, 'Color'));
h = plot(power,keff(:,4),'p','LineWidth',LWs,'MarkerSize',MS);
set(h, 'MarkerFaceColor', get(h, 'Color'));
h = plot(power,keff(:,5),'x','LineWidth',2,'MarkerSize',MS);
set(h, 'MarkerFaceColor', get(h, 'Color'));
hold off
xlim([0,100])
xlabel('% Power')
ylabel('k_{eff}')
title('k_{eff} Effects')
fuelstr = sprintf('T_{fuel}+%.0f[K]',fuelfudge);
coolstr = sprintf('T_{cool}+%.0f[K]',coolfudge);
pwerstr = sprintf('Q_{Rx}+%.0f%%',powerfudge);
thexpstr = sprintf('Thexp Q_{Rx}+%.0f%%',powerfudge);
legend_cells = {'All Feedback',pwerstr,thexpstr,fuelstr,coolstr};
legend(legend_cells)
set(gca,'FontName',FN,'FontSize',FS);
print(gcf,'../figs/keff_effects.eps','-depsc2')
close(gcf)

% plot reactivity effects
% figure
% hold on
% for i = 1:nCondition
%     h = plot(power,reac(:,i),'-o','LineWidth',LW);
%     set(h, 'MarkerFaceColor', get(h, 'Color'));
% end
% hold off
% xlim([0,power(end)])
% xlabel('% Power')
% ylabel('\rho [pcm]')
% title('Reactivity Effects')
% legend(legend_cells)
% print(gcf,'reactivity_effects.png','-dpng')
% close(gcf)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
% plot coefficient figures

% \alpha_{Power}
figure
h = plot(power,alpha(:,1),'-o','LineWidth',LW);
set(h, 'MarkerFaceColor', get(h, 'Color'));
xlabel('Reactor Power [%]')
ylabel('\alpha_{power} [pcm/%]')
title('Power Reactivity Coefficient')
set(gca,'FontName',FN,'FontSize',FS)
print(gcf,'../figs/alpha_power.eps','-depsc2')
close(gcf)

% \alpha_{thexp}
figure
h = plot(power,alpha(:,2),'-o','LineWidth',LW);
set(h, 'MarkerFaceColor', get(h, 'Color'));
xlabel('Reactor Power [%]')
ylabel('\alpha_{thexp} [pcm/%]')
title('Thermal Expansion Reactivity Coefficient')
set(gca,'FontName',FN,'FontSize',FS)
print(gcf,'../figs/alpha_thexp.eps','-depsc2')
close(gcf)

% \alpha_{fuel}
figure
h = plot(temperature_avg(:,1),alpha(:,3),'-o','LineWidth',LW);
set(h, 'MarkerFaceColor', get(h, 'Color'));
xlabel('$$\overline{T_{fuel}}$$ [K]','Interpreter','latex')
ylabel('\alpha_{Doppler} [pcm/K]')
title('Doppler Reactivity Coefficient')
set(gca,'FontName',FN,'FontSize',FS)
print(gcf,'../figs/alpha_fuel.eps','-depsc2')
close(gcf)

% \alpha_{cool}
figure
h = plot(temperature_avg(:,3),alpha(:,4),'-o','LineWidth',LW);
set(h, 'MarkerFaceColor', get(h, 'Color'));
xlabel('$$\overline{T_{cool}}$$ [K]','Interpreter','latex')
ylabel('\alpha_{CTC} [pcm/K]')
title('Coolant Temperature Reactivity Coefficient')
set(gca,'FontName',FN,'FontSize',FS)
print(gcf,'../figs/alpha_cool.eps','-depsc2')
close(gcf)

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOLLAR CALCULATION
% These calculations have no reference.... :(

all_worth   = (keff(1,1)-keff(nPower,1))/(keff(1,1)*keff(nPower,1))*1e5;
thexp_worth = (keff(1,3)-keff(nPower,1))/(keff(1,3)*keff(nPower,1))*1e5;
fuel_worth  = (keff(1,4)-keff(nPower,1))/(keff(1,4)*keff(nPower,1))*1e5;
cool_worth  = (keff(1,5)-keff(nPower,1))/(keff(1,5)*keff(nPower,1))*1e5;
fprintf('all_worth   = %.2f [pcm] \n',all_worth);
fprintf('thexp_worth = %.2f [pcm] \n',thexp_worth);
fprintf('fuel_worth  = %.2f [pcm] \n',fuel_worth);
fprintf('cool_worth  = %.2f [pcm] \n',cool_worth);

beta_eff = 0.00330*1d5; % 330 [pcm] % from MET-1000 benchmark
all_worth   = all_worth   / beta_eff;
thexp_worth = thexp_worth / beta_eff;
fuel_worth  = fuel_worth  / beta_eff;
cool_worth  = cool_worth  / beta_eff;

fprintf('all_worth   = $%.2f\n',all_worth);
fprintf('thexp_worth = $%.2f\n',thexp_worth);
fprintf('fuel_worth  = $%.2f\n',fuel_worth);
fprintf('cool_worth  = $%.2f\n',cool_worth);

tfuel_avg = temperature_avg(:,1);
KDoppler = (keff(:,3)-keff(:,1))./log(1+20./tfuel_avg)*1e5;

figure
h = plot(power,KDoppler,'-o','LineWidth',LW);
set(h,'MarkerFaceColor',get(h,'Color'));
xlabel('% Power');
ylabel('Doppler Coefficient  K_D');
title('Doppler Coefficient for ABR');
set(gca,'FontName',FN,'FontSize',FS);
print(gcf,'../figs/doppler_coefficient.eps','-depsc2');
close(gcf)


fprintf('KDoppler(end) = %.2f\n',KDoppler(end));
