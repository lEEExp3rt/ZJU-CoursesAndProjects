#!/usr/bin/python3
import matplotlib.pyplot as plt
import numpy as np

fig=plt.figure()

x1=np.arange(-5.0,5.5,0.5)
b1=[77,83,87,90,94,99,100,105,107,110,108,108,110,111,108,103,100,97,95,90,87]

plt.scatter(x1,b1)
plt.plot(x1,b1)
#plt.set(xlabel="X(cm)",ylabel="B(10^-6 T)",title="Table 1") 

plt.savefig('table1.png')
