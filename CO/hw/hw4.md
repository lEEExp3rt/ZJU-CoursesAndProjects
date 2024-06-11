# HW4

<center>李秋宇 3220103373</center>

[TOC]

---

## 4.1

### 4.1.1

**Solution:**

```verilog
RegWrite = 1'b1;
ALUSrc = 1'b0;
ALU_operation = 4'b0000;
MemWrite = 1'b0;
MemRead = 1'b0;
MemtoReg = 1'b0;
PCSrc = 1'b0;
```

### 4.1.2

**Solution:**

Registers, ALU, MUX

### 4.1.3

**Solution:**

Every blocks produce output, but for `DataMemory` and `ImmGen` their output are not used.

---

## 4.4

### 4.4.1

**Solution:**

`load` instruction will fail because `MemToReg` is always `0` and data in memory will not be loaded into registers

### 4.4.2

**Solution:**

*I-type* instructions will fail since `ALUSrc` is always `0` and `ImmGen` will not be used.

---

## 4.6

### 4.6.1

**Solution:**

No other additional logic blocks needed to be added.

### 4.6.2

**Solution:**

```verilog
Branch = 1'b0;
MemRead = 1'b0;
MemtoReg = 1'b0;
ALUOp = 2'b10;
MemWrite = 1'b0;
ALUSrc = 1'b1;
RegWrite = 1'b1;
```

---

## 4.7

### 4.7.1

**Solution:**

```verilog
R-type = 30 + 250 + 20 + 50 + 25 + 200 + 150 + 150 = 875ps;
```

### 4.7.2

**Solution:**

```verilog
ld = 30 + 250 + 50 + 25 + 250 + 20 + 150 = 775ps;
```

### 4.7.3

**Solution:**

```verilog
sd = 30 + 250 + 150 + 200 + 25 + 250 = 905ps;
```

### 4.7.4

**Solution:**

```verilog
beq = 30 + 250 + 150 + 25 + 200 + 5 + 25 + 20 = 705ps;
```

### 4.7.5

**Solution:**

```verilog
I-type = 30 + 250 + 150 + 25 + 200 + 25 + 20 = 700ps;
```

### 4.7.6

**Solution:**

The minimum clock period for this CPU is `905ps`

---

## 4.9

### 4.9.1

**Solution:**

with this improvement: `1205ps`

without this improvement: `905ps`

### 4.9.2

**Solution:**

with this improvement:

```verilog
total_time = n * 1205 * 0.95;
```

without this improvement:

```verilog
total_time = n * 905;
```

So the speed-up is $\dfrac{1205\times0.95}{905}=0.79$

### 4.9.3

**Solution:**

Since the addition will remove 95% instructions, the cycle time can be 905 / 0.95 = 952.63 = 953, so the slowest for the ALU can be 48ps.

---

## 4.11

### 4.11.1

**Solution:**

No new block are needed to be added.

### 4.11.2

**Solution:**

The control unit needs to be modified to support this instruction.

### 4.11.3

**Solution:**

No new datapath needs to be modified.

### 4.11.4

**Solution:**

No new signals needs to be added.

---

## 4.16

### 4.16.1

**Solution:**

The clock cycle for a pipelined processor is `350ps`

The clock cycle for a non-pipelined processor is `1250ps`

### 4.16.2

**Solution:**

For `ld` instruction both pipelined processor and non-pipelined processor need time of `1250ps`

### 4.16.3

**Solution:**

Split the **ID** stage, and by doing this the latency of **ID** is `175ps`, so the new clock cycle is `300ps`

### 4.16.4

**Solution:**

It is 20%+15%=35%

### 4.16.5

**Solution:**

65%

---

## 4.18

**Solution:**

```assembly
x13 = 33
x14 = 26
```

---

## 4.20

**Solution:**

```assembly
addi x11, x12, 5
NOP
NOP
add x13, x11, x12
addi x14, x11, 15
NOP
add x15, x13, x12
```