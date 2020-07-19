import numpy as np
import matplotlib.pyplot as plt

def axisEqual3D(ax):
    extents = np.array([getattr(ax, 'get_{}lim'.format(dim))() for dim in 'xyz'])
    sz = extents[:,1] - extents[:,0]
    centers = np.mean(extents, axis=1)
    maxsize = max(abs(sz))
    r = maxsize/2
    for ctr, dim in zip(centers, 'xyz'):
        getattr(ax, 'set_{}lim'.format(dim))(ctr - r, ctr + r)

LW = 2
FN = 'Times New Roman'
FS = 12
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix') # not explicitly Times New Roman but a good clone
plt.rc('font', family=FN, size=FS)

tri_front = np.array([
    [1,0,-1],
    [0,1,-1],
    [0,1,1],
    [0,0,1],
    [1,0,1],
    [0,1,1],
    [1,0,1],
    [1,0,-1]])

tri_back = np.array([
    [1,0,-1],
    [0,0,-1],
    [0,1,-1],
    [0,0,-1],
    [0,0,1]])
    
fig = plt.figure()
ax = fig.gca(projection='3d')
plt.plot(tri_front[:,0], tri_front[:,1], tri_front[:,2], '-ko')
plt.plot(tri_back[:,0], tri_back[:,1], tri_back[:,2], '--ko')
ax.view_init(elev=30., azim=30.)
ax.set_xlabel('$$\\xi$$', usetex=True)
ax.set_ylabel('$$\\eta$$', usetex=True)
ax.set_zlabel('$$\\zeta$$', usetex=True)
ax.set_xticks([0.0, 0.5, 1.0])
ax.set_yticks([0.0, 0.5, 1.0])
ax.set_zticks([-1.0, -0.5, 0.0, 0.5, 1.0])
axisEqual3D(ax)
plt.tight_layout()
plt.savefig('../figs/Wref.pdf', bbox_inches='tight', pad_inches=0)
plt.close(fig)
