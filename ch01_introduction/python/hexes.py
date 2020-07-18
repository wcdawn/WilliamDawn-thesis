import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

f2f = 15.0
th = 2.0
gap = 0.7
radius = 2.38
wrap = 0.15*radius
theta = 60.*(np.pi/180.)
pitch = 4.
offset = np.array([(radius+wrap)*np.cos(theta), (radius+wrap)*np.sin(theta)])

LW = 2
FN = 'Times New Roman'
FS = 12
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix') # not explicitly Times New Roman but a good clone
plt.rc('font', family=FN, size=FS)

half = 0.5 * 1.0;
side = (2.0 * half) / np.sqrt(3.0);
base = 0.5 * side;
# hexgon with f2f=1, centered at origin
hexagon = np.array([
    [base, half],
    [-base, half],
    [-side, 0.0],
    [-base, -half],
    [base, -half],
    [side, 0.0],
    [base, half]])
# circle with r=1, centered at origin
npt = 100;
circle = np.zeros([npt, 2])
radian = np.linspace(0.0, 2*np.pi, npt)
circle[:,0] = np.cos(radian)
circle[:,1] = np.sin(radian)

fig = plt.figure()

# hex can
plt.plot(hexagon[:,0]*f2f, hexagon[:,1]*f2f, '-k')
plt.plot(hexagon[:,0]*(f2f+2.0*th), hexagon[:,1]*(f2f+2.0*th), '-k')
plt.plot(hexagon[:,0]*(f2f+2.0*th+2.0*gap), hexagon[:,1]*(f2f+2.0*th+2.0*gap),
        '--k')
geom_can = np.append(hexagon*f2f, hexagon*(f2f+2.0*th), axis=0)
plt.fill(geom_can[:,0], geom_can[:,1], color=[0.5, 0.5, 0.5])
geom_can = hexagon*f2f
plt.fill(geom_can[:,0], geom_can[:,1], color=[1.0, 1.0, 1.0])
# center circle
plt.plot(circle[:,0]*radius, circle[:,1]*radius, '-k')
plt.plot(circle[:,0]*wrap+offset[0], circle[:,1]*wrap+offset[1], '-k')
# ring of pins
for i in range(6):
    this_circle = circle*radius + hexagon[i,:]*pitch*radius
    this_wrap = circle*wrap + hexagon[i,:]*pitch*radius + offset
    plt.plot(this_circle[:,0], this_circle[:,1], '-k')
    plt.plot(this_wrap[:,0], this_wrap[:,1], '-k')

plt.text(-11.5, 6.7, '$Th_{can}$')
plt.text(0.8, 8.5, 'F2F')
plt.text(-7.0, 1.0, 'Pitch')

plt.axis('equal')

plt.annotate('', xy=[0,+9.5], xytext=[0,-9.5], 
    arrowprops=dict(arrowstyle='-|>', color='k'))
plt.annotate('', xy=[0,-9.5], xytext=[0,+9.5], 
    arrowprops=dict(arrowstyle='-|>', color='k'))
plt.annotate('', xy=[-6,0], xytext=[-3,-5], 
    arrowprops=dict(arrowstyle='-|>', color='k'))
plt.annotate('', xy=[-3,-5], xytext=[-6,0], 
    arrowprops=dict(arrowstyle='-|>', color='k'))
plt.annotate('', xy=[-7.8,5.5], xytext=[-6.2,4.45], 
    arrowprops=dict(arrowstyle='-|>', color='k'))
plt.annotate('', xy=[-6.2,4.45], xytext=[-7.8,5.5], 
    arrowprops=dict(arrowstyle='-|>', color='k'))
ax = plt.gca()
plt.annotate('Gap', xy=[0.75,0.76], xytext=[0.85,0.79],
    xycoords=ax.transAxes, arrowprops=dict(arrowstyle='-|>', color='k'))

plt.axis('off')

plt.savefig('../figs/hex_can.pdf', bbox_inches='tight', pad_inches=0)
plt.close(fig)
