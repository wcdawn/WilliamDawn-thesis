import numpy as np
import matplotlib.pyplot as plt

# 3d figures
from mpl_toolkits.mplot3d import Axes3D

# 3d arrows
from matplotlib.patches import FancyArrowPatch
from mpl_toolkits.mplot3d import proj3d

class Arrow3D(FancyArrowPatch):
    def __init__(self, xs, ys, zs, *args, **kwargs):
        FancyArrowPatch.__init__(self, (0,0), (0,0), *args, **kwargs)
        self._verts3d = xs, ys, zs

    def draw(self, renderer):
        xs3d, ys3d, zs3d = self._verts3d
        xs, ys, zs = proj3d.proj_transform(xs3d, ys3d, zs3d, renderer.M)
        self.set_positions((xs[0],ys[0]),(xs[1],ys[1]))
        FancyArrowPatch.draw(self, renderer)

# draw a cube
cube_fnt = np.array([
    [0,1,0],
    [0,0,0],
    [1,0,0],
    [0,0,0],
    [0,0,1],
    [0,1,1],
    [0,1,0],
    [0,1,1],
    [1,1,1],
    [1,0,1],
    [1,0,0],
    [1,0,1],
    [0,0,1]])

cube_bak = np.array([
    [0,1,0],
    [1,1,0],
    [1,0,0],
    [1,1,0],
    [1,1,1]])

LW = 2 # 3
LW = 3
FN = 'Times New Roman'
FS = 12 # 14
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix') # not explicitly Times New Roman but a good clone
plt.rc('font', family=FN, size=FS)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax._axis3don=False # hide axes
ax.view_init(elev=-40, azim=30)

ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')

plt.plot(cube_fnt[:,0], cube_fnt[:,1] ,cube_fnt[:,2], '-k')
plt.plot(cube_bak[:,0], cube_bak[:,1] ,cube_bak[:,2], ':k')

a = Arrow3D([0.3, 0.3], [0.0, -0.7], [0.5, 0.5], mutation_scale=20, lw=3,
        arrowstyle='-|>', color='k')
ax.add_artist(a)
ax.text(0.0, -1.0, 0.5, '$\Delta y = F_r(T_{struct})$')

a = Arrow3D([0.0, -1.0], [0.5, 0.5], [0.5, 0.5], mutation_scale=20, lw=3,
        arrowstyle='-|>', color='k')
ax.add_artist(a)
ax.text(-0.8, 0.5, 0.2, '$\Delta x = F_r(T_{struct})$')

a = Arrow3D([0.5, 0.5], [0.5, 0.5], [1.0, 1.8], mutation_scale=20, lw=3,
        arrowstyle='-|>', color='k')
ax.add_artist(a)
ax.text(0.6, 0.5, 1.8, '$\Delta z = F_a(T_{fuel})$')

plt.savefig('../figs/thexp_figure.pdf')
plt.close(fig)
