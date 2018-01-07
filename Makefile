
boot : boot_asm.o
	qemu-system-i386 boot_asm.o
boot_asm.o : boot_asm.s 
	nasm boot_asm.s -f bin -o boot_asm.o