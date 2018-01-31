org 7C00h            ;loading address of bootloader
BITS 16
jmp ($ + 0x5a)          ;skip 90 bytes for fat32 table
db  0x90                ;see fat documentaion

startfat32:             ;Dummy BPB will get replaced by original
db 'MSWIN4.1'           ;OEMNAME generally ignored
dw 0x0200               ;BYTE_PER_SEC 512 bytes is most common
;since our disk is very small we have small cluster
db 0x01                 ;SEC_PER_CLUSTER  lets take it as 1
dw 0x0020               ;RESRVD_SEC_COUNT generally 32 sectors are reserved
db 0x02                 ;NUMFATS always 2 for any fat
dw 0x0000               ;ROOT_ENT_COUNT   ALWAYS 0 FOR FAAT 32
dw 0x0000                 ;TOT_SEC_16  0  for fat32 see TOT_SEC_32
db 0xf8                 ;MEDIA  0xf8 for fix media and default
dw 0x0000               ;FAT_SZ16 0 for 32

;dummy value ... will get replaced by make
dw 0x0020               ;SEC_PER_TRACK for 13h interupt
dw 0x0040               ;NUM_OF_HEADS for  13h interupt

;4bytes
dw 0x0000                ;HIDD_SEC
dw 0x0000                ;number of hidden sector 0 for unpartioned

;4bytes  .... DUMMY VALUE replaced by make
dw 0x0000                ;TOT_SEC32
dw 0x0000                ;number of sector 

;4bytes  .... DUMMY VALUE replaced by make
dw 0x0000                ;FAT_SZ_32  
dw 0x0000                ;see documentation 

dw 0x0000                ;exit flags   
dw 0x0000                ;FSver 0 default

;4bytes
dw 0x0002                ;number of root clusters
dw 0x0000

dw 0x0001                ;FSinfo   generally 1
dw 0x0006                ;backup_bootsec generally 6

;12bytes
times 12 db 0             ;Reserved always 0 for fat32

db 0x80                  ; drive number 0x80 default
db 0x00                  ;reserved 1 always 0
db 0x29                  ;boot signature 0x29

;4bytes
dw 0x0002                ;dummy volume id
dw 0x0000
db 'NO NAME    '         ; 11 byte vol label               
db 'FAT32   '            ;file sys type   
bootcode:

call diskread
mov si ,second_sector
call printstring

jmp $                   ;hang the cpu
%include "include/asm/print.s"
%include "include/asm/lba.s"
my_message:
    db 'Loading second sector',0 


times 510 - ($-$$) db 0 ;pad remaining bytes with 0
dw 0xaa55               ;magic number at the end of boot sector
second_sector: 
