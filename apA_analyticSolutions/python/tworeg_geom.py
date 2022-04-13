import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = "Times New Roman"
FS = 15
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

LF = 0.8
LR = 1.0
H = 0.2
L = 1.0
lo = -0.05

plt.figure()
plt.plot([0, LR, LR, 0, 0], [0, 0, H, H, 0], "k")
plt.plot([LF, LF], [0, H], "k")
plt.text(0.5 * LF, 0.5 * H, "Fuel", ha="center")
plt.text(0.5 * (LF + LR), 0.5 * H, "Reflector", ha="center")
plt.text(0, lo, "0", ha="center")
plt.text(LF, lo, "$L_F$", ha="center")
plt.text(LR, lo, "$L_R$", ha="center")
ax = plt.gca()
ax.set_aspect("equal")
plt.axis("off")
plt.tight_layout()
plt.savefig("../figs/2reg_geom.pdf")
