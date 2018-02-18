
global _start            
BITS 16
extern loader_main
_start:
  mov si, loaded
  call printstring
  call loader_main
  jmp $
  %include "include/asm/print.s"
  myfunc:
  call printstring
  ret
  loaded:
    db 'loaded secondary ',10,13,0