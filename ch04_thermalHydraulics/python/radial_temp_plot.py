import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = "Times New Roman"
FS = 12
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

rfuel = 0.270510
rbond = 0.312420
rclad = 0.368300
Tfuel_ave = 0.990696e03
Tbond_ave = 0.788836e03
Tclad_ave = 0.676579e03

fname = "../data/radial.csv"
data = np.loadtxt(fname, delimiter=",")
r = data[:, 0]
T = data[:, 1]

fname_const = "../data/kfuel_radial.csv"
data = np.loadtxt(fname_const, delimiter=",")
rconst = data[:, 0]
Tconst = data[:, 1]
rconst = rconst[rconst <= rfuel]
Tconst = Tconst[: len(rconst)]

myTfuel_ave = 0.0
myTbond_ave = 0.0
myTclad_ave = 0.0
for i in range(len(T)):
    if i > 0:
        dr = r[i] - r[i - 1]
    else:
        dr = r[i]
    if r[i] <= rfuel:
        myTfuel_ave += T[i] * r[i] * dr
    elif r[i] <= rbond:
        myTbond_ave += T[i] * r[i] * dr
    else:
        myTclad_ave += T[i] * r[i] * dr

myTfuel_ave = myTfuel_ave / (rfuel**2 * 0.5)
myTbond_ave = myTbond_ave / (0.5 * (rbond**2 - rfuel**2))
myTclad_ave = myTclad_ave / (0.5 * (rclad**2 - rbond**2))

print(
    "Tfuel_ave = {:.2f} {:.2f} {:.2f}".format(
        Tfuel_ave, myTfuel_ave, Tfuel_ave - myTfuel_ave
    )
)

print(
    "Tbond_ave = {:.2f} {:.2f} {:.2f}".format(
        Tbond_ave, myTbond_ave, Tbond_ave - myTbond_ave
    )
)

print(
    "Tclad_ave = {:.2f} {:.2f} {:.2f}".format(
        Tclad_ave, myTclad_ave, Tclad_ave - myTclad_ave
    )
)

plt.figure()
plt.plot(rconst, Tconst, ":", color="r", lw=3)
plt.plot(r, T)
p = plt.plot((0, rfuel), (Tfuel_ave, Tfuel_ave), "--")
p = p[0]
plt.plot((rfuel, rbond), (Tbond_ave, Tbond_ave), "--", color=p._color)
plt.plot((rbond, rclad), (Tclad_ave, Tclad_ave), "--", color=p._color)
plt.legend(["$k_F$ Constant", "Radial Temperature", "Average Temperature"])

yl = plt.ylim()
plt.plot((rfuel, rfuel), yl, "k", lw=1)
plt.plot((rbond, rbond), yl, "k", lw=1)
plt.plot((rclad, rclad), yl, "k", lw=1)

plt.text(0.5 * (rfuel), 900, "Fuel", ha="center")
plt.text(0.5 * (rfuel + rbond), 900, "Bond", ha="center")
plt.text(0.5 * (rbond + rclad), 900, "Clad", ha="center")

plt.ylim(yl)
xl = plt.xlim()
plt.xlim((0.0, xl[1]))

plt.title("Representative Temperature Calculation")
plt.xlabel("Radius [cm]")
plt.ylabel("Temperature [K]")

plt.tight_layout()
plt.savefig("../figs/radial_temp_plot.pdf")
