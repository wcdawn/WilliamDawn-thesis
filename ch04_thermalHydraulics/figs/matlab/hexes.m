clear
close all

f2f = 15;
th = 2;
radius = 2.38;
wrap = 0.15*radius;
theta = 60.*(pi/180.);
pitch = 4.;
offset = [(radius+wrap)*cos(theta) (radius+wrap)*sin(theta)];

LW = 2.5;

half = 0.5 * 1;
side = (2.0 * half) / sqrt(3.0);
base = 0.5 * side;
% hex with f2f=1, centered at origin
hex = [base, half;
       -base, half;
       -side, 0;
       -base, -half;
       base, -half;
       side,0;
       base,half];
% circle with r=1, centered at origin
npt = 100;
circle = zeros(npt,2);
radian = linspace(0,2*pi,npt);
circle(:,1) = cos(radian);
circle(:,2) = sin(radian);

figure
hold on
% hex can
plot(hex(:,1)*f2f,hex(:,2)*f2f,'k','LineWidth',LW)
plot(hex(:,1)*(f2f+2*th),hex(:,2)*(f2f+2*th),'k','LineWidth',LW)
% center circle
plot(circle(:,1)*radius,circle(:,2)*radius,'k','LineWidth',LW)
plot(circle(:,1)*wrap+offset(1),circle(:,2)*wrap+offset(2),'k','LineWidth',LW)
% ring of pins
for i = 1:6
    this_circle = circle*radius + hex(i,:)*pitch*radius;
    this_wrap = circle*wrap + hex(i,:)*pitch*radius + offset;
    plot(this_circle(:,1),this_circle(:,2),'k','LineWidth',LW)
    plot(this_wrap(:,1),this_wrap(:,2),'k','LineWidth',LW)
end

set(gca,'Visible','off');
print(gcf,'foo.png','-dpng','-r800'); 