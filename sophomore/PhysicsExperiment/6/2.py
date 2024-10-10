#!/usr/bin/python3

import matplotlib.pyplot as plt
import numpy as np

t=[26.3,30.3,34.3,38.3,42.3,46.3,54.3,58.3,62.3,66.3]
r=[56.10,57.00,57.90,58.80,59.70,60.60,62.20,63.00,64.00,64.73]

coefficient=np.polyfit(t,r,1)
f=np.poly1d(coefficient,r=False)
equivlent="f(x) = {} x + {}".format(coefficient[0],coefficient[1])
rr=f(t)
print(coefficient)
fig=plt.figure()
ax=fig.add_subplot(111)
ax.scatter(t,r,marker='+',color='green')
ax.plot(t,rr,color='red',label=equivlent)
ax.set(title="Table 2",xlabel="t(deg C)",ylabel="R(Ω)")
ax.legend()
fig.tight_layout()
plt.savefig("Table2.png")
plt.savefig("/mnt/c/Users/lqy/Desktop/Table2.png")
