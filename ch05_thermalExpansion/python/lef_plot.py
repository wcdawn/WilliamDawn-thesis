import numpy as np
import scipy.optimize
import matplotlib.pyplot as plt

lef_ht9 = lambda T : (-2.191e-3 + 5.678e-6*T + 8.111e-9*np.power(T, 2) + 
        -2.576e-12*np.power(T, 3))
lef_fuel_lo = lambda T : (-7.3e-3 + 3.489e-5*T - 5.154e-8*np.power(T, 2) + 
        4.39e-11*np.power(T, 3))
lef_fuel_hi = lambda T : (-0.25252 + 6.669e-4*T - 5.441e-7*np.power(T, 2) + 
        1.518e-10*np.power(T, 3))
lef_fuel = lambda T : (lef_fuel_lo(T)+
        np.heaviside(T-923.0, 0.0)*(lef_fuel_hi(T) - lef_fuel_lo(T)))

print('lef_ht9==0 = {:.6f}'.format(scipy.optimize.fsolve(lef_ht9, 200.0)[0]))
print('lef_fuel==0 = {:.6f}'.format(scipy.optimize.fsolve(lef_fuel, 200.0)[0]))

LW = 2
FN = 'Times New Roman'
FS = 12
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix') # not explicitly Times New Roman but a good clone
plt.rc('font', family=FN, size=FS)

T = np.linspace(400.0, 1200.0, 1000.0)

lef_fuel_data = lef_fuel(T)

fig = plt.figure()
plt.plot(T, lef_fuel_data)
plt.plot(T, lef_ht9(T), '--')
plt.legend(['LEF U10Zr', 'LEF HT9'])
plt.xlabel('Temperature [K]')
plt.ylabel('Linear Expansion Factor (LEF)')
plt.xlim([T[0], T[-1]])
plt.ylim([0.0, lef_fuel_data.max()*1.05])
plt.savefig('../figs/lef_plot.pdf')
ax = plt.gca()
ax.ticklabel_format(axis='y', style='sci', scilimits=[0,2])
plt.close(fig)
