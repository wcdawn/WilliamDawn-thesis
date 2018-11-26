clear
close all

% pin model
LW = 2;
FS = 12;
FN = 'Times New Roman';
rfuel = 0.270510;
rbond = 0.332420;
rclad = 0.398300;
rwrap = 0.08;

radian = linspace(0,2*pi,100);
circle = zeros(length(radian),2);
circle(:,1) = cos(radian);
circle(:,2) = sin(radian);

figure
hold on

h = patch(circle(:,1)*rclad,circle(:,2)*rclad,'w','LineWidth',LW);
hatchfill(h,'single',45,5);
h = patch(circle(:,1)*rbond,circle(:,2)*rbond,'w','LineWidth',LW);
h = patch(circle(:,1)*rbond,circle(:,2)*rbond,'g','LineWidth',LW);
hatchfill(h,'cross',20,10);
h = patch(circle(:,1)*rfuel,circle(:,2)*rfuel,'w','LineWidth',LW);
h = patch(circle(:,1)*rfuel,circle(:,2)*rfuel,'b','LineWidth',LW);
hatchfill(h,'single',-45,25);%,20,20);
h = patch(circle(:,1)*rwrap+(rclad+rwrap)*cos(pi/4),circle(:,2)*rwrap+(rclad+rwrap)*sin(pi/4),'w','LineWidth',LW);
hatchfill(h,'fill');


arrow([0,0],[cos(2*pi/3),sin(2*pi/3)]*rclad)
arrow([0,0],[cos(pi/2),sin(pi/2)]*rbond)
arrow([0,0],[cos(pi/5),sin(pi/5)]*rfuel)
wrap_center = [cos(pi/4),sin(pi/4)]*(rclad+rwrap);
arrow(wrap_center,wrap_center+[cos(3*pi/4),sin(3*pi/4)]*rwrap)
arrow(wrap_center,wrap_center-[cos(3*pi/4),sin(3*pi/4)]*rwrap)

text(0.5*rfuel*cos(pi/5)+0.05,0.5*rfuel*sin(pi/5),'R_{Fuel}','FontSize',FS,'FontName',FN)
text(0.5*rbond*cos(pi/2),0.5*rbond*sin(pi/2),'R_{Bond}','FontSize',FS,'FontName',FN)
text(0.5*rclad*cos(2*pi/3)-0.07,0.5*rclad*sin(2*pi/3)-0.05,'R_{Clad}','FontSize',FS,'FontName',FN)
text(wrap_center(1)-0.02,wrap_center(2)+0.03,'D_{Wrap}','FontSize',FS,'FontName',FN)

hold off
axis equal
set(gca,'Visible','off')
print(gcf,'../figs/pin_model.eps','-depsc2')
close(gcf)