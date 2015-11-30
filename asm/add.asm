
global main

extern fprintf
extern fopen
extern stdout

SECTION .text
main:
  push  rbp
  mov rbp, rsp
  mov rax, 1
  mov qword [rbp-8H], rax
  mov rax, 2
  mov qword [rbp-10H], rax
  mov rax, 
  mov qword [rbp-18H], rax
  mov rdx,  mov rdx, rax
  mov rbp-18H, rax

  mov rsi, STRING
  mov rdi, [stdout]
  call  fprintf
  pop rbp
  ret
  pop rbp
  ret
SECTION .data
SECTION .bss
SECTION .rodata
STRING:
    db 78H, 2BH, 79H, 3DH, 25H, 64H, 5CH, 6EH
    db 00H

