
boot : boot_asm.o
	qemu-system-x86_64 boot_asm.o
boot_asm.o : boot_asm.s include/asm/print.s
	nasm boot_asm.s -f bin -o boot_asm.o
clear :
	rm *.o
	rm *.out
	rm *.bin
mount :
	mkdir bla
	mount temp.img bla
	chmod 666 bla
umount :
	umount bla
	rm bla -r
mkdisc: boot_asm.o secboot
	echo "rename temp.img in makefile to your sample disk image"
	dd if=boot_asm.o of=temp.img skip=90 seek=90 bs=1 count=440 conv=notrunc
	dd if=loader.bin of=temp.img seek=7  bs=512 count=1 conv=notrunc
	qemu-system-x86_64 temp.img
secboot:
	nasm loader.s -f elf32 -o loader.o
	gcc -O0 -ffreestanding -m32 -g -c -fno-pie boot_load.c -o boot_load.o
	ld -o loader.bin -m elf_i386 -Ttext 0x7e00 loader.o boot_load.o --oformat binary 