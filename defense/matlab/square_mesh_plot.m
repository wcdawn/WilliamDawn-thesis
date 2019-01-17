clear
close all

[node,element] = read_vtk('../data/fixed0.vtk');
node = node';
x = node(:,1);
y = node(:,2);
element = element+1;

figure
trimesh(element,x,y,'Color','k')
set(gca,'Visible','off')
print('../figs/fixed0.eps','-depsc2')
close(gcf)
