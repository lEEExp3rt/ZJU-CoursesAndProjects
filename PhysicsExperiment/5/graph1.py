#!/usr/bin/python3
import matplotlib.pyplot as plt

fig=plt.figure()
ax1=fig.add_subplot(111)
#ax2=fig.add_subplot(312)
#ax3=fig.add_subplot(313)

x1=[1.00,2.00,3.00,4.00,5.00]
y1=[-0.05,-0.01,-0.10,0.00,-0.07]
ax1.plot(x1,y1,color='red',marker='+')
ax1.set(title="Table 1",ylabel="Delta_I/mA",xlabel="I_Standard/mA")

plt.tight_layout()
plt.savefig("/mnt/c/Users/lqy/Desktop/graph1.png")
plt.savefig("graph1.png")
