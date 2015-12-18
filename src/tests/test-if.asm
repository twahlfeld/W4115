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
	mov	qword [rbp-8H], rax
	mov	rcx, 42
	mov	rax, [rbp-8H]
	xor	rax, rcx
	cmp	rax, 0
	jz main1t
	jmp main1bend
main1t:
	mov	rsi, Str0
	mov	rdi, [stdout]
	call	fprintf
main1bend:
	mov	rcx, 43
	mov	rax, [rbp-8H]
	cmp	rax, rcx
	setl	dl
	cmp	dl, 1
	jz main2t
	jmp main2bend
main2t:
	mov	rsi, Str6
	mov	rdi, [stdout]
	call	fprintf
main2bend:
	mov	rcx, 44
	mov	rax, [rbp-8H]
	cmp	rax, rcx
	setne	dl
	cmp	dl, 1
	jz main3t
	jmp main3bend
main3t:
	mov	rsi, Str6
	mov	rdi, [stdout]
	call	fprintf
main3bend:
	mov	rcx, 41
	mov	rax, [rbp-8H]
	cmp	rax, rcx
	setg dl
	cmp	dl, 1
	jz main4t
	jmp main4bend
main4t:
	mov	rsi, Str6
	mov	rdi, [stdout]
	call	fprintf
main4bend:
	mov	rcx, 41
	mov	rax, [rbp-8H]
	cmp	rax, rcx
	setle dl
	cmp	dl, 1
	jz main5t
	mov	rsi, Str6
	mov	rdi, [stdout]
	call	fprintf
	jmp main5bend
main5t:
	mov	rsi, Str9
	mov	rdi, [stdout]
	call	fprintf
main5bend:
	mov	rcx, 43
	mov	rax, [rbp-8H]
	cmp	rax, rcx
	setge dl
	cmp	dl, 1
	jz main6t
	mov	rcx, 42
	mov	rax, [rbp-8H]
	cmp	rax, rcx
	setle dl
	cmp	dl, 1
	jz main6f6t
	jmp main6f6bend
main6f6t:
	mov	rsi, Str6
	mov	rdi, [stdout]
	call	fprintf
main6f6bend:
	jmp main6bend
main6t:
	mov	rsi, Str9
	mov	rdi, [stdout]
	call	fprintf
main6bend:
	mov	rcx, 42
	mov	rax, [rbp-8H]
	cmp	rax, rcx
	setne	dl
	cmp	dl, 1
	jz main7t
	mov	rsi, Str8
	mov	rdi, [stdout]
	call	fprintf
	jmp main7bend
main7t:
	mov	rsi, Str9
	mov	rdi, [stdout]
	call	fprintf
main7bend:
	mov	rax, 0
	leave
	ret

SECTION .data
SECTION .bss
SECTION .rodata
Str9:
		db 20H, 66H, 61H, 69H, 6CH, 00H, 00H, 00H
Str6:
		db 20H, 74H, 65H, 64H, 00H, 00H, 00H, 00H
Str8:
		db 20H, 74H, 65H, 64H, 0AH, 00H, 00H, 00H
Str0:
		db 74H, 65H, 64H, 00H


