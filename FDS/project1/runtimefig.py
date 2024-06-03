#!/usr/bin/python3

import matplotlib.pyplot as plt # 导入库

plt.figure() # 生成图片

# 数据集
xs = [1000,5000,10000,20000,40000,60000,80000,100000]
y1s = [2647e-10,13119e-10,27425e-10,52261e-10,105481e-10,137853e-10,187153e-10,229290e-10]
y2rs = [60e-10,76e-10,81e-10,87e-10,93e-10,95e-10,99e-10,99e-10]
y2is = [21.48e-10,26.92e-10,28.98e-10,31.09e-10,34.52e-10,34.04e-10,35.22e-10,35.46e-10]

# 子图1：将3个函数全部绘图
fig1=plt.subplot(211)
fig1.scatter(xs,y1s) # 散点图
fig1.scatter(xs,y2rs)
fig1.scatter(xs,y2is)
fig1.plot(xs,y1s,color='g',label='power1') # 折线图
fig1.plot(xs,y2rs,color='b',label='rpower2')
fig1.plot(xs,y2is,color='r',label='ipower2')
fig1.set(xlabel="N",ylabel="RunTime",title="N_Runtime Plot") # 设置坐标轴和图表标题名称
fig1.legend() # 显示图例

# 子图2：对算法2的函数进行绘图
fig2=plt.subplot(212)
fig2.scatter(xs,y2rs)
fig2.scatter(xs,y2is)
fig2.plot(xs,y2rs,color='b',label='rpower2')
fig2.plot(xs,y2is,color='r',label='ipower2')
fig2.set(xlabel="N",ylabel="RunTime",title="N_Runtime Plot")
fig2.legend()

plt.tight_layout() # 修改排版
plt.savefig('runtime.png') # 保存图片
