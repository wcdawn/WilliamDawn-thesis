import numpy as np
import matplotlib.pyplot as plt
import scipy
import scipy.optimize

# analytic solution to two-region one-group neutron diffusion equation
# reflective boundary condition at x=0
# material change at x=LF
# zero-flux  boundary condition at x=LR

LW = 2
FN = "Times New Roman"
FS = 14
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

LF = 80.0  # switch materials
LR = 100.0  # end of problem
ntest = 200

# fuel material properties
D_F = 1.2
S_rF = 0.02
nuS_fF = 0.02

D_R = 0.7
S_rR = 0.015
nuS_fR = 0

B_R = np.sqrt(S_rR / D_R)
f = lambda x: D_F * x * np.tan(x * LF) - (D_R * B_R) / np.tanh(B_R * (LR - LF))
B_F = scipy.optimize.fsolve(f, 0.03)[0]
keff = nuS_fF / (B_F**2 * D_F + S_rF)

print("B_F = {:.19f}".format(B_F))
print("keff = {:.6}".format(keff))

c1f = 1  # arbitrary
c2f = 0  # dictated by reflective bc at x=0
c1r = c1f * np.cos(B_F * LF)  # dictated by flux continuity
c2r = -(D_F * c1f * B_F * np.sin(B_F * LF)) / (
    D_R * B_R
)  # dictated by current continuity

fuel = lambda x: c1f * np.cos(B_F * x) + c2f * np.sin(B_F * x)
refl = (
    lambda x: c1f
    * np.cos(B_F * LF)
    * (np.cosh(B_R * (x - LF)) - np.sinh(B_R * (x - LF)) / np.tanh(B_R * (LR - LF)))
)


def fun(x):
    if x <= LF:
        return fuel(x)
    return refl(x)


xtest = np.linspace(0.0, LR, ntest)
ytest = np.zeros_like(xtest)
for i in range(ntest):
    ytest[i] = fun(xtest[i])

plt.figure()
plt.plot(xtest, ytest)
yl = plt.ylim()
plt.plot((LF, LF), yl, "k", lw=1)
plt.text(0.5 * LF, 0.5, "Fuel")
plt.text(LF + 0.1 * (LR - LF), 0.5, "Reflector")
plt.title("One-Dimension, One-Group, Two Region, Criticality")
plt.ylim((0.0, 1.0))
plt.xlim((0.0, LR))
plt.xlabel("x [cm]")
plt.ylabel("$\phi(x)$")
plt.savefig("../figs/2reg.pdf")
