;Programme where we will store the string length in a variable

SECTION .data
msg dd "Hello World",0xa     ;double data means 8 bytes of data
len equ $ - msg              ;storing length of msg in len
    
SECTION .text
global _start

_start:
        mov edx,len          ;assigning memory of size len
        mov ecx,msg          ;moving msg to count register
        mov eax,4            ;making a system call sys_write
        int 0x80             ;calling kernel

        mov eax,1            ;making a system call sys_exit
        int 0x80             ;calling kernel

