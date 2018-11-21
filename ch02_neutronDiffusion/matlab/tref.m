clear
close all

LW = 2;

figure
plot([0,1,0,0],[0,0,1,0],'-o','Color','k','LineWidth',LW,'MarkerFaceColor','k')
xlabel('\eta')
ylabel('\xi')
axis equal
xlim([0,1.1])
ylim(xlim());
set(gca,'FontName','Times New Roman','FontSize',14)
print('../figs/Tref.eps','-depsc2')
close(gcf)