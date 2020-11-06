;this is a programme which takes a user input and displays it on the screen
SECTION .data
msg1 db "Enter a number : ",0xa         ;our string
len1 equ $-msg1                         ;length of our string
msg2 db "The entered string is : ",0xa
len2 equ $-msg2

SECTION .bss
num resb 5                              ;reserving a variable with length 5 and size 1 byte

SECTION .text
global _start

_start:
        ;displaying the string stored in msg1
        mov edx,len1                    ;length of string one
        mov ecx,msg1                    ;string one
        mov ebx,1                       ;filedescriptor ( stdout )
        mov eax,4                       ;making a sys_write call
        int 0x80                        ;calling kernel

        ;taking user input in variable num
        mov edx,5                       ;length of the uninitialized variable
        mov ecx,num                     ;our user input
        mov ebx,2                       ;filedescriptor ( stdin )
        mov eax,3                       ;making a sys_read call
        int 0x80

        ;displaying the second string
        mov edx,len2                    ;length of string two
        mov ecx,msg2                    ;string two
        mov ebx,1                       ;filedescriptor ( stdout )
        mov eax,4                       ;making a sys_write call
        int 0x80                        ;calling kernel

        ;displaying the user inputted value
        mov edx,5                       ;length of num
        mov ecx,num                     ;the number
        mov ebx,1                       ;filedescriptor ( stdout )
        mov eax,4                       ;making a system call sys_write
        int 0x80                        ;calling kernel

        mov eax,1                       ;making a sys exit call
        int 0x80                        ;calling kernel


