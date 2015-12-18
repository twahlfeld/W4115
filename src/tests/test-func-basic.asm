global foo
global main

extern fprintf
extern fopen
extern stdout
extern get_title

SECTION .text
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 10H
	mov	rsi, Str0
	mov	rdi, [stdout]
	call	fprintf
	leave
	ret
foo:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 20H
	mov	[rbp-8H], rdi
	mov	rax, 0
	leave
	ret

SECTION .data
SECTION .bss
SECTION .rodata
Str0:
		db 34H, 32H, 0AH, 00H


