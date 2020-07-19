import numpy as np
import matplotlib.pyplot as plt

tri_front = np.array([
    [1.5,0,-1],
    [1-np.cos(np.pi/3)+1,np.sin(np.pi/3)+2,-1],
    [1-np.cos(np.pi/3),np.sin(np.pi/3),1],
    [0,0,1],
    [1,0,.3],
    [1-np.cos(np.pi/3),np.sin(np.pi/3),1],
    [1,0,.3],
    [1.5,0,-1]])

tri_back = np.array([
    [1.5,0,-1],
    [0,0,-1],
    [1-np.cos(np.pi/3)+1,np.sin(np.pi/3)+2,-1]])


tri_back2 = np.array([
    [0,0,-1],
    [0,0,1]])

fig = plt.figure()
ax = fig.gca(projection='3d')

ax.plot(tri_front[:,0], tri_front[:,1], tri_front[:,2], '-ko')
ax.plot(tri_back[:,0], tri_back[:,1], tri_back[:,2], '--ko')
ax.plot(tri_back2[:,0], tri_back2[:,1], tri_back2[:,2], '--ko')
ax.set_zlim([-0.85,0.85])
ax.view_init(elev=30., azim=30.)
ax.axis('off')
plt.tight_layout()
plt.savefig('../figs/wedge_stretch.pdf', bbox_inches='tight', pad_inches=0)
plt.close(fig)
