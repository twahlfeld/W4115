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
	mov	rax, 0
	mov	qword [rbp-8H], rax
	mov	rax, 0
	mov	qword [rbp-10H], rax
main2w:
	mov	rcx, 42
	mov	rax, [rbp-8H]
	cmp	rax, rcx
	setl	dl
	cmp	dl, 1
	jnz main2wend
	mov	rcx, 1
	mov	rax, [rbp-10H]
	add	rax, rcx
	mov	qword [rbp-10H], rax
	mov	rcx, 1
	mov	rax, [rbp-8H]
	add	rax, rcx
	mov	qword [rbp-8H], rax
	jmp main2w
main2wend:
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


