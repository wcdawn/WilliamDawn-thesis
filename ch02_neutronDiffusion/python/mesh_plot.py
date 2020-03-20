import h5py
import numpy as np
import matplotlib.pyplot as plt

fname = '../data/2d1g.h5'

f = h5py.File(fname, 'r')
node = np.array(f['geometry/node'])
element = np.array(f['geometry/element'], dtype=int)
phi = np.array(f['STATE001/phi'][0,0,:]) # scalar flux, group=1
f.close()

plt.figure()
plt.triplot(node[:,0], node[:,1], element, color='k')
plt.axis('off')
plt.tight_layout()
plt.savefig('./mesh.pdf', bbox_inches='tight')
plt.close()

plt.figure()
plt.tricontourf(node[:,0], node[:,1], element, phi)
plt.axis('off')
plt.tight_layout()
plt.savefig('./phi.pdf', bbox_inches='tight')
plt.close()
