import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = "Times New Roman"
FS = 12
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

analytic_fname = "../data/axial_analytic_results.csv"
data = np.loadtxt(analytic_fname, delimiter=",", skiprows=1)
z = data[:, 0]
qp = data[:, 1]
h = data[:, 2]
Tinf = data[:, 3]
TC = data[:, 4]
TB = data[:, 5]
TF = data[:, 6]
T0 = data[:, 7]
Tcool = data[:, 8]
Tclad = data[:, 9]
Tbond = data[:, 10]
Tfuel = data[:, 11]

tester_fname = "../data/axial_test_results.csv"
data = np.loadtxt(tester_fname, delimiter=",", skiprows=1)
z_tester = data[:, 0]
h_tester = data[:, 1]
Tfuel_tester = data[:, 2]
Tbond_tester = data[:, 3]
Tclad_tester = data[:, 4]
Tcool_tester = data[:, 5]
T0_tester = data[:, 6]

plt.figure()
plt.plot(Tcool_tester, z_tester, "-")
plt.plot(Tclad_tester, z_tester, "--")
plt.plot(Tbond_tester, z_tester, "-.")
plt.plot(Tfuel_tester, z_tester, ":")
plt.legend(["$T_{cool}$", "$T_{clad}$", "$T_{bond}$", "$T_{fuel}$"])
plt.ylim((0, z[-1]))
plt.xlabel("Temperature [K]")
plt.ylabel("Elevation [m]")
plt.title("Modeled Axial Temperature")
plt.tight_layout()
plt.savefig("../figs/axial_temp_plot.pdf")

# project analytic solution onto model grid
Tcool_project = np.interp(z_tester, z, Tcool)

plt.figure()
plt.ylabel("Temperature [K]")
plt.xlabel("z [m]")
p1 = plt.plot(z, Tcool, label="$T_{cool}$ Analytic")
c1 = p1[0]._color
p2 = plt.plot(z_tester, Tcool_tester, "--", label="$T_{cool}$ Model")
c2 = p2[0]._color
p2[0]._color = c1
ax1 = plt.gca()
ax2 = ax1.twinx()
ax2.set_ylabel("Temperature Difference [K]")
p3 = ax2.plot(
    z_tester, Tcool_project - Tcool_tester, "-o", c=c2, label="Analytic-Model"
)
p = p1 + p2 + p3
labs = [l.get_label() for l in p]
ax1.legend(p, labs, loc="lower center")
plt.title("Temperature Difference")
plt.xlim((0, z[-1]))
plt.tight_layout()
plt.savefig("../figs/axial_difference_plot.pdf")

plt.show()
