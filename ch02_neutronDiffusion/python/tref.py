import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = 'Times New Roman'
FS = 12
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix') # not explicitly Times New Roman but a good clone
plt.rc('font', family=FN, size=FS)

plt.figure()
ax = plt.gca()
plt.plot([0, 1, 0, 0], [0, 0, 1, 0], '-ko')
plt.xlabel('$$\\eta$$', usetex=True)
plt.ylabel('$$\\xi$$', usetex=True)
ax.set_aspect('equal', 'box')
plt.ylim(plt.xlim())
plt.savefig('../figs/Tref.pdf', bbox_inches='tight', pad_inches=0)
plt.close()
