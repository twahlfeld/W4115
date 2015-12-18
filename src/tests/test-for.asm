global main

extern fprintf
extern fopen
extern stdout
extern get_title

SECTION .text
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 70H
	mov	rax, 0
	mov	qword [rbp-8H], rax
	mov	rax, 0
	mov	qword [rbp-10H], rax
	mov	rax, 84
	mov	qword [rbp-18H], rax
	mov	rax, 37
	mov	qword [rbp-20H], rax
	mov	rax, 0
	mov	qword [rbp-28H], rax
	mov	rax, 0
	mov	qword [rbp-30H], rax
main0f1w:
	mov	rcx, 42
	mov	rax, [rbp-30H]
	cmp	rax, rcx
	setl	dl
	cmp	dl, 1
	jnz main0f1wend
	mov	rcx, 1
	mov	rax, [rbp-8H]
	add	rax, rcx
	mov	qword [rbp-8H], rax
	mov	rcx, 1
	mov	rax, [rbp-30H]
	add	rax, rcx
	mov	qword [rbp-30H], rax
	jmp main0f1w
main0f1wend:
	mov	rax, 0
	mov	qword [rbp-38H], rax
main1f1w:
	mov	rcx, 41
	mov	rax, [rbp-38H]
	cmp	rax, rcx
	setle dl
	cmp	dl, 1
	jnz main1f1wend
	mov	rcx, 1
	mov	rax, [rbp-10H]
	add	rax, rcx
	mov	qword [rbp-10H], rax
	mov	rcx, 1
	mov	rax, [rbp-38H]
	add	rax, rcx
	mov	qword [rbp-38H], rax
	jmp main1f1w
main1f1wend:
	mov	rax, 84
	mov	qword [rbp-40H], rax
main2f1w:
	mov	rcx, 43
	mov	rax, [rbp-40H]
	cmp	rax, rcx
	setge dl
	cmp	dl, 1
	jnz main2f1wend
	mov	rcx, 1
	mov	rax, [rbp-18H]
	sub	rax, rcx
	mov	qword [rbp-18H], rax
	mov	rcx, 1
	mov	rax, [rbp-40H]
	sub	rax, rcx
	mov	qword [rbp-40H], rax
	jmp main2f1w
main2f1wend:
	mov	rax, 100
	mov	qword [rbp-48H], rax
main3f1w:
	mov	rcx, 4
	mov	rax, [rbp-48H]
	cmp	rax, rcx
	setg dl
	cmp	dl, 1
	jnz main3f1wend
	mov	rcx, 1
	mov	rax, [rbp-20H]
	add	rax, rcx
	mov	qword [rbp-20H], rax
	mov	rcx, 2
	mov	rax, [rbp-48H]
	cdq
	idiv	rcx
	mov	qword [rbp-48H], rax
	jmp main3f1w
main3f1wend:
	mov	rax, 1
	mov	qword [rbp-50H], rax
main4f1w:
	mov	rcx, 4
	mov	rax, [rbp-50H]
	cmp	rax, rcx
	setne	dl
	cmp	dl, 1
	jnz main4f1wend
	mov	rax, 0
	mov	qword [rbp-58H], rax
main4f1w0f1w:
	mov	rcx, 12
	mov	rax, [rbp-58H]
	cmp	rax, rcx
	setl	dl
	cmp	dl, 1
	jnz main4f1w0f1wend
	mov	rcx, 1
	mov	rax, [rbp-28H]
	add	rax, rcx
	mov	qword [rbp-28H], rax
	mov	rcx, [rbp-50H]
	mov	rax, [rbp-58H]
	add	rax, rcx
	mov	qword [rbp-58H], rax
	jmp main4f1w0f1w
main4f1w0f1wend:
	mov	rcx, 1
	mov	rax, [rbp-50H]
	add	rax, rcx
	mov	qword [rbp-50H], rax
	jmp main4f1w
main4f1wend:
	mov	rcx, 2
	mov	rax, [rbp-28H]
	imul	rcx
	mov	qword [rbp-28H], rax
	mov	rcx, 2
	mov	rax, [rbp-28H]
	add	rax, rcx
	mov	qword [rbp-28H], rax
	mov	rax, [rbp-28H]
	mov	[rsp+0H], rax
	mov	r9, [rbp-20H]
	mov	r8, [rbp-18H]
	mov	rcx, [rbp-10H]
	mov	rdx, [rbp-8H]
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
		db 25H, 64H, 20H, 25H, 64H, 20H, 25H, 64H
		db 20H, 25H, 64H, 20H, 25H, 64H, 0AH, 00H


