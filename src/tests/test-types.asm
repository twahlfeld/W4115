global sfun
global lfun
global pfun
global efun
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
	mov	rax, 0
	leave
	ret
efun:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 20H
	mov	[rbp-8H], rdi
	mov	rax, [rbp-8H]
	leave
	ret
pfun:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 20H
	mov	[rbp-8H], rdi
	mov	rax, [rbp-8H]
	leave
	ret
lfun:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 20H
	mov	[rbp-8H], rdi
	mov	rax, [rbp-8H]
	leave
	ret
sfun:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 20H
	mov	[rbp-8H], rdi
	mov	rax, [rbp-8H]
	leave
	ret

SECTION .data
SECTION .bss
SECTION .rodata
Str0:
		db 34H, 32H, 0AH, 00H


