[org 0x7c00]            ;loading address of bootloader
mov si,my_message
call printstring

jmp $                   ;hang the cpu
%include "include/asm/print.s"
my_message:
    db 'hello printing from the bootloader',0

times 510 - ($-$$) db 0 ;pad remaining bytes with 0
dw 0xaa55               ;magic number at the end of boot sector 