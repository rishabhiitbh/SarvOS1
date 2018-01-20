
boot : boot_asm.o
	qemu-system-x86_64 boot_asm.o
boot_asm.o : boot_asm.s include/asm/print.s
	nasm boot_asm.s -f bin -o boot_asm.o
clear :
	rm *.o