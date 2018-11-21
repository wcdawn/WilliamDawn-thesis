clear
close all

LW = 2;
tri = [...
    .7,.5;
    .2,.5;
    0,-.1;
    .7,.5];
    

figure
plot(tri(:,1),tri(:,2),'-o','Color','k','LineWidth',LW,'MarkerFaceColor','k')
axis equal

set(gca,'Visible','off')
print('../figs/sketch_triangle.eps','-depsc2')
close(gcf)