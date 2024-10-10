# HW8

[TOC]

---

## 12.1

### a

**Solution:**

I will choose to use SSDs to be the buffer or cache for magnetic disks because for real-time queries, using SSDs for a buffer or cache for magnatic disks can accelerate the accessing speed in disks, while the 1st choice you need to access data from disks directly, which will cause delays.

### b

**Solution:**

Obviously I will choose to use SSDs to be the storage layer between memory and disks because from the information we know that some part of the relations are frequently used while others are not, so this fits well with the 1st choice.

---

## 13.5

**Solution:**

We can use a `Hash Table` or a `Map` to quickly locate where the buffer is resided, because they costs $O(1)$ to find them.

---

## 13.9

### a

**Solution:**

We can store `-1` or any negtive number in `offset` since negtive offset means the beginning of this buffer is meaningless and in this case the length of the buffer can be any number too.

### b

**Solution:**

We can modify the representation by moving the null bitmap to the front so that we can access quick where the non-null values are and ignore the null values.

---

## 13.11

### a

**Solution:**

* Advantage
    * Easier to put those frequently used relations in SSDs with those less frequently used in disks
    * Reading data from disks will contribute to less disk-arm movement and make accessing data quicker.
* Disadvantage
    * Space optimization cannot be well performed since each relation is stored in seperate files
    * To access some highly-relevant relations you need to go through disk-memory-disk, which will leads to low access speed.

### b

**Solution:**

* Advantage:
    * Optimization of space can be well-performed.
    * For highly-relevant relations you can access them in the same file and less disk-memory-disk movement.
* Disadvantage
    * The storage file will be larger and parallel accessing will not be easy.
    * If the file is too large, you may not seperate it into different parts and put some of the frequently used data in SSDs or cache.
