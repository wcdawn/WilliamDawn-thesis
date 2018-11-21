clear
close all

LW = 2;
FN = 'Times New Roman';
FS = 14;

tri_front = [...
    1,0,-1;
    0,1,-1;
    0,1,1;
    0,0,1;
    1,0,1;
    0,1,1;
    1,0,1;
    1,0,-1];

tri_back = [...
    1,0,-1;
    0,0,-1;
    0,1,-1;
    0,0,-1;
    0,0,1];
    

figure
hold on
plot3(tri_front(:,1),tri_front(:,2),tri_front(:,3),...
    '-o','Color','k','MarkerFaceColor','k','LineWidth',LW)
plot3(tri_back(:,1),tri_back(:,2),tri_back(:,3),...
    '--o','Color','k','MarkerFaceColor','k','LineWidth',LW)
hold off
axis equal
view([120,30])
xlabel('\xi')
ylabel('\eta')
zlabel('\zeta')
set(gca,'FontName',FN,'FontSize',FS)
print(gcf,'../figs/Wref.eps','-depsc2')
close(gcf)