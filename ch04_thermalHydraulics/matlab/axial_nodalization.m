clear
close all

LW = 2;
width = 1.3;
height = 2;
rad=0.3;


square = [...
    0,0;
    0,height;
    width,height;
    width,0;
    0,0;
    ];

cup = [...
    0,height;
    0,0;
    width,0;
    width,height;
    ];

cap = [...
    0,0;
    0,height;
    width,height;
    width,0;
    ];

radians = linspace(-0.2,width+0.2,100);
squiggle = 0.1*-sin(2*pi/width*radians);


figure
hold on
% square 1
plot(square(:,1),square(:,2),'k','LineWidth',LW)
pos = [width*.5-.5*rad height*.5-.5*rad rad rad];
rectangle('Position',pos,'Curvature',[1 1],'FaceColor','k')
% square 2
pos = [width*.5-.5*rad height*.5-.5*rad+height rad rad];
rectangle('Position',pos,'Curvature',[1 1],'FaceColor','k')
plot(square(:,1),square(:,2)+height,'k','LineWidth',LW)
% broken square
plot(cup(:,1),cup(:,2)*.5+2*height,'k','LineWidth',LW)
plot(radians,squiggle+2.5*height,'k','LineWidth',LW)
plot(radians,squiggle+2.7*height,'k','LineWidth',LW)
plot(cap(:,1),cap(:,2)*.5+2.7*height,'k','LineWidth',LW)
% square k
pos = [width*.5-.5*rad height*.5-.5*rad+3.2*height rad rad];
rectangle('Position',pos,'Curvature',[1 1],'FaceColor','k')
plot(square(:,1),square(:,2)+3.2*height,'k','LineWidth',LW)
% broken square
plot(cup(:,1),cup(:,2)*.5+4.2*height,'k','LineWidth',LW)
plot(radians,squiggle+4.7*height,'k','LineWidth',LW)
plot(radians,squiggle+4.9*height,'k','LineWidth',LW)
plot(cap(:,1),cap(:,2)*.5+4.9*height,'k','LineWidth',LW)
% top square
pos = [width*.5-.5*rad height*.5-.5*rad+5.4*height rad rad];
rectangle('Position',pos,'Curvature',[1 1],'FaceColor','k')
plot(square(:,1),square(:,2)+5.4*height,'k','LineWidth',LW)
hold off
axis equal
set(gca,'Visible','off');
print(gcf,'axial_description.png','-dpng','-r800'); 