#!/usr/bin/python3
import numpy as np
import matplotlib.pyplot as plt
from scipy.interpolate import Rbf

f = lambda x: np.sin(np.pi*x/2)+np.cos(np.pi*x/3)
snum = 20   # control point数量
ratio = 20  # 总数据点数量：snum*ratio
xs = -8
xe = 8
x1 = np.linspace(xs,xe,snum)				# control points
x2 = np.linspace(xs,xe,(snum-1)*ratio+1)	# 作图总数据点
y1 = f(x1)			# control points
rf = Rbf(x1, y1)	# reconstructed Rbf function
y2 = rf(x2)  		# Rbf reconstruction
plt.plot(x2, y2, 'k-', x2, f(x2),'r-', x1, y1, 'go', markerfacecolor='none')
plt.legend(["Radial basis functions", "Orignal", "control point"],loc='best')
plt.show()
