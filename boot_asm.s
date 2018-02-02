org 7C00h            ;loading address of bootloader
BITS 16
jmp ($ + 0x5a)          ;skip 90 bytes for fat32 table
db  0x90                ;see fat documentaion

startfat32:             ;Leave Space for BPB
times 87 db 0
bootcode:

mov si ,loading_second
call printstring
call diskread

call second_sector

haltcpu:
    jmp $                   ;hang the cpu
%include "include/asm/print.s"
%include "include/asm/lba.s"
loading_second:
    db 'Loading secondary bootloader... ',10,13,0 


times 510 - ($-$$) db 0 ;pad remaining bytes with 0
dw 0xaa55               ;magic number at the end of boot sector
second_sector: 
