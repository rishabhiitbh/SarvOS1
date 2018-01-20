[org 0x7c00]            ;loading address of bootloader
mov dx,0x567d
call printhex

jmp $                   ;hang the cpu
%include "include/asm/print.s"
printhex:

    mov ax,dx
    shr ax,12
    mov ax,hexcode + al
    mov [hextemplate+2],al

    mov ax,dx
    shr ax,8
    mov [hextemplate+3],al    
    
    mov ax,dx
    shr ax,4
    mov [hextemplate+4],al    
    
    mov ax,dx
    mov [hextemplate+5],al 

    mov si ,hextemplate 
    call printstring

ret
hextemplate:
    db'0x????',0
hexcode:
    db '0123456789abcdef' 
my_message:
    db 'hello printing from the bootloader',0

times 510 - ($-$$) db 0 ;pad remaining bytes with 0
dw 0xaa55               ;magic number at the end of boot sector 