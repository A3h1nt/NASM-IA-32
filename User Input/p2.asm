;this programme illustrates how we can change a value for a specific byte in an initialized string
SECTION .data
sen dd "HERO Bro",0xa                   ;string 
len equ $-sen                           ;storing length of string in len

SECTION .text
global _start

_start:
        ;displaying the initial string 
        mov edx,len                     ;length of string
        mov ecx,sen                     ;moving the string itself
        mov ebx,1                       ;file descriptor ( stdout )
        mov eax,4                       ;sys_write
        int 0x80                        ;calling interrupt

        ;changing the value of string to Harsh Bro
        mov [sen],DWORD "ZERO"          ;changing the first four bytes 

        ;displaying the new string
        mov edx,len                     ;length of string
        mov ecx,sen                     ;moving the string itself
        mov ebx,1                       ;file descriptor ( stdout )
        mov eax,4                       ;sys_write
        int 0x80                        ;calling interrupt

        mov eax,1                       ;sys_exit
        int 0x80                        ;calling kernel

