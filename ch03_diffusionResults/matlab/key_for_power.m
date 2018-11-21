clear
close all

LW = 2;
FS = 40;
FN = 'Times New Roman';

f2f = 1;
half = 0.5 * f2f;
side = (2.0 * half) / sqrt(3.0);
base = 0.5 * side;
hex = [base, half;...
    -base, half;
    -side, 0;
    -base, -half;
    base, -half;
    side,0;
    base,half];
   
figure
hold on
plot(hex(:,1),hex(:,2),'k','LineWidth',LW)
text(0,+0.2,'Result','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(0,0,'Reference','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(0,-0.2,'Difference','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
hold off
set(gca,'Visible','off');
print(gcf,'../figs/hex_description.eps','-depsc2');
close(gcf)
