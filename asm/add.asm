; Disassembly of file: add.o
; Mon Nov 16 22:25:27 2015
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

global main

extern fprintf                                          ; near
extern stdout                                           ; qword


SECTION .text   

main:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 16                                 ; 0004 _ 48: 83. EC, 10
        mov     dword [rbp-4H], edi                     ; 0008 _ 89. 7D, FC
        mov     qword [rbp-10H], rsi                    ; 000B _ 48: 89. 75, F0
        mov     ecx, ?_001                              ; 000F _ B9, 00000000(d)
        mov     rax, qword [stdout]                    ; 0014 _ 48: 8B. 05, 00000000(rel)
        mov     edx, 5                                  ; 001B _ BA, 00000005
        mov     rsi, rcx                                ; 0020 _ 48: 89. CE
        mov     rdi, rax                                ; 0023 _ 48: 89. C7
        mov     eax, 0                                  ; 0026 _ B8, 00000000
        call    fprintf                                 ; 002B _ E8, 00000000(rel)
        mov     eax, 0                                  ; 0030 _ B8, 00000000
        leave                                           ; 0035 _ C9
        ret                                             ; 0036 _ C3
; main End of function


SECTION .data  


SECTION .bss  


SECTION .rodata

?_001:                                                  ; byte
        db 25H, 64H, 0AH, 00H                           ; 0000 _ %d..


