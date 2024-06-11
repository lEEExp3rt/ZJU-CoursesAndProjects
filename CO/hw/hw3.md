# HW3

[TOC]

---

## 2.4

**Solution:**

```c
register int tmp1 = &A[f];
register int tmp2 = &B[g];
f = A[f];
register int tmp3 = &A[f + 2];
tmp1 = A[f + 2];
B[g] = tmp2 = A[f + 2] + A[f];
```

---

## 2.8

**Solution:**

```c
register int tmp1 = &A[1]; // x30
register int tmp2 = &A[0]; // x31
A[0] = A[1];
tmp1 = A[1]
f = A[1] + A[0] = 2 * A[1];
```

---

## 2.12

**Solution:**

Obviously it's `I-type` and the assembly language is 

```assembly
addi x1, x1, 1
```

---

## 2.14

**Solution:**

Binary machine code:

```
0010100_00101_00111_011_01010_0100001
```

RISC-V Assembly:

```assembly
sub x6, x7, x5
```

---

## 2.17

### 2.17.1

**Solution:**

`x7 = 0x0000000AAAAAAAA | 0x1234567812345678 = 0x12345678BABEFEFA`

### 2.17.2

**Solution:**

`x7 = 0x2345678123456780`

### 2.17.3

**Solution:**

`x7 = 0x545`

---

## 2.22

**Solution:**

### 2.22.1



---

## 2.24

### 2.24.1

**Solution:**

The loop will be executed 10 times and the final value of `x5` is 10

### 2.24.2

**Solution:**

```c
int acc = 0;
for (int i = 10; i != 0; i--)
    acc += 2;
```

### 2.24.3

**Solution:**

1. N > 0: executed N times
2. N = 0: executed 0 times
3. N < 0: infinite loop

### 2.24.4

**Solution:**

```c
int acc = 0;
for (int i = 10; i >= 0; i--)
    acc += 2;
```

---

## 2.29

**Solution:**

```assembly
fib: 
beq x10, x0, OUT ; If n==0, return 0 
addi x5, x0, 1 
beq x10, x5, OUT ; If n==1, return 1 
addi x2, x2, -16 ; Allocate stack space 
sd x1, 0(x2)
sd x10, 8(x2) 
addi x10, x10, -1 
jal x1, fib ; fib(n-1) 
ld x5, 8(x2)
sd x10, 8(x2) ; Push fib(n-1) onto the stack 
addi x10, x5, -2
jal x1, fib ; fib(n-2) 
ld x5, 8(x2) ; x5 = fib(n-1) 
add x10, x10, x5 ; x10 = fib(n-1)+fib(n-2) 
 
ld x1, 0(x2) 
addi x2, x2, 16
OUT: 
jalr x0, x1 
```

