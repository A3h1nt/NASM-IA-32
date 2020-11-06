; Programme to print a character 9 times 

SECTION .data
msg dd "Print Stars",0xa        ;string into var msg with size 4 bytes
len equ $ - msg                 ;length of msg to var len
str2 times 9 db "*"             ;storing the * character nine times in str2

SECTION .text
global _start

_start:
        ;instructions to print string msg
        mov edx,len             ;allocating data size len
        mov ecx,msg             ;val msg in count register
        mov eax,4               ;system call sys_write
        int 0x80                ;calling kernel

        ;instructions to print the * nine times
        mov edx,9               ;since we have nine characters ,each character takes 1 byte
        mov ecx,str2            ;str2 value in count register
        mov eax,4               ;sys call sys_write
        int 0x80                ;calling kernel

        mov eax,1               ;sys_exit call
        int 0x80                ;calling kernel


