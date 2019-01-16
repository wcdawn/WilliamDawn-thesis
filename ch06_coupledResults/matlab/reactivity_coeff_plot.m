clear
close all

fname = '../data/reactivity_study_01012019_bak.csv';
FN = 'Times New Roman';
FS = 12;
LW = 2;
fuelfudge = 20.;
coolfudge = 50.;

% [power, all feedback, no t.e., fuelfudge, coolfudge]
data = csvread(fname);

% parse data
nPower = size(data,1);
nCondition = size(data,2)-1;
power = data(:,1);
keff = data(:,2:nCondition+1);

% calculate reactivity
reac = zeros(nPower,nCondition);
for i = 1:nPower
    for j = 1:nCondition
        reac(i,j) = (data(i,j+1)-data(1,j+1))/(data(i,j+1)*data(1,j+1));
    end
end
reac = reac * 1e5;

% plot keff figure
figure
hold on
for i = 1:nCondition
    h = plot(power,keff(:,i),'-o','LineWidth',LW);
    set(h, 'MarkerFaceColor', get(h, 'Color'));
end
hold off
xlim([0,power(end)])
xlabel('% Power')
ylabel('k_{eff}')
title('Eigenvalue Effects')
fuelstr = sprintf('T_{fuel}+%.0f[K]',fuelfudge);
coolstr = sprintf('T_{cool}+%.0f[K]',coolfudge);
legend_cells = {'All Feedback','No T.E.',fuelstr,coolstr};
legend(legend_cells)
set(gca,'FontName',FN,'FontSize',FS);
print(gcf,'../figs/eigenvalue_effects.eps','-depsc2')
close(gcf)

% plot reactivity effects
figure
hold on
for i = 1:nCondition
    h = plot(power,reac(:,i),'-o','LineWidth',LW);
    set(h, 'MarkerFaceColor', get(h, 'Color'));
end
hold off
xlim([0,power(end)])
xlabel('% Power')
ylabel('\rho [pcm]')
title('Reactivity Effects')
legend(legend_cells)
set(gca,'FontName',FN,'FontSize',FS);
print(gcf,'../figs/reactivity_effects.eps','-depsc2')
close(gcf)

% calculate alphas
nCoeff = nCondition;
alpha = zeros(nPower,nCondition);
for i = 1:nPower
    % \alpha_{Power}
    alpha(i,1) = (reac(i,1)-reac(1,1))/(power(i)-power(1));
    % \alpha_{TE}
    alpha(i,2) = (reac(i,2)-reac(1,2))/(power(i)-power(1));
    % \alpha_{Tfuel} (Doppler)
    alpha(i,3) = -(reac(i,3)-reac(i,1))/fuelfudge;
    % \alpha_{Tcool}
    alpha(i,4) = -(reac(i,4)-reac(i,1))/coolfudge;
end
        
% plot coefficient figures
figure
h = plot(power,alpha(:,3),'-o','LineWidth',LW);
set(h, 'MarkerFaceColor', get(h, 'Color'));
xlabel('% Power')
ylabel('\alpha_{Doppler} [pcm/K]')
title('Doppler Coefficient')
set(gca,'FontName',FN,'FontSize',FS);
print(gcf,'../figs/alpha_doppler.eps','-depsc2')
close(gcf)

figure
hold on
h = plot(power,alpha(:,4),'-o','LineWidth',LW);
set(h, 'MarkerFaceColor', get(h, 'Color'));
plot([power(1),power(end)],[0,0],'k')
hold off
xlabel('% Power')
ylabel('\alpha_{Coolant} [pcm/K]')
title('Coolant Temperature Coefficient')
set(gca,'FontName',FN,'FontSize',FS);
print(gcf,'../figs/alpha_ctc.eps','-depsc2')
close(gcf)