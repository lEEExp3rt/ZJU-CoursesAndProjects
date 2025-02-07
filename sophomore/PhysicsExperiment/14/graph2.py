#!/usr/bin/python3
import matplotlib as mlt
import matplotlib.pyplot as plt

fig = plt.figure()
ax = fig.add_subplot(111)
ax.set(title = "Graph2", xlabel = "$U_i(V)$", ylabel = "$I_i(×10^{-10}A)$")

u1 = [-0.88, 0.44, 1.31, 2.50, 3.36, 4.61, 5.80, 7.72, 9.32, 11.02, 12.87, 14.66, 16.60, 17.92, 19.55, 21.19, 23.08, 24.82, 27.22, 29.69]
i1 = [0.14, 0.72, 1.28, 2.31, 3.05, 3.47, 3.71, 4.32, 4.94, 5.57, 6.17, 6.63, 7.26, 7.66, 8.08, 8.64, 9.02, 9.35, 9.81, 10.32]
u2 = [-0.55, -0.31, 0.35, 1.14, 2.03, 3.71, 5.70, 7.08, 8.78, 10.17, 11.48, 12.70, 14.12, 16.29, 17.92, 19.94, 21.79, 23.83, 26.65, 28.23]
i2 = [0.05, 0.23, 0.86, 1.78, 2.70, 3.48, 4.30, 5.00, 5.80, 6.22, 6.71, 7.06, 7.49, 7.96, 8.30, 8.80, 8.93, 9.52, 9.87, 10.13]

ax.scatter(u1, i1, color = 'red', marker = 's')
ax.plot(u1, i1, color = 'green', label = "$λ = 405 nm$")
ax.scatter(u2, i2, color = 'purple', marker = '+')
ax.plot(u2, i2, color = 'blue', label = "$λ = 546 nm$")

ax.legend()
fig.tight_layout()
plt.show()
#plt.savefig("Graph2.png")
#plt.savefig("/mnt/c/Users/lqy/Desktop/Graph2.png")
