;read 1 sector using lba
diskread:
    pusha
    mov si ,dapparam    ;load dap
    mov ah ,0x42        ;read using lba
    int 0x13
    jc printerror
    popa
ret

printerror:
    mov si,DiscReadError
    call printstring
    popa
ret 
dapparam:
    db 0x10         ;size of dap
    db 0x00         ;unused ... should be 0
    dw 0x0001       ;number of sector to be loaded
    dw 0x7e00       ;offset
    dw 0x0000       ;segment
    dd 7            ;lba number 8 bytes
    dd 0
DiscReadError:
    db 'Error in reading disc ',10,13,0
