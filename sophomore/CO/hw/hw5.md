# HW5

[TOC]

---

## 5.3

### 5.3.1

> Calculate the total number of bits required to implement a 32 
> KiB cache with two-word blocks.

**Solution:**

The cache can hold 32KiB / 8B per block = 4096 blocks

Index bits: $\log_2{4096}=12$

Tag bits: 64 - 2  - 12 = 50

So the total number of bits is $4096\times(50+1+2\times4\times8)=471040$

### 5.3.2

> Calculate the total number of bits required to implement a 64 KiB cache with 16-word blocks. How much bigger is this cache than the 32 KiB cache described in Exercise 5.3.1? (Notice that, by changing the block size, we doubled the amount of data without doubling the total size of the cache.)

**Solution:**

A block size is $16\times4=64Bytes$

The cache can hold 64KiB / 64B = 1024 blocks

Index bits: $\log_2{1024}=10$

Tag bits: 64-10-4-2=48

So the total number of bits is $1024\times(48+1+4+16\times4\times8)=578560$

### 5.3.3

> Explain why this 64 KiB cache, despite its larger data size, might provide slower performance than the first cache.

**Solution:**

The larger block size may result in increased hit time and increased miss penalty

---

## 5.5

### 5.5.1

>  What is the cache block size (in words)?

**Solution:**

The cache block size is $2^{5-3}=4$

### 5.5.2

>  How many blocks does the cache have?

**Solution:**

The cache have $2^5=32$ blocks.

### 5.5.3

> What is the ratio between total bits required for such a cache 
> implementation over the data storage bits?
>
> Beginning from power on, the following byte-addressed cache references are 
> recorded.

**Solution:**

The cache stores 32blocks * 4 words per block * 8 Bytes per word = 1024bytes=8192bits.

For total number of bits, the cache has more bits to store 32blocks * (54+1)bits per block =9952 bits.

So the ratio is 1.21.

## 5.7

### 5.7.1

> Suppose a CPU with a write-through, write-allocate cache achieves a CPI of 2. What are the read and write bandwidths (measured by bytes per cycle) between RAM and the cache? (Assume each miss generates a request for one block.)

**Solution:**

## 5.11

### 5.11.1

> Sketch the organization of a three-way set associative cache with two-word blocks and a total size of 48 words. Your sketch should have a style similar to Figure 5.18, but clearly show the width of the tag and data fields.

**Solution:**

For each block, there will be 2 words.

For 3-way set associative cache, there will be 2*3=6 words per line.

So there will be 48 / 6 = 8lines.

### 5.11.2

## 5.16

### 5.16.1

**Solution:**

### 5.16.2

## 5.17

### 5.17.1

> Given the parameters shown above, calculate the maximum possible page table size for a system running five processes.

**Solution:**

The tag size is $32-\log_2{8192}=32-13=19$ bits

For all 5 page tables would need $5\times2^19\times4)=10MB$ 

### 5.17.2

> Given the parameters shown above, calculate the total page table size for a system running five applications that each utilize half of the virtual memory available, given a two-level page table approach with up to 256 entries at the 1st level. Assume each entry of the main page table is 6 bytes. Calculate the minimum and maximum amount of memory required for this page table.

**Solution:**

### 5.17.3

>  A cache designer wants to increase the size of a 4 KiB virtually indexed, physically tagged cache. Given the page size shown above, is it possible to make a 16 KiB direct-mapped cache, assuming two 64-bit words per block?How would the designer increase the data size of the cache?

**Solution:**

The page index is 13bits

A 16 KB direct-mapped cache with two 64-bit words per block would have 16-byte blocks and thus 1024 blocks. Thus , it would have 10 index bits and 4 offset bits and the index would go out of the page index.