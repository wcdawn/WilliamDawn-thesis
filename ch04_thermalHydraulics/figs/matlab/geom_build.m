clear
close all

% plot wedge --> chunk --> Hex
f2f = 1;
LW = 2;

half = 0.5 * f2f;
side = (2.0 * half) / sqrt(3.0);
base = 0.5 * side;
% hex with f2f=1, centered at origin
hex = [...
    0,0,0;
    base, half, 0;
    -base, half,0;
    0,0,0;
    -base, half,0;
    -side, 0,0;
    0,0,0;
    -side, 0,0;
    -base, -half,0;
    0,0,0;
    -base, -half,0;
    base, -half,0;
    0,0,0;
    base, -half,0;
    side,0,0;
    0,0,0;
    side,0,0;
    base,half,0
    ];
hex(:,2)=hex(:,2)+half;
height = 4*side;

assy_front = [...
    -side, 0,height;
    -side, 0,0;
    -base, -half,0;
    -base, -half,height;
    -base, -half,0;
    base, -half,0;
    base, -half,height;
    base, -half,0;
    side,0,0;
    side,0,height;
    ];
assy_front(:,2)=assy_front(:,2)+half;
   
first_wedge_front = [...
    0 0 height;
    side 0 height;
    side*cos(pi/3) side*sin(pi/3) height;
    0 0 height;
    0 0 0;
    side 0 0;
    side 0 height;
    ];
first_wedge_rear = [...
    0 0 0;
    side*cos(pi/3) side*sin(pi/3) 0;
    side*cos(pi/3) side*sin(pi/3) height;
    side*cos(pi/3) side*sin(pi/3) 0;
    side 0 0;
    ];    
   
figure
z1 = ones(size(hex(:,1)));
hold on
% wedge
plot3(first_wedge_front(:,1),first_wedge_front(:,2),first_wedge_front(:,3),'k','LineWidth',LW)
plot3(first_wedge_rear(:,1), first_wedge_rear(:,2), first_wedge_rear(:,3),'--k','LineWidth',LW)

% chunk
chunk_offset = 3;
plot3(hex(:,1)+chunk_offset,hex(:,2),hex(:,3)+height,'k','LineWidth',LW);
plot3(assy_front(:,1)+chunk_offset,assy_front(:,2),assy_front(:,3),'k','LineWidth',LW)

% chevron

% hex
hex_offset = 6;
plot3(hex(:,1)+hex_offset,hex(:,2),hex(:,3)+3*height,'k','LineWidth',LW);
plot3(assy_front(:,1)+hex_offset,assy_front(:,2),assy_front(:,3),'k','LineWidth',LW)
plot3(assy_front(:,1)+hex_offset,assy_front(:,2),assy_front(:,3)+height,'k','LineWidth',LW)
plot3(assy_front(:,1)+hex_offset,assy_front(:,2),assy_front(:,3)+2*height,'k','LineWidth',LW)

hold off
xlim([0,7])
ylim([0,6])
zlim([0,7])
xlabel('x')
ylabel('y')
zlabel('z')
view([0 30])
set(gca,'Visible','off');
print(gcf,'geom_build.png','-dpng','-r800'); 