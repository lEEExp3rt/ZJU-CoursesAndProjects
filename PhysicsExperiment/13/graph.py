#!/usr/bin/python3
import matplotlib as mlt
import matplotlib.pyplot as plt
import numpy as np

fig = plt.figure()
t = [0, 0.14, 0.26, 0.36, 0.58, 0.70, 0.82]
x = [i / 100 for i in range(0, 56, 8)] 
ax = fig.add_subplot(111)
ax.set(title = 't-x Table', xlabel = '△t(10^-6s)', ylabel = 'x(m)')
ax.scatter(t, x, marker = 's', color = 'red')
coefficient = np.polyfit(t, x, 1)
equivlent = "x = {:.2f}t + {:.2f}".format(coefficient[0], coefficient[1])
f = np.poly1d(coefficient, r = False)
rr = f(t)
ax.plot(t, rr, color = 'green', label = equivlent)
plt.legend()
plt.tight_layout()
plt.show()
#plt.savefig("graph.png")
#plt.savefig("/mnt/c/Users/lqy/Desktop/graph.png")
