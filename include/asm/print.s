printstring:
    mov ah, 0x0e        ;teletype display mode
    print_loop:
        ;mov al, [si]    ;print string in the esi register
        ;add si,1
        lodsb            ;it does the job of string buffer i.e. upper two line
        cmp al,0
        je end
        int 0x10        ;bios interrupt to print al
        jmp print_loop
    end :   
      
ret
