import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

# set plot attributes
LW = 2
FN = 'Times New Roman'
FS = 12
plt.rc('lines', lw=LW)
plt.rc('mathtext', fontset='stix')
plt.rc('font', family=FN, size=FS)

# pin model
rfuel = 0.270510
rbond = 0.332420
rclad = 0.398300
rwrap = 0.08

radian = np.linspace(0.0, 2.0*np.pi, 100)
circle = np.zeros([radian.size, 2])
circle[:,0] = np.cos(radian)
circle[:,1] = np.sin(radian)

fig = plt.figure()
ax = fig.gca()

circle = mpatches.Circle([0.0, 0.0], rclad, fc='w', ec='k', hatch='//')
ax.add_artist(circle)
circle = mpatches.Circle([0.0, 0.0], rbond, fc='w', ec='k', hatch='+')
ax.add_artist(circle)
circle = mpatches.Circle([0.0, 0.0], rfuel, fc='w', ec='k', hatch='\\')
ax.add_artist(circle)
circle = mpatches.Circle([(rclad+rwrap)*np.cos(np.pi*0.25),
    (rclad+rwrap)*np.sin(np.pi*0.25)], rwrap, fc=[0.5, 0.5, 0.5], ec='k')
ax.add_artist(circle)

ax.axis('equal')
ax.set(xlim=(-1.45*rclad, 1.45*rclad), ylim=(-1.45*rclad, 1.45*rclad))

ax.annotate('', xytext=[0.0,0.0], 
    xy=np.array([np.cos(2.0*np.pi/3.0), np.sin(2.0*np.pi/3.0)])*rclad, 
    arrowprops=dict(arrowstyle='-|>', color='k'))
ax.annotate('', xytext=[0.0,0.0], 
    xy=np.array([np.cos(np.pi*0.5), np.sin(np.pi*0.5)])*rbond, 
    arrowprops=dict(arrowstyle='-|>', color='k'))
ax.annotate('', xytext=[0.0,0.0], 
    xy=np.array([np.cos(np.pi*0.2), np.sin(np.pi*0.2)])*rfuel, 
    arrowprops=dict(arrowstyle='-|>', color='k'))
wrap_center = np.array([np.cos(np.pi*0.25), np.sin(np.pi*0.25)])*(rclad+rwrap)
ax.annotate('', xytext=wrap_center-np.array([np.cos(np.pi*0.75), np.sin(np.pi*0.75)])*rwrap, 
    xy=wrap_center+np.array([np.cos(np.pi*0.75), np.sin(np.pi*0.75)])*rwrap,
    arrowprops=dict(arrowstyle='-|>', color='k'))
ax.annotate('', xytext=wrap_center+np.array([np.cos(np.pi*0.75), np.sin(np.pi*0.75)])*rwrap, 
    xy=wrap_center-np.array([np.cos(np.pi*0.75), np.sin(np.pi*0.75)])*rwrap,
    arrowprops=dict(arrowstyle='-|>', color='k'))

plt.text(0.5*rfuel*np.cos(np.pi*0.2)+0.03, 0.5*rfuel*np.sin(np.pi*0.2)-0.01,
        '$R_{Fuel}$')
plt.text(0.01, 0.5*rbond*np.sin(np.pi*0.5), '$R_{Bond}$')
plt.text(0.5*rclad*np.cos(2.0*np.pi/3.0)-0.07, 0.5*rclad*np.sin(2.0*np.pi/3.0)-0.05,
        '$R_{Clad}$')
plt.text(wrap_center[0]+0.02, wrap_center[1]-0.12, '$D_{Wrap}$')

plt.axis('off')
plt.savefig('../figs/pin_model.pdf', bbox_inches='tight', pad_inches=0)
plt.close(fig)
