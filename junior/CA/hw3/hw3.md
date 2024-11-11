
# Homework

Add instruction needs 2 clock cycles. Multiply instruction needs 10 clock cycles. Division instruction needs 40 clock cycles. LD instruction need 1 clock cycles.

> The clock cycles here is in stage EXE.

```assembly
FLD     F6 , 34(R2)
FLD     F2 , 45(R3)
FMUL.D  F0 , F2, F4
FSUB.D  F8 , F2, F6
FDIV.D  F10, F0, F6
FADD.D  F6 , F8, F2
```

How many cycles does it take to finish each instruction using the following two methods?

## Scoreboard Algorithm

**Solution:**

It took 3 cycles to get to this state:

|         INST          |  IS  |  RO  |  EX  |  WB  |
| :-------------------: | :--: | :--: | :--: | :--: |
| `FLD     F6 , 34(R2)` |  *   |  *   |  *   |      |
| `FLD     F2 , 45(R3)` |  *   |  *   |      |      |
| `FMUL.D  F0 , F2, F4` |  *   |      |      |      |
| `FSUB.D  F8 , F2, F6` |      |      |      |      |
| `FDIV.D  F10, F0, F6` |      |      |      |      |
| `FADD.D  F6 , F8, F2` |      |      |      |      |

Next cycle:

`F2` is not ready from the 2nd instruction, so the 3rd waits.

The 4th instruction goes in.

|         INST          |  IS  |  RO  |  EX  |  WB  |
| :-------------------: | :--: | :--: | :--: | :--: |
| `FLD     F6 , 34(R2)` |  *   |  *   |  *   |  *   |
| `FLD     F2 , 45(R3)` |  *   |  *   |  *   |      |
| `FMUL.D  F0 , F2, F4` |  *   |      |      |      |
| `FSUB.D  F8 , F2, F6` |  *   |      |      |      |
| `FDIV.D  F10, F0, F6` |      |      |      |      |
| `FADD.D  F6 , F8, F2` |      |      |      |      |

Next cycle:

Now `F2` is ready from the 2nd instruction, so the 3rd instruction can go into RO state.

The 4th instruction has no dependency with former instruction, so it can also go into RO state.

The 5th instruction goes in.

|         INST          |  IS  |  RO  |  EX  |  WB  |
| :-------------------: | :--: | :--: | :--: | :--: |
| `FLD     F6 , 34(R2)` |  *   |  *   |  *   |  *   |
| `FLD     F2 , 45(R3)` |  *   |  *   |  *   |  *   |
| `FMUL.D  F0 , F2, F4` |  *   |  *   |      |      |
| `FSUB.D  F8 , F2, F6` |  *   |  *   |      |      |
| `FDIV.D  F10, F0, F6` |  *   |      |      |      |
| `FADD.D  F6 , F8, F2` |      |      |      |      |

Next cycle:

Now the 3rd instruction starts executing, which costs 10 cycles!!!

The 4th instruction has no more dependency with former instruction, so it starts calculating...

The 5th instruction needs `F0` from 3rd, which is not ready, so it waits.

The last instruction goes in.

|         INST          |  IS  |  RO  |  EX  |  WB  |
| :-------------------: | :--: | :--: | :--: | :--: |
| `FLD     F6 , 34(R2)` |  *   |  *   |  *   |  *   |
| `FLD     F2 , 45(R3)` |  *   |  *   |  *   |  *   |
| `FMUL.D  F0 , F2, F4` |  *   |  *   |  1   |      |
| `FSUB.D  F8 , F2, F6` |  *   |  *   |  1   |      |
| `FDIV.D  F10, F0, F6` |  *   |      |      |      |
| `FADD.D  F6 , F8, F2` |  *   |      |      |      |

2 cycles later:

Now the 4th instruction is done, and `F8` is ready, so the last instruction can go.

`F0` is not ready and the component MULT is busy now, so the 5th instruction still waits.

|         INST          |  IS  |  RO  |  EX  |  WB  |
| :-------------------: | :--: | :--: | :--: | :--: |
| `FLD     F6 , 34(R2)` |  *   |  *   |  *   |  *   |
| `FLD     F2 , 45(R3)` |  *   |  *   |  *   |  *   |
| `FMUL.D  F0 , F2, F4` |  *   |  *   |  3   |      |
| `FSUB.D  F8 , F2, F6` |  *   |  *   |  *   |  *   |
| `FDIV.D  F10, F0, F6` |  *   |      |      |      |
| `FADD.D  F6 , F8, F2` |  *   |  *   |      |      |

3 cycles later:

The last instruction finishes.

|         INST          |  IS  |  RO  |  EX  |  WB  |
| :-------------------: | :--: | :--: | :--: | :--: |
| `FLD     F6 , 34(R2)` |  *   |  *   |  *   |  *   |
| `FLD     F2 , 45(R3)` |  *   |  *   |  *   |  *   |
| `FMUL.D  F0 , F2, F4` |  *   |  *   |  6   |      |
| `FSUB.D  F8 , F2, F6` |  *   |  *   |  *   |  *   |
| `FDIV.D  F10, F0, F6` |  *   |      |      |      |
| `FADD.D  F6 , F8, F2` |  *   |  *   |  *   |  *   |

5 cycles later:

The 3rd instruction finally finishes, so the 5th instruction can go.

|         INST          |  IS  |  RO  |  EX  |  WB  |
| :-------------------: | :--: | :--: | :--: | :--: |
| `FLD     F6 , 34(R2)` |  *   |  *   |  *   |  *   |
| `FLD     F2 , 45(R3)` |  *   |  *   |  *   |  *   |
| `FMUL.D  F0 , F2, F4` |  *   |  *   |  *   |  *   |
| `FSUB.D  F8 , F2, F6` |  *   |  *   |  *   |  *   |
| `FDIV.D  F10, F0, F6` |  *   |  *   |      |      |
| `FADD.D  F6 , F8, F2` |  *   |  *   |  *   |  *   |

And 41 cycles later:

The 5th instruction also finishes!!! :yum:

|         INST          |  IS  |  RO  |  EX  |  WB  |
| :-------------------: | :--: | :--: | :--: | :--: |
| `FLD     F6 , 34(R2)` |  *   |  *   |  *   |  *   |
| `FLD     F2 , 45(R3)` |  *   |  *   |  *   |  *   |
| `FMUL.D  F0 , F2, F4` |  *   |  *   |  *   |  *   |
| `FSUB.D  F8 , F2, F6` |  *   |  *   |  *   |  *   |
| `FDIV.D  F10, F0, F6` |  *   |  *   |  *   |  *   |
| `FADD.D  F6 , F8, F2` |  *   |  *   |  *   |  *   |

So it takes $3+1+1+1+2+3+5+41=57$ cycles to finish.

## Tomasulo's Approach

**Solution:**

2 cycles later:

Now the 1st instruction is in the load buffer and wait to execute.

|         INST          | Issue | Execute | Write |
| :-------------------: | :---: | :-----: | :---: |
| `FLD     F6 , 34(R2)` |   *   |         |       |
| `FLD     F2 , 45(R3)` |   1   |         |       |
| `FMUL.D  F0 , F2, F4` |       |         |       |
| `FSUB.D  F8 , F2, F6` |       |         |       |
| `FDIV.D  F10, F0, F6` |       |         |       |
| `FADD.D  F6 , F8, F2` |       |         |       |

Next cycle:

The 1st instruction complete execution, and the 2rd can go.

The 3rd instruction also goes into the multiplier buffer.

|         INST          | Issue | Execute | Write |
| :-------------------: | :---: | :-----: | :---: |
| `FLD     F6 , 34(R2)` |   *   |    *    |       |
| `FLD     F2 , 45(R3)` |   *   |         |       |
| `FMUL.D  F0 , F2, F4` |   *   |         |       |
| `FSUB.D  F8 , F2, F6` |       |         |       |
| `FDIV.D  F10, F0, F6` |       |         |       |
| `FADD.D  F6 , F8, F2` |       |         |       |

Next cycle:

The 1st instruction completes, and the 2nd instruction completes execution

The 3rd instruction waits for `F2`

The 4th instruction goes in to the adder buffer.

|         INST          | Issue | Execute | Write |
| :-------------------: | :---: | :-----: | :---: |
| `FLD     F6 , 34(R2)` |   *   |    *    |   *   |
| `FLD     F2 , 45(R3)` |   *   |    *    |       |
| `FMUL.D  F0 , F2, F4` |   *   |         |       |
| `FSUB.D  F8 , F2, F6` |   *   |         |       |
| `FDIV.D  F10, F0, F6` |       |         |       |
| `FADD.D  F6 , F8, F2` |       |         |       |

Next cycle:

The 5th instruction goes into the multiplier buffer, and the 3rd and 4th starts executing because `F2` is ready.

|         INST          | Issue | Execute | Write |
| :-------------------: | :---: | :-----: | :---: |
| `FLD     F6 , 34(R2)` |   *   |    *    |   *   |
| `FLD     F2 , 45(R3)` |   *   |    *    |   *   |
| `FMUL.D  F0 , F2, F4` |   *   |    1    |       |
| `FSUB.D  F8 , F2, F6` |   *   |    1    |       |
| `FDIV.D  F10, F0, F6` |   *   |         |       |
| `FADD.D  F6 , F8, F2` |       |         |       |

Next cycle:

The 5th instruction waits for 3rd instruction to use the multiplier, also waiting for `F0`

The last instruction goes into the adder buffer.

|         INST          | Issue | Execute | Write |
| :-------------------: | :---: | :-----: | :---: |
| `FLD     F6 , 34(R2)` |   *   |    *    |   *   |
| `FLD     F2 , 45(R3)` |   *   |    *    |   *   |
| `FMUL.D  F0 , F2, F4` |   *   |    2    |       |
| `FSUB.D  F8 , F2, F6` |   *   |    *    |       |
| `FDIV.D  F10, F0, F6` |   *   |         |       |
| `FADD.D  F6 , F8, F2` |   *   |         |       |

Next cycle:

The 4th instruction finishes with `F8` ready, so the adder can be used by the last instruction.

|         INST          | Issue | Execute | Write |
| :-------------------: | :---: | :-----: | :---: |
| `FLD     F6 , 34(R2)` |   *   |    *    |   *   |
| `FLD     F2 , 45(R3)` |   *   |    *    |   *   |
| `FMUL.D  F0 , F2, F4` |   *   |    3    |       |
| `FSUB.D  F8 , F2, F6` |   *   |    *    |   *   |
| `FDIV.D  F10, F0, F6` |   *   |         |       |
| `FADD.D  F6 , F8, F2` |   *   |    1    |       |

2 cycles later:

The last instruction completes.

|         INST          | Issue | Execute | Write |
| :-------------------: | :---: | :-----: | :---: |
| `FLD     F6 , 34(R2)` |   *   |    *    |   *   |
| `FLD     F2 , 45(R3)` |   *   |    *    |   *   |
| `FMUL.D  F0 , F2, F4` |   *   |    5    |       |
| `FSUB.D  F8 , F2, F6` |   *   |    *    |   *   |
| `FDIV.D  F10, F0, F6` |   *   |         |       |
| `FADD.D  F6 , F8, F2` |   *   |    *    |   *   |

6 cycles later:

The multiplier can be used by 5th instruction.

|         INST          | Issue | Execute | Write |
| :-------------------: | :---: | :-----: | :---: |
| `FLD     F6 , 34(R2)` |   *   |    *    |   *   |
| `FLD     F2 , 45(R3)` |   *   |    *    |   *   |
| `FMUL.D  F0 , F2, F4` |   *   |    *    |   *   |
| `FSUB.D  F8 , F2, F6` |   *   |    *    |   *   |
| `FDIV.D  F10, F0, F6` |   *   |    1    |       |
| `FADD.D  F6 , F8, F2` |   *   |    *    |   *   |

40 cycles later:

Everything is done.

|         INST          | Issue | Execute | Write |
| :-------------------: | :---: | :-----: | :---: |
| `FLD     F6 , 34(R2)` |   *   |    *    |   *   |
| `FLD     F2 , 45(R3)` |   *   |    *    |   *   |
| `FMUL.D  F0 , F2, F4` |   *   |    *    |   *   |
| `FSUB.D  F8 , F2, F6` |   *   |    *    |   *   |
| `FDIV.D  F10, F0, F6` |   *   |    *    |   *   |
| `FADD.D  F6 , F8, F2` |   *   |    *    |   *   |

So it takes $2+1+1+1+1+1+2+6+40=55$ cycles.
