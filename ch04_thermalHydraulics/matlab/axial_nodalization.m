clear
close all

LW = 2;
width = 1.3;
height = 2;
rad=0.3;
rt_txt = 1.2 * width;
lf_txt = -0.8*width;
FS = 10;
FN = 'Times New Roman';


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
text(rt_txt,0,'h_{1/2}','FontSize',FS,'FontName',FN)
text(rt_txt,height,'h_{3/2}','FontSize',FS,'FontName',FN)
text(lf_txt,0.5*height,'h_1','FontSize',FS,'FontName',FN)
% square 2
pos = [width*.5-.5*rad height*.5-.5*rad+height rad rad];
rectangle('Position',pos,'Curvature',[1 1],'FaceColor','k')
plot(square(:,1),square(:,2)+height,'k','LineWidth',LW)
text(rt_txt,height*2,'h_{5/2}','FontSize',FS,'FontName',FN)
text(lf_txt,height*1.5,'h_2','FontSize',FS,'FontName',FN)
% broken square
plot(cup(:,1),cup(:,2)*.5+2*height,'k','LineWidth',LW)
plot(radians,squiggle+2.5*height,'k','LineWidth',LW)
plot(radians,squiggle+2.7*height,'k','LineWidth',LW)
plot(cap(:,1),cap(:,2)*.5+2.7*height,'k','LineWidth',LW)
% square k
pos = [width*.5-.5*rad height*.5-.5*rad+3.2*height rad rad];
rectangle('Position',pos,'Curvature',[1 1],'FaceColor','k')
plot(square(:,1),square(:,2)+3.2*height,'k','LineWidth',LW)
text(rt_txt,3.2*height,'h_{k-1/2}','FontSize',FS,'FontName',FN)
text(rt_txt,4.2*height,'h_{k+1/2}','FontSize',FS,'FontName',FN)
text(lf_txt,3.7*height,'h_k','FontSize',FS,'FontName',FN)
% broken square
plot(cup(:,1),cup(:,2)*.5+4.2*height,'k','LineWidth',LW)
plot(radians,squiggle+4.7*height,'k','LineWidth',LW)
plot(radians,squiggle+4.9*height,'k','LineWidth',LW)
plot(cap(:,1),cap(:,2)*.5+4.9*height,'k','LineWidth',LW)
% top square
pos = [width*.5-.5*rad height*.5-.5*rad+5.4*height rad rad];
rectangle('Position',pos,'Curvature',[1 1],'FaceColor','k')
plot(square(:,1),square(:,2)+5.4*height,'k','LineWidth',LW)
text(rt_txt,5.4*height,'h_{Nz-1/2}','FontSize',FS,'FontName',FN)
text(rt_txt,6.4*height,'h_{Nz+1/2}','FontSize',FS,'FontName',FN)
text(lf_txt,5.9*height,'h_{Nz}','FontSize',FS,'FontName',FN)
hold off
axis equal
set(gca,'Visible','off');
print('../figs/axial_model.eps','-depsc2');
close(gcf);