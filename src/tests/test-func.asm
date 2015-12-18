global add
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
	mov	rsi, 21
	mov	rdi, 21
	call	add
	mov	qword [rbp-8H], rax
	mov	rdx, [rbp-8H]
	mov	rsi, Str0
	mov	rdi, [stdout]
	call	fprintf
	mov	rax, 0
	leave
	ret
add:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 30H
	mov	[rbp-8H], rdi
	mov	[rbp-10H], rsi
	mov	rcx, [rbp-10H]
	mov	rax, [rbp-8H]
	add	rax, rcx
	leave
	ret

SECTION .data
SECTION .bss
SECTION .rodata
Str0:
		db 25H, 64H, 0AH, 00H


