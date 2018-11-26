clear
close all

LW = 2;
FS = 20;
FN = 'Times New Roman';

node = [...
    0.0,0.0;   % 5
    1.0,1.0;   % 96
    -1.0,1.0;  % 8
    -0.3,-0.1; % 200
    0.5,-0.3]; % 48

element = [...
    1,2,3;
    1,3,4;
    1,4,5;
    1,5,2];

figure
hold on
trimesh(element,node(:,1),node(:,2),'-o','Color','k','MarkerFaceColor','k','LineWidth',LW)
text(node(1,1),node(1,2)+0.1,'5','FontSize',FS,'FontName',FN)
text(node(2,1),node(2,2)+0.1,'96','FontSize',FS,'FontName',FN)
text(node(3,1),node(3,2)+0.1,'8','FontSize',FS,'FontName',FN)
text(node(4,1),node(4,2)-0.1,'200','FontSize',FS,'FontName',FN)
text(node(5,1),node(5,2)-0.1,'48','FontSize',FS,'FontName',FN)
hold off
set(gca,'Visible','off')
print('../figs/adjacency_graph.eps','-depsc2')
close(gcf)