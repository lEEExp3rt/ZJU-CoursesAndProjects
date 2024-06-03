#!/usr/bin/python3
from pwn import *
host,port=input("Input your host and port:").split(':')
port=int(port)
io=remote(host,port)


def read_IV(cipher): #read IV from the raw ciphertext
    IV=cipher[:16].decode()
    cipher=cipher[16:] #strip the cipher from the raw ciphertext, and the type of cipher is still bytestring
    return IV #return IV in string format

def group(cipher): #group the cipher in groups, and the argument cipher is in string format
    blocks=[]
    for i in range(0,len(cipher),16):
        blocks.append(cipher[i:i+16])
    return blocks #return in list format

#main function:get the flag directly
ciphertext=io.recvline() #type: bytestring
IV=read_IV(ciphertext) #type: string
cipher_group=list(IV) #the type of cipher_group is string; add IV as the first element
cipher_group+=group(ciphertext.decode()) #type: string
length=len(cipher_group)-1 #get the number of blocks, and the first element IV is excluded because not needed
plain_group=[] #initialize the plain group, which is used to record the plain blocks
for i in range(length,0,-1): #circulate the cipher blocks
    cipher1,cipher2=cipher_group[i-1],cipher_group[i] #for tmp recorder
    plain="" #initialize the plain recorder
    for j in range(16,-1,-1):
        tmp=cipher1 #temporarily copy the value of cipher1
        for k in range(0x00,0xff):
            tmp[j:]=(bytes.fromhex(str(k))).decode() #every last char in tmp is changed
            ciphertext0=''.join(cipher_group[:i-1])+tmp+''.join(cipher_group[i:])
            io.sendline(ciphertext0.encode())
            feedback=io.recvline()
            if int(feedback.decode())==403:
                break
        plain=chr(k^int(tmp[j],16)^int(cipher1[j],16))+plain    
    plain_group.append(plain)
plaintext=plain_group[::-1] #reverse the order of the plaintext because it is appneded in the reverse order
print(''.join(plain_group)) #get the flag directly from the plaintext
