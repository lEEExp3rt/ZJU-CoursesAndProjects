#!/usr/bin/python3
from pwn import *

host,port=input("Input your host and port:").split(":")
port=int(port)
io=remote(host,port)

def read_cipher(cipher): #read the cipher from the ciphertext
    return cipher[44:] #strip the header 'ciphertext: ', the IV and the '\n' in the last from the ciphertext

def group(text): #groupfy the text with 16 characters in each group , and the type of the argument text is bytestring
    grouplist=[]
    tmp=''
    text = text.decode() #decode the bytestring into a string
    for i in range(0, len(text)):
        tmp+=hex(ord(text[i]))[2:]
        if (i%16==15|i==len(text)):
            grouplist.append(int('0x'+tmp,16))
            tmp=''
    return grouplist #each element in grouplist is a integer
        

def cipher_change(cipher1,plaintext1,plaintext2,index): #change the cipher to another cipher so different plaintext can be output, and all arguments are int types
    return plaintext2^plaintext1^cipher1

#main program
plaintext1=io.recvline()
plaintext1+=io.recvline()[:-1]
plaintext2=io.recvline()[:-1] # remove the '\n' from the last
cipher1=read_cipher(io.recvline())
cipher2=""

plain1=group(plaintext1)
plain2=group(plaintext2)
cipher_1=group(cipher1)

for i in range(1,2): #get cipher2 in blocks
    cipher2+=bytes.fromhex(str(cipher_change(cipher_1[i],plain1[i+1],plain2[i+1])))

io.sendline(cipher2)
print(io.recvline())
io.close()
