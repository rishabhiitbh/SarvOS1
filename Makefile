
boot : boot_asm.o
	qemu-system-x86_64 boot_asm.o
boot_asm.o : boot_asm.s include/asm/print.s
	nasm boot_asm.s -f bin -o boot_asm.o
clear :
	rm *.o
	rm *.out
mount :
	mkdir bla
	mount temp.img bla
	chmod 666 bla
umount :
	umount bla
	rm bla -r
mkdisc: boot_asm.s loader.s
	echo "rename temp.img in makefile to your sample disk image"
	nasm boot_asm.s -f bin -o boot_asm.o
	nasm loader.s -f bin -o loader.o
	dd if=boot_asm.o of=temp.img skip=90 seek=90 bs=1 count=440 conv=notrunc
	dd if=loader.o of=temp.img seek=1  bs=512 count=1 conv=notrunc
	qemu-system-x86_64 temp.img