; Disassembly of file: main.o
; Tue Nov 17 02:55:06 2015
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

global main

extern printf                                           ; near
extern get_title                                        ; near


SECTION .text

main:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 32                                 ; 0004 _ 48: 83. EC, 20
        mov     dword [rbp-14H], edi                    ; 0008 _ 89. 7D, EC
        mov     qword [rbp-20H], rsi                    ; 000B _ 48: 89. 75, E0
        mov     edi, ?_001                              ; 000F _ BF, 00000000(d)
        call    get_title                               ; 0014 _ E8, 00000000(rel)
        mov     qword [rbp-8H], rax                     ; 0019 _ 48: 89. 45, F8
        mov     rax, qword [rbp-8H]                     ; 001D _ 48: 8B. 45, F8
        mov     rsi, rax                                ; 0021 _ 48: 89. C6
        mov     edi, ?_002                              ; 0024 _ BF, 00000000(d)
        mov     eax, 0                                  ; 0029 _ B8, 00000000
        call    printf                                  ; 002E _ E8, 00000000(rel)
        mov     eax, 0                                  ; 0033 _ B8, 00000000
        leave                                           ; 0038 _ C9
        ret                                             ; 0039 _ C3
; main End of function


SECTION .data


SECTION .bss


SECTION .rodata

?_001:                                                  ; byte
        db 68H, 74H, 74H, 70H, 3AH, 2FH, 2FH, 77H       ; 0000 _ http://w
        db 77H, 77H, 2EH, 66H, 69H, 6EH, 64H, 6DH       ; 0008 _ ww.findm
        db 69H, 6EH, 65H, 2EH, 75H, 73H, 2FH, 00H       ; 0010 _ ine.us/.

?_002:                                                  ; byte
        db 25H, 73H, 00H                                ; 0018 _ %s.




