#!/usr/bin/python3
# -*- coding: utf-8 -*-
'''
@file: plot.py
@brief: Plot the data
@author: lqy
Created on 2024/06/16
'''

import matplotlib.pyplot as plt
import numpy as np
import csv
import sys

def read_data(filename):
    size = []
    insertion = []
    search = []
    deletion = []
    with open(filename, 'r') as f:
        reader = csv.reader(f)
        first_row = False
        for row in reader:
            if not first_row:
                first_row = True
                continue
            size.append(int(row[0]) / 100000)
            insertion.append(int(row[1]))
            search.append(int(row[2]))
            deletion.append(int(row[3]))
    return size, insertion, search, deletion

def plot_data(x, y, title, xlabel, ylabel, save_fig):
    plt.scatter(x, y)
    plt.title(title)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(save_fig)
    plt.close()
    # plt.show()

if __name__ == '__main__':
    filename = str(sys.argv[1])
    out1 = str(sys.argv[2])
    out2 = (sys.argv[3])
    out3 = (sys.argv[4])
    size, insertion, search, deletion = read_data(filename)
    plot_data(size, insertion, 'Insertion Time', 'Size (10^5)', 'Time (ms)', out1)
    plot_data(size, search, 'Search Time', 'Size (10^5)', 'Time (ms)', out2)
    plot_data(size, deletion, 'Deletion Time', 'Size (10^5)', 'Time (ms)', out3)