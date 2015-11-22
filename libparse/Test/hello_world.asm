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
	mov	rsi, Str0
	mov	rdi, [stdout]
	call	fprintf
	pop	rbp
	ret
SECTION .data
SECTION .bss
SECTION .rodata
Str0:
		db 25H, 73H, 20H, 25H, 73H, 0AH, 22H, 2CH
		db 20H, 22H, 44H, 6FH, 6EH, 27H, 74H, 22H
		db 2CH, 20H, 22H, 50H, 61H, 6EH, 69H, 63H
		db 00H, 00H, 00H, 00H


