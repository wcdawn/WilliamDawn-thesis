clear
close all

fname = 'radial.csv';
rfuel = 0.270510;
rbond = 0.312420;
rclad = 0.368300;
Tfuel_ave = 0.223140E+04;
Tbond_ave = 0.137485E+04;
Tclad_ave = 0.979103E+03;

LW = 2;
FS = 13;
matlab_blue = [0 0.4470 0.7410];
matlab_orange = [0.9100    0.4100    0.1700];

data = csvread(fname);
r = data(:,1);
T = data(:,2);

figure
hold on
plot(r,T,'Color',matlab_blue,'LineWidth',LW)
plot([0,rfuel],[Tfuel_ave,Tfuel_ave],'Color',matlab_orange,'LineWidth',LW)
plot([rfuel,rbond],[Tbond_ave,Tbond_ave],'Color',matlab_orange,'HandleVisibility','off','LineWidth',LW)
plot([rbond,rclad],[Tclad_ave,Tclad_ave],'Color',matlab_orange,'HandleVisibility','off','LineWidth',LW)
legend({'Radial Temperature','Average Temperature'},'Location','SouthWest')
yl = ylim();
plot([rfuel,rfuel],yl,'k','HandleVisibility','off','LineWidth',LW)
plot([rbond,rbond],yl,'k','HandleVisibility','off','LineWidth',LW)
plot([rclad,rclad],yl,'k','HandleVisibility','off','LineWidth',LW)
text(0.5*rfuel,2000,'Fuel','HorizontalAlignment','Center','FontSize',FS)
text(0.5*(rfuel+rbond),1700,'Bond','HorizontalAlignment','Center','FontSize',FS)
text(0.5*(rbond+rclad),1300,'Clad','HorizontalAlignment','Center','FontSize',FS)

ylim(yl);
title('Representative Temperature Calculation')
xlabel('Radius [cm]')
ylabel('Temperature [Arbitrary]')
hold off

