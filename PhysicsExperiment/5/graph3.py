#!/usr/bin/python3
import matplotlib.pyplot as plt

fig=plt.figure()
ax1=fig.add_subplot(111)

x1=[0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
y1=[2492.0,1149.0,669.3,435.8,295.2,193.1,119.7,67.2,19.9,0.0]
ax1.plot(x1,y1,color='blue',marker='+')
ax1.set(title="Table 3",ylabel="R/Ω",xlabel="I/mA")

plt.tight_layout()
plt.savefig("/mnt/c/Users/lqy/Desktop/graph3.png")
plt.savefig("graph3.png")
