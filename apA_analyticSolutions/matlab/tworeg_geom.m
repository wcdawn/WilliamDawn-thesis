clear
close all

LF = 0.8;
LR = 1.0;
H = 0.2;
L = 1.0;
LW = 2;
FS = 15;
FN = 'Times New Roman';
lo = -0.05;

figure
hold on
plot([0,LR,LR,0,0],[0,0,H,H,0],'k','LineWidth',LW)
plot([LF,LF],[0,H],'k','LineWidth',LW)

text(0.5*LF,0.5*H,'Fuel','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(0.5*(LF+LR),0.5*H,'Reflector','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(0,lo,'0','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(LF,lo,'L_F','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(LR,lo,'L_R','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
hold off
axis equal
set(gca,'Visible','off')
print(gcf,'../figs/2reg_geom.eps','-depsc2');
close(gcf)