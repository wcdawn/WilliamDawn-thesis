clear
close all

fname_uno = 'uno.csv';
fname_rcm = 'rcm.csv';

data_uno = csvread(fname_uno);
data_rcm = csvread(fname_rcm);

A_uno = sparse(data_uno(:,1),data_uno(:,2),data_uno(:,3));
A_rcm = sparse(data_rcm(:,1),data_rcm(:,2),data_rcm(:,3));

figure
spy(A_uno)
title('Dense Pattern')
set(gca,'FontName','Times New Roman','FontSize',12);
print('../figs/uno_pattern.eps','-depsc2');
%close(gcf)

figure
spy(A_rcm)
title('Sparse Pattern')
set(gca,'FontName','Times New Roman','FontSize',12);
print('../figs/rcm_pattern.eps','-depsc2');
%close(gcf)
