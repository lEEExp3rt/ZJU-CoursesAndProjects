#!/usr/bin/python3
from pwn import*  #importing the lib

host='10.214.160.13' #IP address
port=11002 #port number
sh=remote(host,port)

def recv_question(conn): 
    ans=b""
    while True:
        data=conn.recv(1)
        if data==b'=':
            return ans
            break
        ans+=data

for n in range(7):
    sh.recvline()
for i in range(10):
    tmp=recv_question(sh).decode('utf-8')
    value=str(eval(tmp))
    sh.sendline(value.encode('utf-8'))
    sh.recvline()
    sh.recvline()
    sh.recvline()
response=(sh.recvline()).decode('utf-8')
print(response)
sh.close()
