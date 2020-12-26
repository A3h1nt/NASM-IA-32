SECTION .data
msg dd "The result is: ",0xa
len equ $-msg
num1 dd '4'
num2 dd '2'

SECTION .bss
res resb 1

SECTION .text
global _start:

_start:
	;instructions for printing the message on screen
	mov edx,len
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 0x80

	;instructions for multiplying the two numbers
	
	;converting the numbers into decimal
	mov eax,[num1]
	sub eax,'0'
	mov ebx,[num2]
	sub ebx,'0'

	;multiplying the two numbers
	mul ebx
	add eax,'0'
	mov [res],eax

	;printing out the final result
	mov edx,1
	mov ecx,res
	mov ebx,1
	mov eax,4
	int 0x80

	;sys_exit call
	mov eax,1
	int 0x80
