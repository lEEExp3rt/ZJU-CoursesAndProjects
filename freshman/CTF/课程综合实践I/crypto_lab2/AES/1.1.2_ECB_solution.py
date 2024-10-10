#!/usr/bin/python3
from pwn import *

host='10.214.160.22'
port=39135
io=remote(host,port)

tip_len=2*len(b'Hello ' + b' , Here is the flag: ')
length=tip_len + 14

def add0(num):
    if num<0x10:
        return '0'+hex(num)[2:]
    else:
        return hex(num)[2:]

def trans(s): #transform a string to into bytes with their ASCII CODE
    out=b''
    for i in range(len(s)):
        out+=add0(ord(s[i])).encode()
    return out

def decrypt():
    flag=[]
    t=b''
    #Step 1:
    for i in range(7,0,-1):
        username=b'41'*i
        io.sendline(username)
        buf=io.recvline()
        buf=buf[12:-1]
        length=tip_len+len(username)
        target=buf[length:length+2]
    #Step 2:
        username=username + trans(" , Here is the flag: ") + t
        for j in range(1,0x100):
            username+= add0(j).encode()
            io.sendline(username)
            buf=io.recvline()
            buf=buf[12:-1]
            tmp=buf[length:length+2]
            if tmp==target:
                t=tmp
                flag.append(chr(int(tmp.decode(),16)))
                break
            username=username[:-2]
    return flag

#main program
print("".join(obj for obj in decrypt()))
