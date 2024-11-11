# HW1

[toc]

**Problems in this exercise refer to the following sequence of instructions, and assume that it is executed on a five -stage pipelined datapath:**

```assembly
add x15, x12, x11
ld  x13, 4(x15)
ld  x12, 0(x2)
or  x13, x15, x13
sd  x13, 0(x15)
```

##  1

**If there is no forwarding or hazard detection, insert NOPs to ensure correct execution.**

```assembly
add x15, x12, x11
NOP
NOP
ld x13, 4(x15)
ld x12, 0(x2)
NOP
or x13, x15, x13
NOP
NOP
sd x13, 0(x15)
```

## 2

**If the processor has forwarding, but we forgot to implement the hazard detection unit, what happens when the code executes?**

The instruction `or x13, x15, x13` will be wrong because the register `x13` is not correctly loaded from memory, so its value may be undefined.

## 3

**If there is forwarding, for the first seven cycles during the execution of this code, specify which signals are asserted in each cycle and show a pipeline execution diagram.**

```txt
Cycle:    1    2    3    4    5    6    7
----------------------------------------------
I1:      IF   ID   EX   MEM  WB
I2:           IF   ID   EX   MEM  WB
I3:                IF   ID   EX   MEM  WB
I4:                     IF   ID   EX   MEM  WB
I5:                          IF   ID   EX   MEM  WB
----------------------------------------------
```

Signals:

- Cycle 1: None
- Cycle 2: None
- Cycle 3:
	- `RegWrite=1`
- Cycle 4:
	- `RegWrite=1`
	- `MemRW=1`
	- `ALUSrc_B=1`
- Cycle 5:
	- `RegWrite=1`
- Cycle 6:
	- `RegWrite=1`
	- `ALUSrc_B=1`
- Cycle 7:
	- `RegWrite=1`
	- `MemRW=1`