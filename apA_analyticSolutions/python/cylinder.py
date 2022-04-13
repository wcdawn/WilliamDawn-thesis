import numpy as np
import matplotlib.pyplot as plt
import scipy
import scipy.special

LW = 2
FN = "Times New Roman"
FS = 12
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

T = 50.0
H = 100.0
ntest = 100

alpha_0 = scipy.special.jn_zeros(0, 1)[0]
fun = lambda r, z: scipy.special.j0(alpha_0 / T * r) * np.sin(np.pi / H * z)

dr = T / ntest
dz = H / ntest

r = np.arange(0.5 * dr, T, dr)
z = np.arange(0.5 * dz, H, dz)

R, Z = np.meshgrid(r, z)
val = fun(R, Z)

plt.figure()
plt.imshow(val, extent=[0, T, 0, H])
plt.xlim((0, T))
plt.ylim((0, H))
plt.colorbar()
plt.xlabel("r [cm]")
plt.ylabel("z [cm]")
plt.title("Slice of Finite Cylinder")
plt.savefig("../figs/finite_cyl.pdf")

plt.show()
