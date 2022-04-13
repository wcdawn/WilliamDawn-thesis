import numpy as np
import matplotlib.pyplot as plt
import numpy.linalg

LW = 2
FN = "Times New Roman"
FS = 12
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

Lx = 1.0
ntest = 100
num_dots = 11
dot_size = 50

diffusion = 1.0
qfixed = 1.0
sigma_r = 1.0
nusigma_f = 2.0

Bf = np.sqrt(sigma_r / diffusion)

xtest = np.linspace(0.0, Lx, ntest)

fixed = lambda x: (
    (qfixed / Bf**2) * (1 - np.cosh(Bf * x))
    + ((qfixed / Bf**2) * (np.cosh(Bf * Lx) - 1) / (np.sinh(Bf * Lx)))
    * np.sinh(Bf * x)
)

critical = lambda x: np.sin((np.pi / Lx) * x)

ytestf = np.zeros_like(xtest)
ytestc = np.zeros_like(xtest)

for i in range(len(xtest)):
    ytestf[i] = fixed(xtest[i])
    ytestc[i] = critical(xtest[i])

ytestc = ytestc * np.linalg.norm(ytestf, np.Inf)

plt.figure()
plt.title("One-Dimension, One-Group, Fixed and Critical")
plt.plot(xtest, ytestc, "-")
plt.plot(xtest, ytestf, "--")
plt.xlabel("x [cm]")
plt.ylabel("$\phi(x)$")
plt.legend(["Criticality", "Fixed Source"])
plt.tight_layout()
plt.savefig("../figs/fixed_critical.pdf")
