#!/usr/bin/python3
import numpy as np
import matplotlib as mlt
import matplotlib.pyplot as plt

fig = plt.figure()
c = 2997.92458
e = 1.602176565
h0 = 6.62606957
l = [365, 405, 436, 546, 577]
u = [-1.839, -1.523, -1.301, -0.758, -0.638]
v = [c / x for x in l]

coefficient_fit = np.polyfit(v, u, 1)
f_fit = np.poly1d(coefficient_fit, r = False)
data_fit = f_fit(v)
data_label = "U = {:.5f}v + {:.5f}".format(coefficient_fit[0], coefficient_fit[1])

ax = fig.add_subplot(111)
ax.set(title = "Graph1", xlabel = "$v_i(×10^{14}Hz)$", ylabel = "$U_i(V)$")
ax.scatter(v, u, color = 'red', marker = 's')
ax.plot(v, data_fit, color = 'green', label = data_label)

ax.legend()
fig.tight_layout()
plt.show()
#plt.savefig("Graph1.png")
#plt.savefig("/mnt/c/Users/lqy/Desktop/Graph1.png")
print("|k| = {}".format(-coefficient_fit[0]))
h = -10 * coefficient_fit[0] * e
print("h = {}e-34".format(h))
print("E = {} %".format(100 * abs(h - h0) / h0))
