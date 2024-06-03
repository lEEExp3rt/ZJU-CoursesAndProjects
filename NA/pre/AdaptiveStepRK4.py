#!/usr/bin/python3

import math

# Function: Adaptive Step RK4
def RK4Step(f, a, b, y0, h0, t0, e):
    t, h, w = t0, h0, y0

    result_list = [(t, w)]
    while (t < b):
        if (t + h > b):
            h *= 0.5
            continue
        y1 = RK4Step(f, a, b, w, h, t, e)
        y2 = RK4Step(f, a, b, y1, h, t + h, e)

        if (t + 2 * h < b):
            new_t = t + 2 * h
        else:
            new_t = b
        y2 = RK4Step(f, a, b, y2, h, new_t, e)

        e1 = (y2 - y1) / 15
        e2 = 16 * (y2 - y1) / 15
        if (e1 < e and e2 > e):
            t = t + h
            w = y1
            result_list.append((t, w))
        elif (e1 > e):
            h *= 0.5
        elif (e2 < e and t + 2 * h >= b):
            break
        elif (e2 < e):
            h *= 2
    return result_list

# Function: f(x) = e^(x)
def f(x):
    return math.exp(x)

interval_lower = 1
interval_upper = 4
e0 = math.e
print(RK4Step(f, interval_lower, interval_upper, 1, 1, 1, 0.1))
