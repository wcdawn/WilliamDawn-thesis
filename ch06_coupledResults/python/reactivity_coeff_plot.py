import numpy as np
import matplotlib.pyplot as plt

LW = 2
FN = "Times New Roman"
FS = 12
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

fname = "../data/reactivity_study_correctTemp.csv"
fuelfudge = 5.0  # [K]
coolfudge = 5.0  # [K]
powerfudge = 5.0  # [%]

data = np.loadtxt(fname, delimiter=",")
nPower = data.shape[0]
nCondition = data.shape[1] - 4
power = data[:, 0]
temperature_avg = data[:, 1:4]
keff = data[:, 4:]

reac = np.zeros((nPower, nCondition))
for i in range(nPower):
    for j in range(nCondition):
        reac[i, j] = (keff[i, j] - 1.0) / keff[i, j]
reac *= 1e5

nCoeff = nCondition
alpha = np.zeros((nPower, nCondition))
for i in range(nPower):
    # \alpha_{Power}
    alpha[i, 0] = (reac[i, 1] - reac[i, 0]) / powerfudge
    # \alpha_{TE}
    alpha[i, 1] = (reac[i, 2] - reac[i, 0]) / powerfudge
    # \alpha_{Tfuel} (Doppler)
    alpha[i, 2] = (reac[i, 3] - reac[i, 0]) / fuelfudge
    # \alpha_{Tcool}
    alpha[i, 3] = (reac[i, 4] - reac[i, 0]) / coolfudge

LWs = 1

plt.figure()
plt.plot(power, keff[:, 0], "-o", lw=LW)
plt.plot(power, keff[:, 1], "s", lw=LWs)
plt.plot(power, keff[:, 2], "^", lw=LWs)
plt.plot(power, keff[:, 3], "p", lw=LWs)
plt.plot(power, keff[:, 4], "x", lw=LWs)
plt.xlim((0, 100))
plt.xlabel("% Power")
plt.ylabel("$k_{eff}$")
plt.title("$k_{eff}$ Effects")
plt.legend(
    [
        "All Feedback",
        "$T_{{fuel}}$+{:.0f}[K]".format(fuelfudge),
        "$T_{{cool}}$+{:.0f}[K]".format(coolfudge),
        "$Q_{{Rx}}$+{:.0f}%".format(powerfudge),
        "Thexp $Q_{{Rx}}$+{:.0f}%".format(powerfudge),
    ]
)
plt.tight_layout()
plt.savefig("../figs/keff_effects.pdf")

plt.figure()
plt.plot(power, alpha[:, 0], "-o")
plt.xlabel("Reactor Power [%]")
plt.ylabel("$\\alpha_{power}$ [pcm/%]")
plt.title("Power Reactivity Coefficient")
plt.tight_layout()
plt.savefig("../figs/alpha_power.pdf")

plt.figure()
plt.plot(power, alpha[:, 1], "-o")
plt.xlabel("Reactor Power [%]")
plt.ylabel("$\\alpha_{thexp}$ [pcm/%]")
plt.title("Thermal Expansion Reactivity Coefficient")
plt.tight_layout()
plt.savefig("../figs/alpha_thexp.pdf")

plt.figure()
plt.plot(temperature_avg[:, 0], alpha[:, 2], "-o")
plt.xlabel("$\overline{T_{fuel}}$ [K]")
plt.ylabel("$\\alpha_{Doppler}$ [pcm/K]")
plt.title("Doppler Reactivity Coefficient")
plt.tight_layout()
plt.savefig("../figs/alpha_fuel.pdf")

plt.figure()
plt.plot(temperature_avg[:, 2], alpha[:, 3], "-o")
plt.xlabel("$\overline{T_{cool}}$ [K]")
plt.ylabel("$\\alpha_{CTC}$ [pcm/K]")
plt.title("Coolant Temperature Reactivity Coefficient")
plt.tight_layout()
plt.savefig("../figs/alpha_cool.pdf")

plt.show()
