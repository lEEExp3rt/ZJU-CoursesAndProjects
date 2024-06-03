# Hw1

[toc]

## 1.2

The exercise 1.2 from E-book is missing :cry:

## 1.5

### a.

**Solution:** Consider instructions count per second.

For P1: $P1=3G\div 1.5=2G$

For P2: $P2=2.5G\div 1.0=2.5G$

For P3: $P3=4.0G\div2.2=1.82G$

$\therefore$ P2 has the highest performance.

### b.

**solution:**

The number of cycles of $P1=10\times 3G=30G$

The number of instructions of $P1=2G\times10=20G$

The number of cycles of $P2=10\times2.5G=25G$

The number of instructions of $P2=2.5G\times10=25G$

The number of cycles of $P3=10\times4.0G=40G$

The number of instructions of $P3=1.82G\times10=18.2G$

### c.

**solution:**

Knowing that $Excution\,Time=\dfrac{Instructions.count\times CPI}{Clock\,Rate}$

$\therefore$ Clock rate for $P1=\frac{20G\times1.5\times120\%}{10\times70\%}=5.1429GHz$

Clock rate for $P2=\frac{25G\times1.0\times120\%}{10\times70\%}=4.2857GHz$

Clock rate for $P3=\frac{18.2G\times2.2\times120\%}{10\times70\%}=6.8640GHz$

## 1.6

### a.

**solution:**

$P1=\frac{1\times10\%+2\times20\%+3\times70\%}{100\%}=2.6$

$P2=\frac{2\times100\%}{100\%}=2$

### b.

**solution:**

$P1=10^6\times CPI(P1)=2.6\times10^6$

$P2=10^6\times CPI(P2)=2.0\times10^6$

## 1.7

### a.

**solution:**

Considering that $CPI=\dfrac{Excution\,Time}{Instructions.count\times Clock\,Cycle\,Time}$,

So $CPI(P1)=\dfrac{1.1s}{10^9\times1ns}=1.1$

$CPI(P2)=\dfrac{1.5s}{1.2\times10^9\times1ns}=1.25$

### b.

**solution:**

$\dfrac{T_A}{T_B}=\dfrac{B_{Instructions}\times CPI(B)}{A_{Instructions}\times CPI(A)}=\dfrac{1.2\times1.25}{1.0\times1.1}=1.364$

### c.

Excution time for new compiler: $t=6\times10^8\times1.1\times1ns=0.66s$

$\therefore$ Speed up versus A: $\dfrac{t_A}{t}=\dfrac{1.1}{0.66}=1.67$

Speed up versus B: $\dfrac{t_B}{t}=\dfrac{1.5}{0.66}=2.27$

## 1.13

### 1.13.1

**solution:**

Total time is reduced by $70s\times20\%=14s$

Reduction: $\dfrac{14s}{250s}=0.056=5.6\%$

### 1.13.2

**solution:**

total time = $250s\times80\%=200s$

For INT operations: $T_{origin}=250s-70s-85s-40s=55s$

$\therefore T_{new}=200s-195s=5s$

$\therefore$ Reduction=$1-\dfrac{5s}{55s}=90.9\%$

### 1.13.3

**solution:**

Reduced time = $250s-250s\times80\%=50s$

However, the original branch time is only 40s

$\therefore$ cannot.