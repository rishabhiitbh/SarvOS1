#include "include/c_header/fat32.h"

extern void loader_main()
{
    BPB *p;
    p=0x7c00;
    char c = p->VolumeLabel[2];
        asm(
            "mov %0, %%al;"
            "mov $0x0E, %%ah;"
            "int $0x10;"
            :
            : "r"(c));
}
