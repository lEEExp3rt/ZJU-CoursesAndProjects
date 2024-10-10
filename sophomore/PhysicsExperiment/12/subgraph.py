#!/usr/bin/python3
import matplotlib as mlp
import matplotlib.pyplot as plt
import numpy as np

a = [-1.5, -1.9, -1.3, -1.9, -2.2, -1.9, -1.8, -2.3, -2.2]
t = [i for i in range(1, 10)]
fig = plt.figure()

### x-t ###
coefficient = np.polyfit(t, a, 1)
f = np.poly1d(coefficient, r = False)
equivlent = "a = {:.2f}t + {:.2f}".format(coefficient[0], coefficient[1])
rr = f(t)
a_t = fig.add_subplot(111)
a_t.set(title = 'a-t Table', xlabel = 't(T)', ylabel = 'a(cm/T^2)')
a_t.scatter(t,a,color = 'red', marker = 's')
a_t.plot(t,rr, color = 'green', label = equivlent)
a_t.legend()

fig.tight_layout()
#plt.show()
plt.savefig("subgraph.png")
plt.savefig("/mnt/c/Users/lqy/Desktop/subgraph.png")
