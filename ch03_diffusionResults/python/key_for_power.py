import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = 'Times New Roman'
FS = 45
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix')
plt.rc('font', family=FN, size=FS)

f2f = 1.0
half = 0.5 * f2f
side = (2.0 * half) / np.sqrt(3.0)
base = 0.5 * side
hexagon = np.array([
    [base, half],
    [-base, half],
    [-side, 0],
    [-base, -half],
    [base, -half],
    [side, 0],
    [base, half]])

plt.figure()
plt.plot(hexagon[:,0], hexagon[:,1], '-k')
plt.text(0, 0.2, 'Result', ha='center')
plt.text(0, 0, 'Reference', ha='center')
plt.text(0, -0.2, 'Difference', ha='center')
plt.ylim([-0.6,0.6])
plt.axis('off')
plt.tight_layout()
plt.savefig('../figs/hex_description.pdf', bbox_inches='tight', pad_inches=0)
plt.close()
