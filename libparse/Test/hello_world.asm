global main

extern fprintf
extern fopen
extern stdout
extern get_title

SECTION .text
main:
	push	rbp
	mov	rbp, rsp
		call	get_title
	mov	rdx, rax
	mov	rsi, STRING
	mov	rdi, [stdout]
	call	fprintf
	pop	rbp
	ret
SECTION .data
SECTION .bss
SECTION .rodata

