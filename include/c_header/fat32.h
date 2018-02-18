#ifndef FAT32_H
#define FAT32_H
#include "types.h"
class __attribute__((packed)) BootParameterBlock 
{
    uint8  IgnoreJump[3];
    uint8  OEM_Name[8];
    uint16 BytesPerSec;
    uint8  SecPerClus;
    uint16 ReservedSectorCount;
    uint8  NumFATS;
    uint16 RootEntCnt;
    uint16 TotalSectors16;
    uint8  MediaType;
    uint16 FatSize16;
    uint16 SectorPerTrack;
    uint16 NumberOfHead;
    uint32 HiddenSectors;
    uint32 TotalSectors32;
    uint32 Fatsize32;
    uint16 ExitFlags;
    uint16 FileSysVer;
    uint32 NumRootClusters;
    uint16 FileSysInfo;
    uint16 BackupBootSector;
    uint8  Reserved[12];
    uint8  DriveNumber;
    uint8  Reserved2;
    uint8  BootSignature;
    uint32 VolumeID;
    uint8  VolumeLabel[11];
    uint8  FileSysType[8];
};


#endif