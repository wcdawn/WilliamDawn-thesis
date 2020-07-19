import numpy as np
import matplotlib.pyplot as plt
from scipy import sparse

def bandwidth(A):
    this_bandwidth = 0
    rank = A.shape[0]
    for i in range(rank):
        lo = 0
        hi = rank
        isLow = True
        for j in range(rank):
            if ((isLow) and (np.absolute(A[i,j]) > 0.0)):
                lo = j
                isLow = False
            elif (np.absolute(A[i,j]) > 0.0):
                hi = j
        this_bandwidth = max(hi-lo, this_bandwidth)
    return this_bandwidth

LW = 2
FN = 'Times New Roman'
FS = 12
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix')
plt.rc('font', family=FN, size=FS)

fname_uno = '../data/uno.csv'
fname_rcm = '../data/rcm.csv'

data_uno = np.loadtxt(fname_uno, delimiter=',')
data_rcm = np.loadtxt(fname_rcm, delimiter=',')

rank = int(data_uno[:,0].max())
A_uno = np.zeros([rank,rank])
A_rcm = np.zeros([rank,rank])

for i in range(len(data_uno[:,0])):
    A_uno[int(data_uno[i,0])-1,int(data_uno[i,1])-1] = data_uno[i,2]
    A_rcm[int(data_rcm[i,0])-1,int(data_rcm[i,1])-1] = data_rcm[i,2]

plt.figure()
plt.spy(A_uno, markersize=2)
plt.title('Unordered Pattern - Bandwidth {:d}'.format(bandwidth(A_uno)))
plt.tight_layout()
plt.savefig('../figs/uno_pattern.pdf', bbox_inches='tight', pad_inches=0)
plt.close()

plt.figure()
plt.spy(A_rcm, markersize=2)
plt.title('RCM Pattern - Bandwidth {:d}'.format(bandwidth(A_rcm)))
plt.tight_layout()
plt.savefig('../figs/rcm_pattern.pdf', bbox_inches='tight', pad_inches=0)
plt.close()
