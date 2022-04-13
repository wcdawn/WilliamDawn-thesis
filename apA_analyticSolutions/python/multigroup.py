import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = "Times New Roman"
FS = 12
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

Lx = 100
ntest = 100
num_dots = 10

D1 = 1.3466
D2 = 0.37169
sigma_r1 = 2.5255e-2
sigma_r2 = 6.4277e-2
nusf1 = 4.4488e-3
nusf2 = 7.3753e-2
sigma_1to2 = 1.6893e-2

B = np.pi / Lx
c = sigma_1to2 / (D2 * B**2 + sigma_r2)
keff = (nusf1 + nusf2 * c) / (D1 * B**2 + sigma_r1)

fun1 = lambda x: np.sin(np.pi / Lx * x)
fun2 = lambda x: c * np.sin(np.pi / Lx * x)

xtest = np.linspace(0.0, Lx, ntest)
ytest = np.zeros((2, ntest))
for i in range(ntest):
    ytest[0, i] = fun1(xtest[i])
    ytest[1, i] = fun2(xtest[i])

plt.figure()
plt.title("One-Dimension, Two-Group, Criticality")
plt.plot(xtest, ytest[0, :], "-")
plt.plot(xtest, ytest[1, :], "--")
plt.legend(["g=1", "g=2"])
plt.xlabel("x [cm]")
plt.ylabel("$\phi(x)$")
plt.savefig("../figs/1d2g.pdf")
