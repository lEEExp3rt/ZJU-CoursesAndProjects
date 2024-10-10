#!/usr/bin/python3
import matplotlib.pyplot as plt

fig=plt.figure()
ax1=fig.add_subplot(111)

x1=[1.00,2.00,3.00,4.00,5.00]
y1=[-0.01,0.00,0.01,0.05,0.01]
ax1.plot(x1,y1,color='green',marker='+')
ax1.set(title="Table 2",ylabel="Delta_U/V",xlabel="U_Standard/V")

plt.tight_layout()
plt.savefig("/mnt/c/Users/lqy/Desktop/graph2.png")
plt.savefig("graph2.png")
