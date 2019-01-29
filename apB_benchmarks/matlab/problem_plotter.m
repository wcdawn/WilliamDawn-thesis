clear
close all

% pseudo-input
LW = 1;
FN = 'Times New Roman';
FS = 5;
f2f = 1.0;

fname = '../data/hwr.csv';
outname = '../figs/hwr.eps';

side = 1.0/sqrt(3.0);
base = 0.5*side;
hex = zeros(7,2);
hex(1,1) = base;
hex(1,2) = 0.5;
hex(2,1) = - base;
hex(2,2) = 0.5;
hex(3,1) = -side;
hex(3,2) = 0.0;
hex(4,1) = - base;
hex(4,2) = - 0.5;
hex(5,1) = base;
hex(5,2) = - 0.5;
hex(6,1) = side;
hex(6,2) = 0.0;
hex(7,:) = hex(1,:); % close the loop

% get data and put it in useful arrays
data = csvread(fname);
refnum = data(:,1);
ring = data(:,2);
around = data(:,3);
refpwr = data(:,4);
material = data(:,5);
if (size(data,2) > 5)
    refpwr2 = data(:,6);
end

% allow negative 'around' numbers to go the other way
for i = 1:length(around)
    if (around(i) < 0)
        max_around = max([6*(ring(i)-1),1]);
        around(i) = max_around + around(i) + 1;
    end
end

if (exist('refpwr2','var'))
    doPlot(FS,ring,around,material,refpwr,refpwr2)
else
    doPlot(FS,ring,around,material,refpwr)
end

% place the key
% VVER440
% key_x = 0.0;
% key_y = 0.6*max(ring)*f2f;
% plot(key_x+hex(:,1)*f2f,key_y+hex(:,2)*f2f,'k-','LineWidth',LW)
% key_str = sprintf('Material\nPower');
% text(key_x,key_y,key_str,'FontName',FN,'FontSize',FS,...
%     'HorizontalAlignment','center','VerticalAlignment','middle');
% eigenvalue_str = sprintf('k_{eff}=\n1.00970');
% text(key_x,key_y*0.8,eigenvalue_str,'FontName',FN,'FontSize',FS+2,...
%     'HorizontalAlignment','center','VerticalAlignment','middle');
% arrow([key_x+0.8*f2f,key_y-0.5*f2f],[key_x+0.8*f2f,key_y+0.5*f2f],'Length',8,'Ends','both')
% dimension_str = '14.7 [cm]';
% text(key_x+f2f,key_y,dimension_str,'FontName',FN,'FontSize',FS+1);
% bc_str = '$$\nabla \phi_g \cdot \hat{\mathbf{n}} = 0$$';
% text(4*f2f,1*f2f,bc_str,'Interpreter','latex');
% text(0*f2f,4*f2f,bc_str,'Interpreter','latex');
% text(8*f2f,8*f2f,'$$\alpha=0.5$$','Interpreter','latex');

% SNR
% key_x = 0.0;
% key_y = 0.6*max(ring)*f2f;
% plot(key_x+hex(:,1)*f2f,key_y+hex(:,2)*f2f,'k-','LineWidth',LW)
% key_str = sprintf('Material');
% text(key_x,key_y,key_str,'FontName',FN,'FontSize',FS,...
%     'HorizontalAlignment','center','VerticalAlignment','middle');
% eigenvalue_str = sprintf('k_{eff}=\n1.12400');
% text(key_x,key_y*0.8,eigenvalue_str,'FontName',FN,'FontSize',FS+2,...
%     'HorizontalAlignment','center','VerticalAlignment','middle');
% arrow([key_x+0.8*f2f,key_y-0.5*f2f],[key_x+0.8*f2f,key_y+0.5*f2f],'Length',8,'Ends','both')
% dimension_str = '11.2003 [cm]';
% text(key_x+f2f,key_y,dimension_str,'FontName',FN,'FontSize',FS+1);
% bc_str = '$$\nabla \phi_g \cdot \hat{\mathbf{n}} = 0$$';
% text(4*f2f,-1*f2f,bc_str,'Interpreter','latex');
% text(0*f2f,4*f2f,bc_str,'Interpreter','latex');
% text(7*f2f,7*f2f,'$$\alpha=0.5$$','Interpreter','latex');

% HWR
key_x = 0.0;
key_y = 0.6*max(ring)*f2f;
plot(key_x+hex(:,1)*f2f,key_y+hex(:,2)*f2f,'k-','LineWidth',LW)
key_str = sprintf('Material\nPower');
text(key_x,key_y,key_str,'FontName',FN,'FontSize',FS,...
    'HorizontalAlignment','center','VerticalAlignment','middle');
eigenvalue_str = sprintf('k_{eff}=\n0.991965');
text(key_x,key_y*0.8,eigenvalue_str,'FontName',FN,'FontSize',FS+4,...
    'HorizontalAlignment','center','VerticalAlignment','middle');
arrow([key_x+0.8*f2f,key_y-0.5*f2f],[key_x+0.8*f2f,key_y+0.5*f2f],'Length',6,'Ends','both')
dimension_str = '17.78 [cm]';
text(key_x+f2f,key_y,dimension_str,'FontName',FN,'FontSize',FS+3);
bc_str = sprintf('Rotational\nSymmetry');
text(4*f2f,-1.5*f2f,bc_str,'FontName',FN,'FontSize',FS+3,'HorizontalAlignment','center')
text(1*f2f,6*f2f,bc_str,'FontName',FN,'FontSize',FS+3,'HorizontalAlignment','center')
text(12*f2f,12*f2f,'$$\phi_g = 0$$','Interpreter','latex')

% IAEA_NORE
% key_x = 0.0;
% key_y = 0.6*max(ring)*f2f;
% plot(key_x+hex(:,1)*f2f,key_y+hex(:,2)*f2f,'k-','LineWidth',LW)
% key_str = sprintf('Material\n\\alpha=0.125\n\\alpha=0.5');
% text(key_x,key_y,key_str,'FontName',FN,'FontSize',FS,...
%     'HorizontalAlignment','center','VerticalAlignment','middle');
% eigenvalue_str = sprintf('k_{eff}=\n0.991378 \\alpha=0.125\n0.979077 \\alpha=0.50');
% text(key_x,key_y*0.7,eigenvalue_str,'FontName',FN,'FontSize',FS+1,...
%     'HorizontalAlignment','center','VerticalAlignment','middle');
% arrow([key_x+0.8*f2f,key_y-0.5*f2f],[key_x+0.8*f2f,key_y+0.5*f2f],'Length',6,'Ends','both')
% dimension_str = '20.00 [cm]';
% text(key_x+f2f,key_y,dimension_str,'FontName',FN,'FontSize',FS+1);
% bc_str = '$$\nabla \phi_g \cdot \hat{\mathbf{n}} = 0$$';
% text(4*f2f,1*f2f,bc_str,'Interpreter','latex');
% text(-1*f2f,1.5*f2f,bc_str,'Interpreter','latex');
% out_bc_str = sprintf('\\alpha=0.125 \n \\alpha=0.5');
% text(4*f2f,5*f2f,out_bc_str,'FontName',FN,'FontSize',FS);

% IAEA_REFL
% key_x = 0.0;
% key_y = 0.6*max(ring)*f2f;
% plot(key_x+hex(:,1)*f2f,key_y+hex(:,2)*f2f,'k-','LineWidth',LW)
% key_str = sprintf('Material\n\\alpha=0.125\n\\alpha=0.5');
% text(key_x,key_y,key_str,'FontName',FN,'FontSize',FS,...
%     'HorizontalAlignment','center','VerticalAlignment','middle');
% eigenvalue_str = sprintf('k_{eff}=\n1.006630 \\alpha=0.125\n1.005507 \\alpha=0.50');
% text(key_x,key_y*0.7,eigenvalue_str,'FontName',FN,'FontSize',FS+1,...
%     'HorizontalAlignment','center','VerticalAlignment','middle');
% arrow([key_x+0.8*f2f,key_y-0.5*f2f],[key_x+0.8*f2f,key_y+0.5*f2f],'Length',6,'Ends','both')
% dimension_str = '20.00 [cm]';
% text(key_x+f2f*.9,key_y,dimension_str,'FontName',FN,'FontSize',FS+1);
% bc_str = '$$\nabla \phi_g \cdot \hat{\mathbf{n}} = 0$$';
% text(4*f2f,1*f2f,bc_str,'Interpreter','latex');
% text(-1*f2f,1.5*f2f,bc_str,'Interpreter','latex');
% out_bc_str = sprintf('\\alpha=0.125 \n \\alpha=0.5');
% text(4*f2f,5.5*f2f,out_bc_str,'FontName',FN,'FontSize',FS);

hold off
axis equal
axis tight
set(gca,'FontName',FN,'FontSize',FS,'visible','off');
print(gcf,outname,'-depsc2');
close(gcf)