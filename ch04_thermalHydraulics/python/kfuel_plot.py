import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = 'Times New Roman'
FS = 12
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix')
plt.rc('font', family=FN, size=FS)

kU   = lambda T : (21.73 + 1.591e-2*T + 5.907e-6*T**2);
kZr  = lambda T : (8.853 + 7.082e-3*T + 2.533e-6*T**2 + 2.992e3/T);
kcZr = lambda T, x : (-102.0 + 200.1*x - 109.2*x**2 +9.453e-3*T + 3.459e-5*T**2 - 
    0.02093*x*T);
kUZr = lambda T, x : ((1 - np.sqrt(1-x))*kZr(T) + np.sqrt(1-x)*((1-x)*kU(T) + 
    x*kcZr(T,x)));

kHT9 = 64.33 # [W/m/K]
kNa  = 25.81 # [W/m/K]

x = 0.1 # U10Zr

Ttest = np.linspace(400., 1200., 100)
ktest = kUZr(Ttest, x)

plt.figure()
plt.plot(Ttest, ktest)
plt.plot([Ttest[0], Ttest[-1]], [kHT9, kHT9], '--')
plt.plot([Ttest[0], Ttest[-1]], [kNa,  kNa],  '-.')
plt.xlim([Ttest[0], Ttest[-1]])
plt.xlabel('T [K]')
plt.ylabel('Thermal Conductivity [W/m/K]')
plt.title('Thermal Conductivity of Reactor Materials')
plt.legend(['$k_{U10Zr}$', '$k_{HT9}$', '$k_{Na}$'])
plt.tight_layout()
plt.savefig('../figs/kfuel_plot.pdf', bbox_inches='tight', pad_inches=0)
plt.close()
