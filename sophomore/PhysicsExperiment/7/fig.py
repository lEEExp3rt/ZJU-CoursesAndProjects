#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt

t=[15.1,20.0,25.1,29.9,35.4,40.0,45.2,49.8,54.9,60.2]
r=[0.0045079,0.0046041,0.0047051,0.0048039,0.0049042,0.0050035,0.0051030,0.0052009,0.0053005,0.0053098]
coefficient=np.polyfit(t,r,1)
f=np.poly1d(coefficient,r=False)
equivlent="f(x) = {} x + {}".format(coefficient[0],coefficient[1])
rr=f(t)
print(coefficient[0]/coefficient[1])
fig=plt.figure()
ax=fig.add_subplot(111)
ax.scatter(t,r,marker='+',color='green')
ax.plot(t,rr,color='red',label=equivlent)
ax.set(title="R-t Table",xlabel="t(deg C)",ylabel="R(Ω)")
ax.legend()
fig.tight_layout()
#plt.savefig("R-t.png")
#plt.savefig("/mnt/c/Users/lqy/Desktop/R-t.png")
