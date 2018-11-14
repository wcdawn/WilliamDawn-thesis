clear
close all

% keff convergence
% this is actually interesting for t/h updates

fname = '~/dev/thesis/sfr/diffusion_sfr.out';
data = csvread(fname,1,0,[1 0 70 2]);

iter = data(:,1);
keff = data(:,2);
inner = data(:,3);

figure
plot(iter,keff,'LineWidth',3)
xlabel('Iteration')
ylabel('k_{eff}')
title('Convergence with Temperature Update')