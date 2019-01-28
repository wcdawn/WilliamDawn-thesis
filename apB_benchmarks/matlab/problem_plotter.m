clear
close all

% pseudo-input
LW = 1;
FN = 'Times New Roman';
FS = 7;
f2f = 1.0;

fname = '../data/vver440.csv';
outname = '../figs/vver440.eps';

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

doPlot(FS,ring,around,material,refpwr)

% place the key
% VVER440
key_x = 0.0;
key_y = 0.6*max(ring)*f2f;
plot(key_x+hex(:,1)*f2f,key_y+hex(:,2)*f2f,'k-','LineWidth',LW)
key_str = sprintf('Material\nPower');
text(key_x,key_y,key_str,'FontName',FN,'FontSize',FS,...
    'HorizontalAlignment','center','VerticalAlignment','middle');
eigenvalue_str = sprintf('k_{eff}=\n1.00970');
text(key_x,key_y*0.8,eigenvalue_str,'FontName',FN,'FontSize',FS+2,...
    'HorizontalAlignment','center','VerticalAlignment','middle');
arrow([key_x+0.8*f2f,key_y-0.5*f2f],[key_x+0.8*f2f,key_y+0.5*f2f],'Length',8,'Ends','both')
dimension_str = '14.7 [cm]';
text(key_x+f2f,key_y,dimension_str,'FontName',FN,'FontSize',FS+1);


key_str = sprintf('Material');

hold off
axis equal
axis tight
set(gca,'FontName',FN,'FontSize',FS,'visible','off');
print(gcf,outname,'-depsc2');
close(gcf)
