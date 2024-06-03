#!/usr/bin/python3
import matplotlib as mlt
import matplotlib.pyplot as plt

l = [300, 325, 350, 375, 400]
#l2 = [x**2 for x in l]
i = [31.7, 25.2, 20.9, 18.06, 14.38]

fig = plt.figure()
ax1 = fig.add_subplot(111)
#ax2 = fig.add_subplot(111)
ax1.set(title = 'Graph4', xlabel = "$L(mm)$", ylabel = '$I(×10^{-10}A)$')
#ax2.set(title = 'Graph4-2', xlabel = "$L(mm)$", ylabel = '$I(×10^{-10}A)$')
ax1.scatter(l, i, color = 'red', marker = 's')
ax1.plot(l, i, color = 'green', label = "linear")
#ax2.plot(l2, i, color = 'blue', label = 'square')

ax1.legend()
#ax2.legend()
fig.tight_layout()
#plt.show()
plt.savefig("Graph4.png")
plt.savefig("/mnt/c/Users/lqy/Desktop/14/Graph4.png")
