# README

---

## Introduction

* This course `CO` is short for *Computer Organization and Design*.

* Course semester: 2024 Spring.

---

## Homework

### HW1

Mainly about *Chapter1*.

Basic introduction to Computer Organization and some basic concepts about `CPI`, `Clock Cycle` and so on. By handling the equivelant you can easily make it.

### HW2

Mainly about *Chapter3*

In this homework `signed integer`, `IEEE 754 float` and `float addition` are tested.

### HW3

Mainly about *Chapter2*

In this homework **RISC-V Assemblly** and **Machine code** are tested.

### HW4

Mainly about *Chapter4*

In this homework **Single Cycle CPU** and **Pipeline CPU** is mainly tested.

### HW5

Mainly about *Chapter5*

In this homework **Cache** is mainly tested.

---

## Labs

### Lab0

Basic usage and some operations about the software *Vivado* is introduced in this lab. Much work is provided by the teacher, so what is needed is only to re-perform the lab.

> Some useful components are introduced in this lab, like `Mux`, basic gates, which can be re-used.

### Lab1

In this lab you are required to make a `ALU regfile` and a `State machine`. You can choose to connect wires mannually according to the diagram provided by the teacher or you can choose to write Verilog code to connect. By referring to the PPT you will make it. A little time-consuming.

### Lab2

In this lab you are required to make a `single-cycle CPU`. What is key to this lab is that you must make sure your code in the top file `CSSTE.v` is correct and no mistakes, otherwise your project will fail. The top file writing is really bad for your eyes, because you must refer to the diagram provided by the teacher and make code to connect submodules in the top file. But there are 11 submodules! And really numerous wires to make connections! Anyway, try it on your own.

> I have made several foolish mistakes in making connections between wires, so my bitstream file cannot be generated successfully, until the day this lab must be checked. Really a headache!!!
> Some IPs are introduced in this lab, like `Sseg7`, `VGA`.

### Lab3

In this lab you are required to implement a `mul32` and `div32` using what were learnt in the class. By referring to the algorithm, you can easily do it. And bonus task is to implement a floating adder, but the ddl is coming so I have no much time to do it. :cry:

### Lab4

In this lab you are required to implement a single cycle CPU step by step.

#### Lab4-0

First you implement a single cycle CPU core `SCPU`, and in this sub lab you only need to make wire connections

#### Lab4-1

After you finish the `SCPU`, you are required to implement the `datapath` in this sub lab.

Some modules should be also implemented, like `ALU` and `PC`. They will be used in this part.

#### Lab4-2

Then you are required to implement the controller of the single cycle CPU, the `SCPU_ctrl`.

No other modules are needed and you only need to output the control signals in this part.

Remember to simulate to get the corect answer.

#### Lab4-3

The sketch of the single cycle CPU is now completed.

In this sub lab, you are required to make instruction extension so that your CPU can support more instructions.

> A little time-consuming!!!
>
> #### Lab4-4

Previous work is enough, but in this sub lab you are required to implement the `interruption` part.

> Not finished.

### Lab5

In this lab you are required to implement a Pipeline CPU step by step.

#### Lab5-0

First you should implement the top module of the pipeline CPU, so making wire connections is the mainly task.

> Some port name is not correct like `jump`(the powerpoint notes it as `junp`) and there is a mistake about the port `Rd_addr`, its width is not correct.

#### Lab5-1

After the top module is finished, you can now implement some part of the pipeline CPU.

You know that the parse process of 1 instruction is divided into 5 stages in the pipelined CPU:

1. Instruction Fetch(IF)
2. Instruction Decode(ID)
3. Execute(EX)
4. Memory Access(MEM)
5. Write Back(WB)

So you are required to implement step 1 and step 2, the `IF` and `ID` part. It's easy.

And the pipeline registers is also implemented here.

#### Lab5-2

After the previous 2 steps are implemented, the subsequent 3 steps must also be implemented, so you should do it right now.

After all the 5 modules are implemented, you can make connection between them and use the top module you implemented in [Lab5-0](#lab5-0) and your pipelined CPU can now run!!!

By testing the function of your pipelined CPU using the platform `socTest` we built before, you can check whether your CPU is functioning well and correctly.

#### Lab5-3

The main sketch of the pipelined CPU is now completed, but the 3 hazards are not solved in [Lab5-2](#lab5-2), so you are required to implement the `stall` module and add it into your pipelined CPU.

Some control signals are changed, and wire connections are made once again.

After you finish it, you can simulate on `socTest` and check its correctness.
