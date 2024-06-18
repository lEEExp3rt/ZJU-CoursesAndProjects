# README

---

## Introduction

* This folder is for my Cryptology course.

* Course semester: 2024 Spring.

---

## Homework

### HW1: Affine Cipher

This homework is mainly about Affine Cipher solving. By listing out all the unknown parameters and make equations, you can easily solve them.

### HW2: Enigma Crack

In this homework you are required to implement the **Enigma** crypto machine. `RingSetting` and `Plugboard` are given, and you are required to crack this crypto algorithm by enumerating violently. Due to implicit theory teaching, I have search for several relevant information, documents to finally understand how this old machine invented in World War II works. After you fully understand the algorithm, you can code very quickly. But the debugging process also took up a lot of time, but the finally success is really meaningful and worthwhile. By doing this homework, I get fully grasp of this crypto algorithm.

### HW3: MD5 Sbox Cfb

In this homework you are required to implement a new algorithm mixed by **MD5** and **DES**. The algorithm is provided in a diagram and you only need to follow its instruction to do it. However, in this homework you need to use `openssl.md5.h` and use some functions like `MD5_Init` and `MD5_Update` to finish the process. Some debugging information is provided so it won't be hard to finish. However, I have made a lot of time to debug it :angry:!

### HW4: DES Completion

In this homework you are required to complete a modified version DES. Only the `plaintext_32bit_expanded_to_48bit_table` is modified and everything apart from this is the same from classic DES.

You are required to implement 2 parts:

1. `permutation`
2. `f` function

By completely understanding the algorithm and how the given code works you can finally make it.

> Forgetting to initialize the arrays `bufout` and `outblock` will contribute to error answer!!! :angry:
> It's really abstract to fully understand the design of the 3-dimension arrays.

### HW5

In this homwork you are required to implement `AES` functions to make correct answer.

Several functions need to be finished, so `AES` encryption and decryption can be correctly finished.

After fully understanding how `AES` works you can quickly finish it.

> The GF($2^8$)'s multiplication is not easy to understand, and debugging process is really annoying!!! :angry:

### HW6

In this homework, you are required to implement `RSA` algorithm using `openssl/rsa.h` and other libraries.

> The version of the teacher Black White's `openssl` is too old and not fit to current version, which makes debugging or even coding very hard!!! :anger:
