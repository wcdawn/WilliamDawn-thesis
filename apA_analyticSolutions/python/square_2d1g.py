import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = "Times New Roman"
FS = 12
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

Lx = 100.0
Ly = 100.0
ntest = 100

fun = lambda x, y: np.sin(np.pi / Lx * x) * np.sin(np.pi / Ly * y)

dx = Lx / ntest
dy = Ly / ntest

x = np.arange(0.5 * dx, Lx, dx)
y = np.arange(0.5 * dy, Ly, dy)

X, Y = np.meshgrid(x, y)

val = fun(X, Y)

plt.figure()
plt.imshow(val)
plt.xlim((0, Lx))
plt.ylim((0, Ly))
plt.colorbar()
plt.xlabel("x [cm]")
plt.ylabel("y [cm]")
plt.title("Two-Dimension, One-Group, Criticality")
plt.savefig("../figs/2d1g.pdf")
