#!/usr/bin/python3
import matplotlib.pyplot as plt

fig=plt.figure()

x=[5.0,6.0,7.0,8.0,9.0,10.0,12.5,15.0,17.5,20.0,21.0,22.0,23.0,24.0,25.0]
b=[100,114,122,133,142,147,156,159,162,159,153,146,136,125,116]

plt.scatter(x,b)
plt.plot(x,b)
#plt.set(xlabel="X(cm)",ylabel="B(10^-6 T)",title="Table 1") 

plt.savefig('table2.png')
