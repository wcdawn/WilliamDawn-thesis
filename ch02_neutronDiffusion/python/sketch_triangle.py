import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = 'Times New Roman'
FS = 12
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix') # not explicitly Times New Roman but a good clone
plt.rc('font', family=FN, size=FS)

tri = np.array([
    [0.7, 0.5],
    [0.2, 0.5],
    [0.0, -0.1],
    [0.7, 0.5]])

plt.figure()
plt.plot(tri[:,0], tri[:,1], '-ko')
plt.axis('equal')
plt.axis('off')
plt.tight_layout()
plt.savefig('../figs/sketch_triangle.pdf', bbox_inches='tight', pad_inches=0)
plt.close()
