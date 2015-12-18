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
	mov	rsi, Str1
	mov	rdi, [stdout]
	call	fprintf
	mov	rax, 0
	leave
	ret

SECTION .data
SECTION .bss
SECTION .rodata
Str1:
		db 66H, 6FH, 72H, 64H, 0AH, 74H, 68H, 75H
		db 72H, 0AH, 69H, 6CH, 6CH, 69H, 61H, 6EH
		db 0AH, 00H, 00H, 00H
Str0:
		db 73H, 6CH, 61H, 72H, 74H, 69H, 62H, 61H
		db 72H, 74H, 66H, 61H, 73H, 74H, 0AH, 00H


