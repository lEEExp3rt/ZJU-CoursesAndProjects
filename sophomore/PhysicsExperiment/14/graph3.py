#!/usr/bin/python3
import matplotlib as mlt
import matplotlib.pyplot as plt

phi = [2, 4, 8]
i = [14.58, 53.60, 187.2]

fig = plt.figure()
ax = fig.add_subplot(111)
ax.set(title = 'Graph3', xlabel = "$φ(mm)$", ylabel = '$I(×10^{-10}A)$')
ax.scatter(phi, i, color = 'red', marker = 's')
ax.plot(phi, i, color = 'green')

fig.tight_layout()
#plt.show()
plt.savefig("Graph3.png")
plt.savefig("/mnt/c/Users/lqy/Desktop/Graph3.png")
