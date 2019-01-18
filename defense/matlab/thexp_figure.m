clear
close all

% draw a cube
cube_fnt = [ ...
    0,1,0;
    0,0,0;
    1,0,0;
    0,0,0;
    0,0,1;
    0,1,1;
    0,1,0;
    0,1,1;
    1,1,1;
    1,0,1;
    1,0,0;
    1,0,1;
    0,0,1];

cube_bak = [ ...
    0,1,0;
    1,1,0;
    1,0,0;
    1,1,0;
    1,1,1];
    
    

% put arrows off of it with labels on the arrows

LW = 3;
FN = 'Times New Roman';
FS = 14;

figure
axis([-2 2 -2 2 -2 2])
pbaspect([2 1.5 1]), view([-40,30])
hold on
plot3(cube_fnt(:,1),cube_fnt(:,2),cube_fnt(:,3),'-k','LineWidth',LW);
plot3(cube_bak(:,1),cube_bak(:,2),cube_bak(:,3),'--k','LineWidth',LW);
%axis equal
arrow3([0.3,0.0,0.5],[0.3,-1.3,0.5],'2.5k-',1.0,2.0,0.5)
text(0.5,-1.3,0.5,'\Delta y = F_r(T_{struct})','FontName',FN,'FontSize',FS)
arrow3([0.0,0.5,0.5],[-1.0,0.5,0.5],'2.5k-',1.0,2.0,0.5)
text(-1.2,0.5,0.2,'\Delta x = F_r(T_{struct})','FontName',FN,'FontSize',FS)
arrow3([0.5,0.5,1.0],[0.5,0.5,2.0],'2.5k-',1.0,2.0,0.5)
text(0.6,0.5,2.0,'\Delta z = F_a(T_{fuel})','FontName',FN,'FontSize',FS)
hold off
axis equal
view([-40,30]);

xlabel('x');
ylabel('y');
zlabel('z');

set(gca,'Visible','off');
set(gca,'FontName','Times New Roman','FontSize',12);
print('../figs/thexp_figure.eps','-depsc2');
close(gcf)
