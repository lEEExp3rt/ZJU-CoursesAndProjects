#!/usr/bin/python3
import matplotlib as mlp
import matplotlib.pyplot as plt
import numpy as np

x = [0.5, 6.5, 12.3, 18.2, 24.4, 30.8, 37.3, 43.9, 50.5, 57.5, 64.8]
y = [34.0, 39.0, 42.5, 44.1, 44.4, 42.8, 39.0, 33.3, 25.8, 16.0, 4.0]
t = [i for i in range(11)]
t2 = [i + 0.5 for i in range(10)]
fig = plt.figure()

### x-t ###
coefficient = np.polyfit(t, x, 1)
f = np.poly1d(coefficient, r = False)
equivlent = "x = {:.2f}t + {:.2f}".format(coefficient[0], coefficient[1])
rr = f(t)
x_t = fig.add_subplot(221)
x_t.set(title = 'x-t Table', xlabel = 't(T)', ylabel = 'x(cm)')
x_t.scatter(t,x,color = 'red', marker = 's')
x_t.plot(t,rr, color = 'green', label = equivlent)
x_t.legend()

### y-t ###
coefficient = np.polyfit(t, y, 2)
f = np.poly1d(coefficient, r = False)
equivlent = "y = {:.2f}t^2 + {:.2f}t + {:.2f}".format(coefficient[0], coefficient[1], coefficient[2])
rr = f(t)
y_t = fig.add_subplot(222)
y_t.set(title = "y-t Table", xlabel = 't(T)', ylabel = 'y(cm)')
y_t.scatter(t, y, color = 'red', marker = 's')
y_t.plot(t, rr, color = 'green', label = equivlent)
y_t.legend()

### Vx-t ###
Vx = [(x[i + 1] - x[i]) for i in range(10)]
print("Vx")
for i in range(10):
    print("Vx[{}.5] = {:.2f}".format(i, Vx[i]))
coefficient = np.polyfit(t2, Vx, 1)
f = np.poly1d(coefficient, r = False)
equivlent = "Vx = {:.2f}t + {:.2f}".format(coefficient[0], coefficient[1])
rr = f(t2)
Vx_t = fig.add_subplot(223)
Vx_t.set(title = "Vx-t Table", xlabel = 't(T)', ylabel = 'Vx(cm/T)')
Vx_t.scatter(t2, Vx, color = 'red', marker = 's')
Vx_t.plot(t2, rr, color = 'green', label = equivlent)
Vx_t.legend()

### Vy-t ###
a = []
Vy = [(y[i + 1] - y[i]) for i in range(10)]
print("Vy:")
for i in range(10):
    print("Vy[{}.5] = {:.2f}".format(i, Vy[i]))
    if (i < 9):
        a.append(Vy[i+1] - Vy[i])
coefficient = np.polyfit(t2, Vy, 1)
f = np.poly1d(coefficient, r = False)
equivlent = "Vy = {:.2f}t + {:.2f}".format(coefficient[0], coefficient[1])
rr = f(t2)
Vy_t = fig.add_subplot(224)
Vy_t.set(title = "Vy-t Table", xlabel = 't(T)', ylabel = 'Vy(cm/T)')
Vy_t.scatter(t2, Vy, color = 'red', marker = 's')
Vy_t.plot(t2, rr, color = 'green', label = equivlent)
Vy_t.legend()

### a-t ###
print("a")
for i in range(9):
    print("a{} = {:.2f}".format(i + 1, a[i]))
print("a average = {:.2f}".format(sum(a) / 9))

fig.tight_layout()
#plt.show()
plt.savefig("graph.png")
plt.savefig("/mnt/c/Users/lqy/Desktop/graph.png")
