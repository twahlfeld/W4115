global main

extern fprintf
extern fopen
extern stdout
extern get_title

SECTION .text
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 20H
	mov	rax, 42
	mov	qword [rbp-10H], rax
	mov	rdx, [rbp-10H]
	mov	rsi, Str0
	mov	rdi, [stdout]
	call	fprintf
	mov	rax, 0
	leave
	ret

SECTION .data
SECTION .bss
SECTION .rodata
Str0:
		db 25H, 64H, 0AH, 00H


