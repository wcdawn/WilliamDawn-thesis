import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Circle

LW = 2
FN = "Times New Roman"
FS = 14
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

width = 1.3
height = 2
rad = 0.2
rt_txt = 1.2 * width
lf_txt = -0.8 * width


square = np.array(
    [
        [0, 0],
        [0, height],
        [width, height],
        [width, 0],
        [0, 0],
    ]
)

cup = np.array(
    [
        [0, height],
        [0, 0],
        [width, 0],
        [width, height],
    ]
)

cap = np.array(
    [
        [0, 0],
        [0, height],
        [width, height],
        [width, 0],
    ]
)

radians = np.linspace(-0.2, width + 0.2, 100)
squiggle = -0.1 * np.sin(2.0 * np.pi / width * radians)

plt.figure()
ax = plt.gca()

# square 1
plt.plot(square[:, 0], square[:, 1], "k")
ax.add_patch(Circle((0.5 * width, 0.5 * height), rad, facecolor="k"))
plt.text(rt_txt, 0, "$h_{1/2}$")
plt.text(rt_txt, height, "$h_{3/2}$")
plt.text(lf_txt, 0.5 * height, "$h_{1}$")

# square 2
plt.plot(square[:, 0], square[:, 1] + height, "k")
ax.add_patch(Circle((0.5 * width, 1.5 * height), rad, facecolor="k"))
plt.text(rt_txt, 2 * height, "$h_{5/2}$")
plt.text(lf_txt, 1.5 * height, "$h_2$")

# broken square
plt.plot(cup[:, 0], 0.5 * cup[:, 1] + 2 * height, "k")
plt.plot(radians, squiggle + 2.5 * height, "k")
plt.plot(radians, squiggle + 2.7 * height, "k")
plt.plot(cap[:, 0], 0.5 * cap[:, 1] + 2.7 * height, "k")

# square k
plt.plot(square[:, 0], square[:, 1] + 3.2 * height, "k")
ax.add_patch(Circle((0.5 * width, 3.7 * height), rad, facecolor="k"))
plt.text(rt_txt, 3.2 * height, "$h_{k-1/2}$")
plt.text(rt_txt, 4.2 * height, "$h_{k+1/2}$")
plt.text(lf_txt, 3.7 * height, "$h_{k}$")

# broken square
plt.plot(cup[:, 0], 0.5 * cup[:, 1] + 4.2 * height, "k")
plt.plot(radians, squiggle + 4.7 * height, "k")
plt.plot(radians, squiggle + 4.9 * height, "k")
plt.plot(cap[:, 0], 0.5 * cap[:, 1] + 4.9 * height, "k")

# top square
plt.plot(square[:, 0], square[:, 1] + 5.4 * height, "k")
ax.add_patch(Circle((0.5 * width, 5.9 * height), rad, facecolor="k"))
plt.text(rt_txt, 5.4 * height, "$h_{N_Z-1/2}$")
plt.text(rt_txt, 6.4 * height, "$h_{N_Z+1/2}$")
plt.text(lf_txt, 5.9 * height, "$h_{N_Z}$")

plt.axis("equal")
plt.axis("off")

plt.tight_layout()
plt.savefig("../figs/axial_model.pdf")
