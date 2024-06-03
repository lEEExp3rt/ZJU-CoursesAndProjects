#!/usr/bin/python3

v10 = [4.00, 4.30, 3.67, 4.25, 2.60]
v20 = [7.43, 10.65, 8.04, 7.71, 7.77]
v11 = [5.65, 7.66, 5.84, 5.99, 5.21]
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
    tmp = (m1 + m2) * v11[i]
    print(tmp)
    p2.append(tmp)
print("E1")
for i in range(5):
    tmp = 0.5 * m1 * v10[i]**2 + 0.5 * m2 * v20[i]**2
    print(tmp)
    e1.append(tmp)
print("E2")
for i in range(5):
    tmp = 0.5 * (m1 + m2) * v11[i]**2
    print(tmp)
    e2.append(tmp)
print("△p")
for i in range(5):
    print(p2[i] - p1[i])
print("△E")
for i in range(5):
    print(e2[i] - e1[i])

