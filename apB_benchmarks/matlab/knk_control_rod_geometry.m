clear
close all

width = 20;
LW = 1;
FN = 'Times New Roman';
FS = 12;

% knk_control_rod_geometry
rect = @(w,h)([0,0;...
    w,0;
    w,h;
    0,h;
    0,0]);

bottom_steel = rect(width,65.0);
first_sodium = rect(width,125.0);
second_sodium = rect(width,30.0);
second_steel = rect(width,35.0);
control_rod = rect(width,60.0);

figure
hold on
% Withdrawn
buffer = 0.0;
plot(bottom_steel(:,1)+buffer,bottom_steel(:,2),'k-','LineWidth',LW)
plot(first_sodium(:,1)+buffer,first_sodium(:,2)+max(bottom_steel(:,2)),'k-','LineWidth',LW)
text(buffer+0.5*width,32.5,'STEEL','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,127.5,'NACRD','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,195,'Withdrawn','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,-5,'A','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = width*2;
plot(bottom_steel(:,1)+buffer,bottom_steel(:,2),'k-','LineWidth',LW)
plot(second_sodium(:,1)+buffer,second_sodium(:,2)+max(bottom_steel(:,2)),'k-','LineWidth',LW)
plot(control_rod(:,1)+buffer,control_rod(:,2)+95.,'k-','LineWidth',LW)
plot(second_steel(:,1)+buffer,second_steel(:,2)+155.,'k-','LineWidth',LW)
text(buffer+0.5*width,32.5,'STEEL','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,80,'NACRD','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,125.,'CRD','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,172.5,'STEEL','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,195,'Half-Inserted','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,-5,'B','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = width*4;
plot(bottom_steel(:,1)+buffer,bottom_steel(:,2),'k-','LineWidth',LW)
plot(control_rod(:,1)+buffer,control_rod(:,2)+65.,'k-','LineWidth',LW)
plot(bottom_steel(:,1)+buffer,bottom_steel(:,2)+125.,'k-','LineWidth',LW)
text(buffer+0.5*width,32.5,'STEEL','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,95.,'CRD','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,155.,'STEEL','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,195,'Fully Inserted','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(buffer+0.5*width,-5,'C','FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
hold off
ylabel('z [cm]')
set(gca,'xtick',[])
xlim([0,width*5])
ylim([0,190])
yticks([0,65,95,125,155,190])
set(gca,'FontName',FN,'FontSize',FS)
print(gcf,'../figs/knk_control_rod_geometry.eps','-depsc2');
close(gcf)