; Disassembly of file: add.o
; Sat Nov 14 19:37:48 2015
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64




SECTION .text  

main:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        sub     rsp, 16                                 ; 0004 _ 48: 83. EC, 10
        mov     dword [rbp-4H], edi                     ; 0008 _ 89. 7D, FC
        mov     qword [rbp-10H], rsi                    ; 000B _ 48: 89. 75, F0
        mov     edi, ?_001                              ; 000F _ BF, 00000000(d)
        call    puts                                    ; 0014 _ E8, 00000000(rel)
        mov     eax, 0                                  ; 0019 _ B8, 00000000
        leave                                           ; 001E _ C9
        ret                                             ; 001F _ C3
; main End of function


SECTION .data   


SECTION .bss    


SECTION .rodata 

?_001:                                                  ; byte
        db 68H, 65H, 6CH, 6CH, 6FH, 20H, 77H, 6FH       ; 0000 _ hello wo
        db 72H, 6CH, 64H, 00H                           ; 0008 _ rld.


