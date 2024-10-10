#!/usr/bin/python3

from pwn import *

host='116.62.247.145'
port=10102

context.arch='amd64'

io=remote(host,port)
io.recvline()
io.recvline()
io.recvline()

add_asm="""
lea    eax,[rdi+rsi*1]
ret
"""
sub_asm="""
mov    eax,edi
sub    eax,esi
ret
"""
and_asm="""
mov    eax,edi
and    eax,esi
ret
"""
or_asm="""
mov    eax,edi
or     eax,esi
ret
"""
xor_asm="""
mov    eax,edi
xor    eax,esi
ret
"""

#main process:
#add
io.recvline()
io.sendline(asm(add_asm))
io.recvline()
#sub
io.recvline()
io.sendline(asm(sub_asm))
io.recvline()
#and
io.recvline()
io.sendline(asm(and_asm))
io.recvline()
#or
io.recvline()
io.sendline(asm(or_asm))
io.recvline()
#xor
io.recvline()
io.sendline(asm(xor_asm))
io.recvline()

io.interactive()
io.close()
