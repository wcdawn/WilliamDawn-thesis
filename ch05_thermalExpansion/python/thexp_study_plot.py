import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = "Times New Roman"
FS = 12
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

kref = 1.1829318272893925

fname = "../data/thexp_study.csv"
data = np.loadtxt(fname, delimiter=",")
temperature = data[:, 0]
k = data[:, 1]

plt.figure()
plt.plot(temperature, k, "-o")
plt.title("Thermal Expansion Reactivity Study")
plt.xlabel("Thermal Expansion Temperature [K]")
plt.ylabel("$k_{eff}$")
plt.tight_layout()
plt.savefig("../figs/thexp_study.pdf")

rho = (k - kref) / (k * kref) * 1e5

plt.figure()
plt.plot(temperature, rho, "-o")
plt.title("Thermal Expansion Reactivity Study")
plt.xlabel("Thermal Expansion Temperature [K]")
plt.ylabel("$\Delta \\rho$ [pcm]")
plt.tight_layout()
plt.savefig("../figs/thexp_study_reactivity.pdf")
