clear
close all

width = 20;
LW = 1;
FN = 'Times New Roman';
FS = 12;

% monju_control_rod_geometry
rect = @(w,h)([0,0;...
    w,0;
    w,h;
    0,h;
    0,0]);

full_rect = rect(width,151.5);
half_rect = rect(width,75.75);

figure
hold on
% Withdrawn
offset = 10;
buffer = offset;
plot(full_rect(:,1)+buffer,full_rect(:,2),'k-','LineWidth',LW)
text(buffer+0.5*width,75.75,'NA','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,156,'Withdrawn','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
A_str = sprintf('Rings 6 & 7 -- A\nRings 1 & 4 -- A,B,C');
text(buffer+0.5*width,-8,A_str,'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = buffer + width*2;
% Half-Inserted
plot(half_rect(:,1)+buffer,half_rect(:,2),'k-','LineWidth',LW)
plot(half_rect(:,1)+buffer,half_rect(:,2)+75.75,'k-','LineWidth',LW)
text(buffer+0.5*width,37.875,'CR','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,113.625,'NA','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,156,'Half-Inserted','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,-5,'Rings 6 & 7 -- B','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = buffer + width*2;
% Fully Inserted
plot(full_rect(:,1)+buffer,full_rect(:,2),'k-','LineWidth',LW)
text(buffer+0.5*width,75.75,'CR','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,156,'Fully Inserted','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,-5,'Rings 6 & 7 -- C','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
hold off
ylabel('z [cm]')
yticks([0,75.75,151.5])
set(gca,'xtick',[])
xlim([0,buffer+width+offset])
ylim([0,151.5])
set(gca,'FontName',FN,'FontSize',FS)
print(gcf,'../figs/monju_control_rod_geometry.eps','-depsc2');
close(gcf)

material_lookup = {'IC','OC','RB','CR','NA'};
blanket = rect(width,30.);
driver = rect(width,91.5);
figure
hold on
% Fuel Assembly
offset = 10;
buffer = offset;
plot(blanket(:,1)+buffer,blanket(:,2),'k-','LineWidth',LW)
plot(driver(:,1)+buffer,driver(:,2)+30.,'k-','LineWidth',LW)
plot(blanket(:,1)+buffer,blanket(:,2)+121.5,'k-','LineWidth',LW)
text(buffer+0.5*width,15.,'RB','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,75.75,'IC/OC','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,136.5,'RB','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,-5,'Fuel Assembly','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
% Blanket Assembly
buffer = buffer + width*2;
plot(full_rect(:,1)+buffer,full_rect(:,2),'k-','LineWidth',LW)
text(buffer+0.5*width,75.75,'RB','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,-5,'Blanket Assembly','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
hold off
ylabel('z [cm]')
yticks([0,30.0,121.5,151.5])
set(gca,'xtick',[])
xlim([0,buffer+width+offset])
ylim([0,151.5])
set(gca,'FontName',FN,'FontSize',FS)
print(gcf,'../figs/monju_assembly_geometry.eps','-depsc2');
close(gcf)