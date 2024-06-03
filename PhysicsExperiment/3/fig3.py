#!/usr/bin/python3
import matplotlib.pyplot as plt
import numpy as np

fig=plt.figure()

y=np.arange(-5.0,5.5,0.5)
b=[171,184,187,185,188,190,190,191,191,190,194,194,194,194,194,195,195,192,191,191,190]

plt.scatter(y,b)
plt.plot(y,b)
#plt.set(xlabel="X(cm)",ylabel="B(10^-6 T)",title="Table 1") 

plt.savefig('/mnt/c/Users/lqy/Desktop/table3.png')
plt.savefig('table3.png')
