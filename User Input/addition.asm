;this programme takes two numbers from user , adds then and displays the result

;defining some constants
SYS_WRITE equ 4
SYS_READ  equ 3
STDOUT    equ 1
STDIN     equ 2

SECTION .data

msg1 dd "Enter the first digit : "              ;initializing string one
len1 equ $-msg1                                 ;storing length in len1

msg2 dd "Enter the second digit :  "            ;initializing string two
len2 equ $-msg2                                 ;storing length in len2

msg3 dd "The result is : "                      ;initializing string three
len3 equ $-msg3                                 ;storing length len3

;declaring the uninitialized string
SECTION .bss
num1 resb 2                                     ;variable for first number with size 2 bytes
num2 resb 2                                     ;variable for second number with size 2 bytes
res resb 1                                      ;variable to store the results with size one byte

SECTION .text
global _start

_start:
        ;printing msg1
        mov edx,len1
        mov ecx,msg1
        mov ebx,STDOUT
        mov eax,SYS_WRITE
        int 0x80

        ;taking the user input for first number
        mov edx,2
        mov ecx,num1
        mov ebx,STDIN
        mov eax,SYS_READ
        int 0x80

        ;printing msg2
        mov edx,len2
        mov ecx,msg2
        mov ebx,STDOUT
        mov eax,SYS_WRITE
        int 0x80

        ;taking the user input for second number
        mov edx,2
        mov ecx,num2
        mov ebx,STDIN
        mov eax,SYS_READ
        int 0x80

        ;displaying the string 3
        mov edx,len3
        mov ecx,msg3
        mov ebx,STDOUT
        mov eax,SYS_WRITE
        int 0x80

        ;converting the two numbers
        mov eax,[num1]                                  ;moving the first number to accumulator
        sub eax,'0'                                     ;converting the number into decimal
        mov ebx,[num2]                                  ;moving the second number to another register
        sub ebx,'0'                                     ;converting the number into decimal

        ;adding the two numbers
        add eax,ebx                                     ;adding the two numbers
        add eax,'0'                                     ;converting the number back to ascii from decimal
        mov [res],eax                                   ;moving the value from accumulator to res variable

        ;displaying the result
        mov edx,1
        mov ecx,res
        mov ebx,STDOUT
        mov eax,SYS_WRITE
        int 0x80

        ;exit
        mov eax,1                                       ;sys_exit call
        int 0x80                                        ;calling the kernel

