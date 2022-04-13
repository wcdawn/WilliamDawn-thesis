import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import os

dirname = os.path.dirname(__file__)

LW = 2
FN = 'Times New Roman'
FS = 14
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix')
plt.rc('font', family=FN, size=FS)

rfuel = 0.270510
rbond = rfuel * 1.7
rclad = rbond * 1.8

lo = 0.0
hi = 4.0
txt_lo = lo - 0.3
txt_hi = hi * 1.05
txt_md = 0.8*(txt_lo+txt_hi)

xmax = 1.5

fig = plt.figure()

plt.plot([0.0, 0.0], [lo, hi], '--k')
plt.plot([rfuel, rfuel], [lo, hi], '-k')
plt.plot([rbond, rbond], [lo, hi], '-k')
plt.plot([rclad, rclad], [lo, hi], '-k')

plt.text(0.0, txt_hi, '$T_0$', ha='center')
plt.text(rfuel, txt_hi, '$T_F$', ha='center')
plt.text(rbond, txt_hi, '$T_B$', ha='center')
plt.text(rclad, txt_hi, '$T_C$', ha='center')
plt.text(0.5*(rclad+xmax), txt_hi, '$T_{\infty}$', ha = 'center')

plt.text(0.0, txt_lo-0.3, '$r=0$', ha='center')
# CENTER-LINE SYMBOL
cl_symbol = u"\u2104"
plt.text(0.0, txt_lo, cl_symbol, ha='center', fontname='DejaVu Sans',
        fontsize=24)
plt.text(rfuel, txt_lo, '$R_F$', ha='center')
plt.text(rbond, txt_lo, '$R_B$', ha='center')
plt.text(rclad, txt_lo, '$R_C$', ha='center')

plt.text(0.5*rfuel, txt_md, 'Fuel', ha='center')
plt.text(0.5*(rfuel+rbond), txt_md, 'Bond', ha='center')
plt.text(0.5*(rbond+rclad), txt_md, 'Clad', ha='center')
plt.text(0.5*(rclad+xmax), txt_md, 'Coolant', ha='center')

plt.text(0.5*rfuel, txt_md-1.0, "$q'''$", ha='center')

# coolant arrows
ax = plt.gca()
ax.annotate('', xy=[rclad+0.2,hi*.5], xytext=[rclad+0.2,lo*1.2], arrowprops=dict(arrowstyle='->'))
ax.annotate('', xy=[rclad+0.3,hi*.5+0.6], xytext=[rclad+0.3,lo*1.2+0.6], arrowprops=dict(arrowstyle='->'))
ax.annotate('', xy=[rclad+0.4,hi*.5], xytext=[rclad+0.4,lo*1.2], arrowprops=dict(arrowstyle='->'))

plt.xlim([-0.1, xmax])
plt.ylim([lo-0.5, hi*1.1])
plt.axis('off')

plt.tight_layout()
plt.savefig(os.path.join(dirname, '../figs/radial_model.pdf'), bbox_inches='tight')
plt.close(fig)
