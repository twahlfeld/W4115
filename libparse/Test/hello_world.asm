global main

extern fprintf
extern fopen
extern stdout
extern get_title

SECTION .text
main:
	push	rbp
	mov	rbp, rsp
Str0	call	get_title
	mov	rdx, rax
	mov	rsi, Str1
	mov	rdi, [stdout]
	call	fprintf
	pop	rbp
	ret
SECTION .data
SECTION .bss
SECTION .rodata
Str1:
		db 68H, 74H, 74H, 70H, 3AH, 2FH, 2FH, 77H
		db 77H, 77H, 2EH, 66H, 69H, 6EH, 64H, 6DH
		db 69H, 6EH, 65H, 2EH, 75H, 73H, 2FH, 00H, 00H
Str0:
		db 69H, 68H, 74H, 74H, 70H, 3AH, 2FH, 2FH
		db 77H, 77H, 77H, 2EH, 66H, 69H, 6EH, 64H
		db 6DH, 69H, 6EH, 65H, 2EH, 75H, 73H, 2FH
		db 00H


