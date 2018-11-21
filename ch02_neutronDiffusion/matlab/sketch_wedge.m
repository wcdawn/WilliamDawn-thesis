clear
close all

LW = 2;

tri_front = [...
    1,0,-1;
    1-cos(pi/3),sin(pi/3),-1;
    1-cos(pi/3),sin(pi/3),1
    0,0,1;
    1,0,1;
    1-cos(pi/3),sin(pi/3),1;
    1,0,1;
    1,0,-1];

tri_back = [...
    1,0,-1;
    0,0,-1;
    1-cos(pi/3),sin(pi/3),-1;
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
set(gca,'Visible','off')
print(gcf,'../figs/wedge_sketch.eps','-depsc2')
close(gcf)

tri_front = [...
    1.5,0,-1;
    1-cos(pi/3)+1,sin(pi/3)+2,-1;
    1-cos(pi/3),sin(pi/3),1
    0,0,1;
    1,0,.3;
    1-cos(pi/3),sin(pi/3),1;
    1,0,.3;
    1.5,0,-1];

tri_back = [...
    1.5,0,-1;
    0,0,-1;
    1-cos(pi/3)+1,sin(pi/3)+2,-1;
    0,0,-1;
    0,0,1];

figure
hold on
plot3(tri_front(:,1),tri_front(:,2),tri_front(:,3),...
    '-o','Color','k','MarkerFaceColor','k','LineWidth',LW)
plot3(tri_back(:,1),tri_back(:,2),tri_back(:,3),...
    '--o','Color','k','MarkerFaceColor','k','LineWidth',LW)
hold off
zlim([-1,1])
axis square
view([120,30])
set(gca,'Visible','off')
print(gcf,'../figs/wedge_stretch.eps','-depsc2')
close(gcf)