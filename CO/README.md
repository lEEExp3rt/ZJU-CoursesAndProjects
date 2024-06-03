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

In this lab you are required to implement a `mul32` and `div32` using what were learnt in the class. By referring to the algorithm, you can easily do it. And bonus task is to implement a floating adder, but the ddl is coming so I have no much time to do it. :sad:
