clear

close all

LW = 2;
FS = 14;
FN = 'Times New Roman';
rfuel = 0.270510;
rbond = rfuel*(1.7);
rclad = rbond*(1.8);


lo = 0;
hi = 4;
txt_lo = lo - .3;
txt_hi = hi * (1.05);
txt_md = 0.8*(txt_lo+txt_hi);

xmax = 1.5;

figure
hold on
plot([0,0],[lo,hi],'k--','LineWidth',LW)
plot([rfuel,rfuel],[lo,hi],'k','LineWidth',LW)
plot([rbond,rbond],[lo,hi],'k','LineWidth',LW)
plot([rclad,rclad],[lo,hi],'k','LineWidth',LW)

text(0,txt_hi,'T_0','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(rfuel,txt_hi,'T_F','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(rbond,txt_hi,'T_B','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(rclad,txt_hi,'T_C','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(0.5*(rclad+xmax),txt_hi,'T_{\infty}','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')

text(0,txt_lo,'r=0','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
% CENTER-LINE SYMBOL
text(0,txt_lo+0.3,sprintf('\x2104'),'FontSize',24,'FontName','Cambria Math','HorizontalAlignment','center')
text(rfuel,txt_lo,'R_F','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(rbond,txt_lo,'R_B','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(rclad,txt_lo,'R_C','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')

text(0.5*rfuel,txt_md,'Fuel','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(0.5*(rfuel+rbond),txt_md,'Bond','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(0.5*(rbond+rclad),txt_md,'Clad','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')
text(0.5*(rclad+xmax),txt_md,'Coolant','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')

% single apostrophe is indicated by ''
text(0.5*rfuel,txt_md-1,'q''''''','FontSize',FS,'FontName',FN,'HorizontalAlignment','center')

% coolant arrrows
axis(axis)
arrow([rclad+0.2,lo*1.2],[rclad+0.2,hi*.5]);
arrow([rclad+0.3,lo*1.2+0.6],[rclad+0.3,hi*.5+0.6]);
arrow([rclad+0.4,lo*1.2],[rclad+0.4,hi*.5]);

hold off
xlim([-0.1,xmax])
ylim([lo-0.5,hi*1.1])
set(gca,'Visible','off')
print('../figs/radial_model.eps','-depsc2');
close(gcf)






