#include "types.h"
#ifndef GDT_H
#define GDT_H
typedef struct __attribute__((packed)) SegmentDiscrpter 
{
    uint16 limit_1;
    uint16 base_1;
    uint8  base_2;
    uint8  attr;
    uint8  lim_attr;
    uint8  base_3;
}SegDis;

typedef struct __attribute__((packed)) GlobalDescripterTable 
{

}GDT;

#endif 