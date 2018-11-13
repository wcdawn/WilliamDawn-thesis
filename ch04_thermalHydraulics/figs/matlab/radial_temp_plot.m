clear
close all

fname = '~/dev/thesis/thermal/radial.csv';
fname_const = '~/dev/thesis/thermal/kfuel_radial.csv';
rfuel = 0.270510;
rbond = 0.312420;
rclad = 0.368300;
Tfuel_ave = 0.990696E+03;
Tbond_ave = 0.788836E+03;
Tclad_ave = 0.676579E+03;

LW = 2;
FS = 13;
num_dots = 8;
matlab_blue = [0.00 0.447 0.741];
matlab_orange = [0.91 0.41 0.17];

data = csvread(fname);
r = data(:,1);
T = data(:,2);
data = csvread(fname_const);
rconst = data(:,1);
Tconst = data(:,2);
rconst = rconst(rconst <= rfuel);
Tconst = Tconst(1:length(rconst));

myTfuel_ave = 0.;
myTbond_ave = 0.;
myTclad_ave = 0.;
for i = 1:length(T)
    if (i > 1)
        dr = r(i)-r(i-1);
    else
        dr = r(i);
    end
    if (r(i) <= rfuel)
        myTfuel_ave = myTfuel_ave + T(i)*r(i)*dr;
    elseif (r(i) <= rbond)
        myTbond_ave = myTbond_ave + T(i)*r(i)*dr;
    else
        myTclad_ave = myTclad_ave + T(i)*r(i)*dr;
    end
end
myTfuel_ave = myTfuel_ave/(rfuel^2*0.5);
myTbond_ave = myTbond_ave/(0.5*(rbond^2-rfuel^2));
myTclad_ave = myTclad_ave/(0.5*(rclad^2-rbond^2));

fprintf('Tfuel_ave = %.2f %.2f %.2f\n',Tfuel_ave,myTfuel_ave,Tfuel_ave-myTfuel_ave);
fprintf('Tbond_ave = %.2f %.2f %.2f\n',Tbond_ave,myTbond_ave,Tbond_ave-myTbond_ave);
fprintf('Tclad_ave = %.2f %.2f %.2f\n',Tclad_ave,myTclad_ave,Tclad_ave-myTclad_ave);

ntest = length(rconst);
delta_selected = (1/num_dots)*ntest;
selected = floor(1:delta_selected:ntest);
figure
hold on
plot(rconst,Tconst,'-^','Color','r','LineWidth',1.5,'MarkerIndices',selected,'MarkerFaceColor','r')
plot(r,T,'Color',matlab_blue,'LineWidth',LW)
plot([0,rfuel],[Tfuel_ave,Tfuel_ave],'--','Color',matlab_orange,'LineWidth',LW)
plot([rfuel,rbond],[Tbond_ave,Tbond_ave],'--','Color',matlab_orange,'HandleVisibility','off','LineWidth',LW)
plot([rbond,rclad],[Tclad_ave,Tclad_ave],'--','Color',matlab_orange,'HandleVisibility','off','LineWidth',LW)
legend({'k_F Constant','Radial Temperature','Average Temperature'},'Location','SouthWest')

yl = ylim();
plot([rfuel,rfuel],yl,'k','HandleVisibility','off')
plot([rbond,rbond],yl,'k','HandleVisibility','off')
plot([rclad,rclad],yl,'k','HandleVisibility','off')
text(0.5*rfuel,900,'Fuel','HorizontalAlignment','Center','FontSize',FS)
text(0.5*(rfuel+rbond),900,'Bond','HorizontalAlignment','Center','FontSize',FS)
text(0.5*(rbond+rclad),900,'Clad','HorizontalAlignment','Center','FontSize',FS)

ylim(yl);
title('Representative Temperature Calculation')
xlabel('Radius [cm]')
ylabel('Temperature [K]')
hold off
print(gcf,'../radial_temp_plot.png','-dpng','-r800');
