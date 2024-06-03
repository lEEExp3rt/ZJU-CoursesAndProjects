#!/usr/bin/python3
import matplotlib.pyplot as plt
import numpy as np

x=np.linspace(0,np.pi)
y1=np.sin(x)
y2=np.cos(x)
fig = plt.figure()
ax = fig.add_subplot(111)
# ax.set(xlim=[1.00,5.00], ylim=[1.00, 5.00], title='graph1',
#       ylabel='I change/mA', xlabel='I standard/mA')
#ax.plot(x,y,color='red',marker='+')
ax.fill_between(x,y1,y2)
plt.show()
