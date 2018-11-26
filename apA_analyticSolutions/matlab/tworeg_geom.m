clear
close all

L = 1.;
LW = 2;
FS = 20;
FN = 'Times New Roman';
lo = -0.1;

figure
hold on
plot([0,2*L,2*L,0,0],[0,0,L,L,0],'k','LineWidth',LW)
plot([L,L],[0,1],'k','LineWidth',LW)
text(0.5*L,0.5*L,'Fuel','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(1.5*L,0.5*L,'Reflector','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(0,lo,'0','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(L,lo,'L_F','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(2*L,lo,'L_R','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
hold off
axis equal
set(gca,'Visible','off')
print(gcf,'../figs/2reg_geom.eps','-depsc2');
close(gcf)