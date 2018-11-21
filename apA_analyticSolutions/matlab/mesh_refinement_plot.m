clear
close all

% trimesh(element,x,y,'Color','k')

[node,element] = read_vtk('../data/cir0.txt');
node = node';
x = node(:,1);
y = node(:,2);
element = element+1;

figure
trimesh(element,x,y,'Color','k')
set(gca,'Visible','off')
print('../figs/cir0.eps','-depsc2')
close(gcf)

[node,element] = read_vtk('../data/cir3.txt');
node = node';
x = node(:,1);
y = node(:,2);
element=element+1;

figure
trimesh(element,x,y,'Color','k')
set(gca,'Visible','off')
print('../figs/cir3.eps','-depsc2')
close(gcf)