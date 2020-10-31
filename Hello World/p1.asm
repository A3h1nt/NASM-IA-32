;Programme to print Hello World string

SECTION .data
msg     dd "Hello World!" , 0xa   ;assigning msg variable a value

SECTION .text
global _start

_start:
        mov edx,13                ;number of bytes for extended data register
        mov ecx,msg               ;assigning the value of msg to extended count register
        mov eax,4                 ;to display since accumulator stores sys_write
        int 0x80                  ;call kernel

        mov eax,1                 ;sys_exit system call
        int 0x80                  ;call kernel
