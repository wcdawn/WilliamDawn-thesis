import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = 'Times New Roman'
FS = 20
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix')
plt.rc('font', family=FN, size=FS)

node = np.array([
    [0.0,0.0],   # 5
    [1.0,1.0],   # 96
    [-1.0,1.0],  # 8
    [-0.3,-0.1], # 200
    [0.5,-0.3]]) # 48

element = np.array([
    [1,2,3],
    [1,3,4],
    [1,4,5],
    [1,5,2]])
element -= 1 # adjust for zero-based index

plt.figure()
plt.triplot(node[:,0], node[:,1], element, '-ko')
plt.text(node[0,0], node[0,1]+0.1, '5')
plt.text(node[1,0], node[1,1]+0.1, '96')
plt.text(node[2,0], node[2,1]+0.1, '8')
plt.text(node[3,0], node[3,1]-0.15, '200')
plt.text(node[4,0], node[4,1]-0.1, '48')
plt.xlim([-1.1,1.1])
plt.axis('off')
plt.tight_layout()
plt.savefig('../figs/adjacency_graph.pdf', bbox_inches='tight', pad_inches=0)
plt.show()
