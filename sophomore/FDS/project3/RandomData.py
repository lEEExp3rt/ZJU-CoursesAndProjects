#!/usr/bin/python3
import random
v, e = input().split()
v = int(v)
e = int(e)
vlist = [i for i in range(1, v + 1)]
for j in range(e):
    v1 = random.randint(1, v + 1)
    v2 = random.randint(1, v + 1)
    weight = random.randint(1, 101)
    print("{} {} {}".format(v1, v2, weight))
k = int(input())
for _ in range(k):
    li = [s for s in range(1, v + 1)]
    random.shuffle(li)
    print(" ".join(str(item) for item in li))
