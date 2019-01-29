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

FS = 8;
rect_full = rect(width,190);
axial_blanket = rect(width,20);
rect_fuel = rect(width,60);
rect_steel = rect(width,45);
material_list = {'STEEL','AXBL','AXRF','TEST','DRIV','DRMOD','REFL','RFMOD','KNKREF','NASTL'};

figure
hold on

buffer = 0.;
plot(rect_full(:,1)+buffer,rect_full(:,2),'-k','LineWidth',LW);
text(width*0.5+buffer,95.,material_list(10),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = buffer + width;
plot(rect_full(:,1)+buffer,rect_full(:,2),'-k','LineWidth',LW);
text(width*0.5+buffer,95.,material_list(9),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = buffer + width;
plot(rect_full(:,1)+buffer,rect_full(:,2),'-k','LineWidth',LW);
text(width*0.5+buffer,95.,material_list(8),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = buffer + width;
plot(rect_full(:,1)+buffer,rect_full(:,2),'-k','LineWidth',LW);
text(width*0.5+buffer,95.,material_list(7),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = buffer + width;
plot(rect_steel(:,1)+buffer,rect_steel(:,2),'-k','LineWidth',LW);
plot(axial_blanket(:,1)+buffer,axial_blanket(:,2)+45,'-k','LineWidth',LW);
plot(rect_fuel(:,1)+buffer,rect_fuel(:,2)+65,'-k','LineWidth',LW);
plot(axial_blanket(:,1)+buffer,axial_blanket(:,2)+125,'-k','LineWidth',LW);
plot(rect_steel(:,1)+buffer,rect_steel(:,2)+145,'-k','LineWidth',LW);
text(width*0.5+buffer,22.5,material_list(1),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,55.0,material_list(3),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,95.0,material_list(6),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,135.,material_list(3),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,172.5,material_list(1),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = buffer + width;
plot(rect_steel(:,1)+buffer,rect_steel(:,2),'-k','LineWidth',LW);
plot(axial_blanket(:,1)+buffer,axial_blanket(:,2)+45,'-k','LineWidth',LW);
plot(rect_fuel(:,1)+buffer,rect_fuel(:,2)+65,'-k','LineWidth',LW);
plot(axial_blanket(:,1)+buffer,axial_blanket(:,2)+125,'-k','LineWidth',LW);
plot(rect_steel(:,1)+buffer,rect_steel(:,2)+145,'-k','LineWidth',LW);
text(width*0.5+buffer,22.5,material_list(1),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,55.0,material_list(3),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,95.0,material_list(5),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,135.,material_list(3),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,172.5,material_list(1),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = buffer + width;
plot(rect_steel(:,1)+buffer,rect_steel(:,2),'-k','LineWidth',LW);
plot(axial_blanket(:,1)+buffer,axial_blanket(:,2)+45,'-k','LineWidth',LW);
plot(rect_fuel(:,1)+buffer,rect_fuel(:,2)+65,'-k','LineWidth',LW);
plot(axial_blanket(:,1)+buffer,axial_blanket(:,2)+125,'-k','LineWidth',LW);
plot(rect_steel(:,1)+buffer,rect_steel(:,2)+145,'-k','LineWidth',LW);
text(width*0.5+buffer,22.5,material_list(1),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,55.0,material_list(2),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,95.0,material_list(4),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,135.,material_list(2),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,172.5,material_list(1),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
buffer = buffer + width;
plot(rect_steel(:,1)+buffer,rect_steel(:,2),'-k','LineWidth',LW);
plot(axial_blanket(:,1)+buffer,axial_blanket(:,2)+45,'-k','LineWidth',LW);
plot(rect_fuel(:,1)+buffer,rect_fuel(:,2)+65,'-k','LineWidth',LW);
plot(axial_blanket(:,1)+buffer,axial_blanket(:,2)+125,'-k','LineWidth',LW);
plot(rect_steel(:,1)+buffer,rect_steel(:,2)+145,'-k','LineWidth',LW);
text(width*0.5+buffer,22.5,material_list(1),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,55.0,material_list(2),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,95.0,material_list(4),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,135.,material_list(2),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');
text(width*0.5+buffer,172.5,material_list(1),'FontName',FN,'FontSize',FS,'HorizontalAlignment','center','VerticalAlignment','middle');

plot([width*0.5+buffer,width*0.5+buffer],[0,190],'--k','LineWidth',LW)
% CENTER-LINE SYMBOL
text(width*0.5+buffer,195,sprintf('\x2104'),'FontSize',14,'FontName','Cambria Math','HorizontalAlignment','center')
text(width*0.5+buffer,-5,sprintf('\x2104'),'FontSize',14,'FontName','Cambria Math','HorizontalAlignment','center')

hold off
yticks([0,45,65,125,145,190])
set(gca,'xtick',[])
ylabel('z [cm]')
set(gca,'FontName',FN,'FontSize',12)
print(gcf,'../figs/knk_assembly_geometry.eps','-depsc2')
% close(gcf)

