#!/usr/bin/python3
import matplotlib.pyplot as plt

fig=plt.figure()
ax=fig.add_subplot(111)

t=[24.3,28.3,32.3,36.3,40.3,44.3,52.3,56.3,60.3,64.3]
u=[34.4,39.2,44.6,49.4,53.7,58.9,67.4,72.5,78.6,81.3]

tt=[1/x for x in t]
uu=[1/y for y in u] 

ax.set(title="Table 1",xlabel="1/t (1/deg C)",ylabel="1/U (1/mV)")
ax.plot(tt,uu,color='red',marker='+')
plt.savefig("/mnt/c/Users/lqy/Desktop/Table1.png")
plt.savefig("Table1.png")

tmp=[]
for x in range(10):
    tmp.append(4*u[x]/(t[x]*(1.3-2*u[x]*0.001)))
print(sum(tmp)/len(tmp))
