global main

extern fprintf
extern fopen
extern stdout
extern get_title

SECTION .text
main:
	push	rbp
	mov	rbp, rsp
	sub	esp, 0
	mov	rcx, Str0
	mov	rdx, Str1
	mov	rsi, Str2
	mov	rdi, [stdout]
	call	fprintf
	pop	rbp
	ret
SECTION .data
SECTION .bss
SECTION .rodata
Str2:
		db 25H, 73H, 20H, 25H, 73H, 0AH, 00H, 00H
Str1:
		db 44H, 6FH, 6EH, 27H, 74H, 00H, 00H, 00H
Str0:
		db 50H, 61H, 6EH, 69H, 63H, 00H, 00H, 00H


