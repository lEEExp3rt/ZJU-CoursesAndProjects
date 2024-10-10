#!/usr/bin/python3

v10 = [5.05, 3.48, 5.91, 3.80, 4.29]
v20 = [16.65, 8.61, 15.45, 9.96, 15.68]
v11 = [16.79, 8.68, 15.11, 10.05, 15.83]
v21 = [7.34, 3.90, 8.04, 4.88, 6.60]
m1 = 179.0
m2 = 243.6
p1=[]
p2=[]
e1=[]
e2=[]

print("P1")
for i in range(5):
    tmp = m1 * v10[i] + m2 * v20[i]
    print(tmp)
    p1.append(tmp)
print("P2")
for i in range(5):
    tmp = m1 * v11[i] + m2 * v21[i]
    print(tmp)
    p2.append(tmp)
print("E1")
for i in range(5):
    tmp = 0.5 * m1 * v10[i]**2 + 0.5 * m2 * v20[i]**2
    print(tmp)
    e1.append(tmp)
print("E2")
for i in range(5):
    tmp = 0.5 * m1 * v11[i]**2 + 0.5 * m2 * v21[i]**2
    print(tmp)
    e2.append(tmp)
print("△p")
for i in range(5):
    print(p2[i] - p1[i])
print("△E")
for i in range(5):
    print(e2[i] - e1[i])

