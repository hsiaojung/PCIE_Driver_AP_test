/*******************************************************************************
 * (c) Copyright 2017-2018 Microsemi SoC Products Group. All rights reserved.
 *
 * File : pcie_app.h
 *
 * Description : application and kernel interface
 *
********************************************************************************/

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/ioctl.h>

#define MPCI_IOC_MAGIC 'm'

#define MPCI_IOCBAR_WRITE    		_IOWR(MPCI_IOC_MAGIC, 0, int)
#define MPCI_IOCBAR_READ 		_IOWR(MPCI_IOC_MAGIC, 1, int)
#define MPCI_IOCCONFIG_WRITE		_IOWR(MPCI_IOC_MAGIC, 2, int)
#define MPCI_IOCCONFIG_READ 		_IOWR(MPCI_IOC_MAGIC, 3, int)
#define MPCI_IOCCONFIG_READ_ALL 	_IOWR(MPCI_IOC_MAGIC, 4, int)
#define MPCI_IOCDEVICE_INFO 		_IOWR(MPCI_IOC_MAGIC, 5, int)
#define MPCI_IOCISR_INFO 		_IOWR(MPCI_IOC_MAGIC, 6, int)


#define LED_GLOW_REG_OFFSET 0x8 /* Led Offset */
#define DIP_SWITCH_STATUS_REGISTER 0x10 /* Dip Switch Offset */

#define DDR_LSRAM_SHIFT_OFFSET 0x8648

#define ON 0
#define OFF 1

#define TRUE 1
#define FALSE 0

#define SUCCESS                     0L

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;
enum {
	POLARFIRE_EVAL = 1,
	POLARFIRE_SPL,
};
struct config_bar {
	
	unsigned long bar;
	unsigned long offset;
	unsigned long val;

};

struct isr_count
{
	unsigned long isr1;
	unsigned long isr2;
	unsigned long isr3;
	unsigned long isr4;
	unsigned long isr_type_act;
};

struct config_info {
	int offset;
	u16 val_16;
	u32 val_32;
};

struct device_info 
{
	int device_status;
	int device_type;
	int demo_type;
	int support_width;
	int n_width;
	int support_speed;
	int n_speed;
	int num_bar;
	unsigned int bar0_add;
	int bar0_size;
	unsigned int bar1_add;
	int bar1_size;
	unsigned int bar2_add;
	int bar2_size;
	unsigned int bar3_add;
	int bar3_size;
	unsigned int bar4_add;
	int bar4_size;
	unsigned int bar5_add;
	int bar5_size;
	unsigned int bar6_add;
	int bar6_size;
};





struct pci_config {
	u16  VendorID;
	u16  DeviceID;
	u16  Command;
	u16  Status;
	u32  RevisionID;
	u8   Clase_prog;
	u16  Class_device;
	u8   CacheLineSize;
	u8   LatencyTimer;
	u8   HeaderType;
	u8   BIST;
	u32  BaseAddresses[6];
	u32  CIS;
	u16  Sub_VID;
	u16  Sub_DID;
	u32  ROMBaseAddress;
	u8   IRQ_Line;
	u8   IRQ_Pin;
	u8   Min_Gnt;
	u8   Max_Lat;


struct _PCI_MSI_MESSAGE_CONTROL {
    u16  MSIEnable:1;
    u16  MultipleMessageCapable:3;
    u16  MultipleMessageEnable:3;
    u16  CapableOf64Bits:1;
    u16  PerVectorMaskCapable:1;
    u16  Reserved:7;
  } MessageControl;
};
