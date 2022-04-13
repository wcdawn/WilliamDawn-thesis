import numpy as np
import matplotlib.pyplot as plt
import matplotlib

LW = 2
FN = "Times New Roman"
FS = 16
plt.rc("lines", lw=LW)
plt.rc("mathtext", fontset="stix")
plt.rc("font", family=FN, size=FS)

# plot wedge --> chunk --> hex
f2f = 1

width = 0.25
height = 1.0

nHex = 3

plt.figure()
ax = plt.gca()

for i in range(nHex):
    idx = i + 1
    rect = matplotlib.patches.Rectangle(
        [0.0, (idx - 1) * height], width, height, fill=False, lw=LW
    )
    ax.add_patch(rect)
    # right
    plt.plot(
        [width * (1 + np.cos(np.pi / 6.0)), width * (1 + np.cos(np.pi / 6.0))],
        [
            (idx - 1) * height + width * np.sin(np.pi / 6.0),
            height * idx + width * np.sin(np.pi / 6.0),
        ],
        "-k",
    )
    # left
    plt.plot(
        [-width * np.cos(np.pi / 6.0), -width * np.cos(np.pi / 6.0)],
        [
            (idx - 1) * height + width * np.sin(np.pi / 6.0),
            height * idx + width * np.sin(np.pi / 6.0),
        ],
        "-k",
    )
    # bottom right
    plt.plot(
        [width, width * (1 + np.cos(np.pi / 6.0))],
        [(idx - 1) * height, (idx - 1) * height + width * np.sin(np.pi / 6.0)],
        "-k",
    )
    # bottom left
    plt.plot(
        [0.0, -width * np.cos(np.pi / 6.0)],
        [(idx - 1) * height, (idx - 1) * height + width * np.sin(np.pi / 6.0)],
        "-k",
    )
    # top right
    plt.plot(
        [width, width * (1 + np.cos(np.pi / 6.0))],
        [idx * height, idx * height + width * np.sin(np.pi / 6.0)],
        "-k",
    )
    # top left
    plt.plot(
        [0.0, -width * np.cos(np.pi / 6.0)],
        [idx * height, idx * height + width * np.sin(np.pi / 6.0)],
        "-k",
    )

# add topper
plt.plot(
    [-width * np.cos(np.pi / 6.0), 0.0],
    [
        nHex * height + width * np.sin(np.pi / 6.0),
        nHex * height + 2 * width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    [0.0, width],
    [
        nHex * height + 2 * width * np.sin(np.pi / 6.0),
        nHex * height + 2 * width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    [width, width * (1 + np.cos(np.pi / 6.0))],
    [
        nHex * height + 2 * width * np.sin(np.pi / 6.0),
        nHex * height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    [width * (1 + np.cos(np.pi / 6.0)), -width * np.cos(np.pi / 6.0)],
    [
        nHex * height + width * np.sin(np.pi / 6.0),
        nHex * height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)

# asterisk
plt.plot(
    [width * (1 + np.cos(np.pi / 6.0)), -width * np.cos(np.pi / 6.0)],
    [
        nHex * height + width * np.sin(np.pi / 6.0),
        nHex * height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    [0.0, width],
    [
        nHex * height,
        nHex * height + 2.0 * width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    [width, 0.0],
    [
        nHex * height,
        nHex * height + 2.0 * width * np.sin(np.pi / 6.0),
    ],
    "-k",
)

offset = 2.0

rect = matplotlib.patches.Rectangle([-offset, 0.0], width, height, fill=False, lw=LW)
ax.add_patch(rect)
# right
plt.plot(
    np.array([width * (1 + np.cos(np.pi / 6.0)), width * (1 + np.cos(np.pi / 6.0))])
    - offset,
    [
        width * np.sin(np.pi / 6.0),
        height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
# left
plt.plot(
    np.array([-width * np.cos(np.pi / 6.0), -width * np.cos(np.pi / 6.0)]) - offset,
    [
        width * np.sin(np.pi / 6.0),
        height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
# bottom right
plt.plot(
    np.array([width, width * (1 + np.cos(np.pi / 6.0))]) - offset,
    [0.0, width * np.sin(np.pi / 6.0)],
    "-k",
)
# bottom left
plt.plot(
    np.array([0.0, -width * np.cos(np.pi / 6.0)]) - offset,
    [0.0, width * np.sin(np.pi / 6.0)],
    "-k",
)
# top right
plt.plot(
    np.array([width, width * (1 + np.cos(np.pi / 6.0))]) - offset,
    [height, height + width * np.sin(np.pi / 6.0)],
    "-k",
)
# top left
plt.plot(
    np.array([0.0, -width * np.cos(np.pi / 6.0)]) - offset,
    [height, height + width * np.sin(np.pi / 6.0)],
    "-k",
)

# add topper
plt.plot(
    np.array([-width * np.cos(np.pi / 6.0), 0.0]) - offset,
    [
        height + width * np.sin(np.pi / 6.0),
        height + 2 * width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    np.array([0.0, width]) - offset,
    [
        height + 2 * width * np.sin(np.pi / 6.0),
        height + 2 * width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    np.array([width, width * (1 + np.cos(np.pi / 6.0))]) - offset,
    [
        height + 2 * width * np.sin(np.pi / 6.0),
        height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    np.array([width * (1 + np.cos(np.pi / 6.0)), -width * np.cos(np.pi / 6.0)])
    - offset,
    [
        height + width * np.sin(np.pi / 6.0),
        height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)

# asterisk
plt.plot(
    np.array([width * (1 + np.cos(np.pi / 6.0)), -width * np.cos(np.pi / 6.0)])
    - offset,
    [
        height + width * np.sin(np.pi / 6.0),
        height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    np.array([0.0, width]) - offset,
    [
        height,
        height + 2.0 * width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    np.array([width, 0.0]) - offset,
    [
        height,
        height + 2.0 * width * np.sin(np.pi / 6.0),
    ],
    "-k",
)

rect = matplotlib.patches.Rectangle(
    [-2 * offset, 0.0], width, height, fill=False, lw=LW
)
ax.add_patch(rect)
plt.plot(
    np.array([0.0, 0.5 * width]) - 2 * offset,
    [
        height,
        height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)
plt.plot(
    np.array([width, width*0.5]) - 2 * offset,
    [
        height,
        height + width * np.sin(np.pi / 6.0),
    ],
    "-k",
)

plt.arrow(-0.7 * offset, 0.5 * height, 0.25 * offset, 0.0, width=0.1)
plt.arrow(-1.7 * offset, 0.5 * height, 0.25 * offset, 0.0, width=0.1)
plt.arrow(4 * width, 0.0, 0.0, height, width=0.05, fc="k")
plt.text(4 * width, -0.25, "$z$")

ax.axis("equal")
plt.axis("off")

# plt.xlim([-0.5 * width, width])
plt.ylim([-height, nHex + 1 * height])

plt.tight_layout()
plt.savefig("../figs/chunk_description.pdf")
