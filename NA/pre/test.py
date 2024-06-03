import math
import numpy as np
def f(t,y):
    return y

def RK4Step(t,w,h):
    k1 = f(t,w)
    k2 = f(t+h/2,w+h/2*k1)
    k3 = f(t+h/2,w+h/2*k2)
    k4 = f(t+h,w+h*k3)
    return w + h/6*(k1+2*k2+2*k3+k4)


def AdaptiveStepRK4( a, b, y0, h0, e):
    t, h, w= a, h0, y0
    last_both_big = 0
    result_list = [(t, w)]

    while t < b - 0.000001:
        if t + h > b:
            h = 0.5 * h
            continue
        _y1 = RK4Step(t, w, h)
        dh = 2*h
        if t + dh> b:
            dh = b - t
        y1 = RK4Step(t + h, _y1, dh - h)

        dh = 2*h
        if t + dh> b:
            dh = b - t
        y2 = RK4Step(t, w, dh)

        e1 = (y2 - y1) / 15
        e2 = 16 * (y2 - y1) / 15
        #print("t = ",t, " w = ",w, "t1 = ",t+h," t2 = ", t + dh, " w1 = ", _y1, " w2 = ", y1, "w3 = ",y2, "e1 = ", e1, "e2 = ", e2)
        if abs(e1) < e and abs(e2) > e:
            t = t + h
            w = _y1
            last_both_big = 0
            result_list.append((t, w))
            
        elif abs(e1) > e:
            last_both_big = 1
            h = 0.5 * h
        elif abs(e2) < e:
            if abs(t + dh - b) < 0.0001 or last_both_big == 1:
                t = t + dh
                w = y1
                last_both_big = 0
                result_list.append((t,w))
            else:
                h = h *2


    return result_list

a = 0
b = 4

y0 = 1
h0 = 1
e = 0.00001
def af(t):
    return math.log(math.exp(t) + math.e - 1 )
#Res = AdaptiveStepRK4(a,b,y0,h0,e)
#x = np.arange(0, 4.125, 0.125)
#Res = [RK4Step(0,1,0.125)
t = a
w = y0
Res = [(t, w)]
while t < b:
    w = RK4Step(t,w,0.0625)
    t = t + 0.0625
    Res.append((t,w))
for (a,b) in Res:
    print(f"    {a},")
for (a,b) in Res:
    print(f"    {b},")

# print(af(20))
# , af: {af(a)}
