[org 0x7e00]            
[bits 16]
db 'successfully loaded second sector',0
times 510 - ($ - $$) db 0
dw 0xaa55  