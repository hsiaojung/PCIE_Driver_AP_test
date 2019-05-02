/*******************************************************************************
 * (c) Copyright 2019 Aewin, All rights reserved.
 * File : pcie_appln_ctrlpln.c
 *
 * Description : Linux User Space Application to access Polarfire R666 TPM PCIe End Point
 *
********************************************************************************/


#include "pcie_app.h"
#include <math.h>
#include <sys/mman.h>
#include <assert.h>


#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <signal.h>
#include <unistd.h>
#include <pthread.h>
#include <errno.h>

//R666 DMA Control memory.
#define offsetDMA0_SRC_PARAM	0x8400
#define offsetDMA0_DESTPARAM	0x8404
#define offsetDMA0_SRCADDR_LDW  0x8408
#define offsetDMA0_SRCADDR_UDW	0x840C
#define offsetDMA0_DESTADDR_LDW 0x8410
#define offsetDMA0_DESTADDR_UDW 0x8414
#define offsetDMA0_LENGTH		0x8418
#define offsetDMA0_CONTROL		0x841C
#define offsetDMA0_STATUS		0x8420 
#define offsetDMA0_PRC_LENGTH	0x8424

#define offsetDMA1_SRC_PARAM	0x8440
#define offsetDMA1_DESTPARAM	0x8444
#define offsetDMA1_SRCADDR_LDW	0x8448
#define offsetDMA1_SRCADDR_UDW	0x844C
#define offsetDMA1_DESTADDR_LDW 0x8450
#define offsetDMA1_DESTADDR_UDW 0x8454
#define offsetDMA1_LENGTH		0x8458
#define offsetDMA1_CONTROL		0x845C
#define offsetDMA1_STATUS		0x8460 
#define offsetDMA1_PRC_LENGTH	0x8464

#define _write 1
#define _readonly 0


#define PAGE_SIZE 4096
#define PAGE_CNT 1024

#define MAP_SIZE (PAGE_SIZE * PAGE_CNT)

char ready = 0;

struct tpm_device_node {
	char *path;
	char  *txBuffer;
	char  *mapBuffer;
	int txLen;
	int fd;
};

struct tpm_device_node tpm_device;

void done_handler(int num)
{
    //printf("pcie test:call done_handle\n");
    ready = 1;
}

void fasync_set()
{
    int oflags;
    signal(SIGIO, done_handler);

//	signal(SIGALRM, time_end_pro); 

    fcntl(tpm_device.fd, F_SETOWN, getpid());

    oflags = fcntl(tpm_device.fd, F_GETFL);

    fcntl(tpm_device.fd, F_SETFL, oflags | FASYNC);

}

// Get PC buffer size
unsigned int get_buffer_size(int fd)
{
	unsigned long long size;
	assert(ioctl(fd, _IOC(_IOC_WRITE, 0x00, 0x11, 4), &size) == 0);
	return (unsigned int)((size>>32) & 0xFFFFFFFF);
}

// Get PC buffer physical address
unsigned long long get_buffer_addr(int fd)
{
	unsigned long long addr;
	assert(ioctl(fd, _IOC(_IOC_NONE, 0x00, 0x16, 8), &addr) == 0);
	return addr;
}

// Read config space 
static unsigned int read32_cfg(unsigned int addr)
{
	unsigned long long t;
	t = (addr) | (((unsigned long long)(0))<<32);
	assert(ioctl(tpm_device.fd, _IOC(_IOC_READ, 0x00, 0xFF, 4), &t) == 0);
	return (unsigned int)((t>>32) & 0xFFFFFFFF);
}

// Write config space
static unsigned int write32_cfg(unsigned int addr, unsigned int val)
{
	unsigned long long t;
	t = (addr) | (((unsigned long long)val)<<32);
	//printf("write32_cfg:t = 0x%llx\n", t);
	assert(ioctl(tpm_device.fd, _IOC(_IOC_WRITE, 0x00, 0xFF, 4), &t) == 0);
}

// Write BAR space
void write32_bar(unsigned int idx, unsigned int addr, unsigned int val)
{
	unsigned long long t;
	t = addr | (((unsigned long long)val) << 32);
	assert(ioctl(tpm_device.fd, _IOC(_IOC_WRITE, 0x00, idx, 4), &t) == 0);
}
// Read BAR space
unsigned int read32_bar(unsigned int idx, unsigned int addr)
{
	unsigned long long t;
	t = (addr) | (((unsigned long long) (0)) << 32);
	assert(ioctl(tpm_device.fd, _IOC(_IOC_READ, 0x00, idx, 4), &t) == 0);
	return (unsigned int)((t>>32) & 0xFFFFFFFF);
}

// Read buffer space
static unsigned int read32_buf(unsigned int addr)
{
	unsigned long long t;
	t = (addr) | (((unsigned long long)(0))<<32);
	assert(ioctl(tpm_device.fd, _IOC(_IOC_READ, 0x00, 0xFE, 4), &t) == 0);
	return (unsigned int)((t>>32) & 0xFFFFFFFF);
}

void DmaTest(unsigned char memset_value)
{
	unsigned char mem2fpga = 1;	
	unsigned char fpga2mem = 1;
	
    fprintf(stdout, "START_DMA	==================== MEM to FPGA MAP_SIZE=%d\n\n",MAP_SIZE); 

    memset(tpm_device.mapBuffer, memset_value, MAP_SIZE);
	
    //unsigned char *ptr = malloc(MAP_SIZE);
    //memset(ptr, 0x00, MAP_SIZE);
	//memcpy(tpm_device.mapBuffer, ptr, MAP_SIZE);
	for (int i = 0 ;i < MAP_SIZE ; i++) { //this is for  showing msg mapbuf
		if (tpm_device.mapBuffer[i] != memset_value) {
			fprintf(stdout, "exit1 memset mapbuf[%x]=0x%X\n",i,tpm_device.mapBuffer[i]); 
			exit(1);
		}
	}	
	if(mem2fpga == 1) {//TO FPGA
		read_write_bar_reg(0, 0x8180, 0x0000ffff, _write);
		read_write_bar_reg(0, 0x8188, 0xff0000ff, _write);
		read_write_bar_reg(0, offsetDMA0_SRC_PARAM, 0x0, _write); //offsetDMA0_SRC_PARAM = 0x8400,
		read_write_bar_reg(0, offsetDMA0_DESTPARAM, 0x4, _write);//offsetDMA0_DESTPARAM = 0x 8404,
		read_write_bar_reg(0, offsetDMA0_SRCADDR_LDW, tpm_device.txBuffer, _write);//offsetDMA0_SRCADDR_LDW = 0x8408
		read_write_bar_reg(0, offsetDMA0_SRCADDR_UDW, 0, _write);          //offsetDMA0_SRCADDR_UDW = 0x840x
		read_write_bar_reg(0, offsetDMA0_DESTADDR_LDW, 0x40000000, _write); //offsetDMA0_DESTADDR_LDW = 0x8410 
		read_write_bar_reg(0, offsetDMA0_DESTADDR_UDW, 0x00000000, _write); //FPGA inside ram high = 0x8414
		read_write_bar_reg(0, offsetDMA0_LENGTH, 1024, _write);//offsetDMA0_LENGTH = 0x8417	
		read_write_bar_reg(0, offsetDMA0_CONTROL, 0x03003321, _write);//offsetDMA0_CONTROL = 0x841c
	    sleep(1);
	    read_write_bar_reg(0, 0x8420, 1, _readonly);// bar0  #define offsetDMA0_STATUS= 0x8420 
	}
	sleep(1);
	
	memset(tpm_device.mapBuffer, 0xFF, MAP_SIZE);//this is for  cleaning mapbuf
	for (int i = 0 ;i < MAP_SIZE ; i++) {  
		if (tpm_device.mapBuffer[i] != 0xFF) {
			fprintf(stdout, "exit2 memset mapbuf[%x]=0x%X\n",i,tpm_device.mapBuffer[i]); 
			exit(1);
		}
	}

	if(fpga2mem == 1) {//TO MEM
		fprintf(stdout, "START DMA ==================== FPGA TO MEM\n\n"); 
	
		
		read_write_bar_reg(0, 0x8180, 0x0000ffff, _write);
		read_write_bar_reg(0, 0x8188, 0xff0000ff, _write);

		read_write_bar_reg(0, offsetDMA1_SRC_PARAM, 0x4, _write);
		read_write_bar_reg(0, offsetDMA1_DESTPARAM, 0x0, _write);
		
		read_write_bar_reg(0, offsetDMA1_SRCADDR_LDW, 0x40000000, _write);//8448
		read_write_bar_reg(0, offsetDMA1_SRCADDR_UDW, 0x00000000, _write);//844c
						  

		read_write_bar_reg(0, offsetDMA1_DESTADDR_LDW, tpm_device.txBuffer, _write);//8450
		read_write_bar_reg(0, offsetDMA1_DESTADDR_UDW, 0x00000000, _write);//8454


		read_write_bar_reg(0, offsetDMA1_LENGTH, 1024, _write);//offsetDMA1_LENGTH,//8458
		read_write_bar_reg(0, offsetDMA1_CONTROL, 0x03003321, _write);//offsetDMA0_CONTROL= 845c
		sleep(1);
		read_write_bar_reg(0, offsetDMA1_STATUS, 1, _readonly);
	

	}
	
	for (int i = 0 ;i < (1024) ; i++) { //this is for  showing msg mapbuf
		if (tpm_device.mapBuffer[i] != memset_value) {
			fprintf(stdout, "exit3 memset mapbuf[%x]=0x%X\n",i,tpm_device.mapBuffer[i]); 
			exit(1);
		}
	}
	for (int i = 1024 ;i < MAP_SIZE ; i++) { //this is for  showing msg mapbuf
		if (tpm_device.mapBuffer[i] != 0xff) {
			fprintf(stdout, "exit4 memset mapbuf[%x]=0x%X\n",i,tpm_device.mapBuffer[i]); 
			exit(1);
		}
	}
	sleep(1);//this is for kernel showing msg

	
}

int read_write_bar_reg(unsigned int which_bar,unsigned int reg, unsigned int value, int write)
{

	if (write == 1) {
		write32_bar(which_bar, reg, value);
	}
	
	unsigned int tmp = read32_bar(which_bar, reg);
	fprintf(stdout, "read Bar[%x] Register[%x]=0x%X\n",which_bar,reg,tmp); 
	return tmp;

}

int main(int argc, char *argv[]) {

	unsigned int i, j, which_bar,reg,value,tmp,ustatus;
	unsigned int bufsz;
	unsigned int rd_val;
	unsigned int bar0_addr;
	unsigned int bar1_addr;
	unsigned int bar2_addr;
	unsigned int bar3_addr;
	unsigned int bar4_addr;
	unsigned int bar5_addr, bar0_lo, bar0_hi, bar5_lo, bar5_hi;
	unsigned long long bufad;
	unsigned char ;
	int tx = 0; //from MEM to FPGA
	int rx = 1;//from FPGA to MEM
	

	assert((tpm_device.fd = open("/dev/pcie1", O_RDWR)) >= 0);
	assert((tpm_device.mapBuffer = mmap(0, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, tpm_device.fd, 0)) != MAP_FAILED);
	fasync_set();

	fprintf(stdout, "\n");
	fprintf(stdout, "********************************************************\n");
	fprintf(stdout, "**                   R666 TPM Devive PCIE TEST        **\n");
	fprintf(stdout, "********************************************************\n\n");


	rd_val = read32_cfg(0);
	fprintf(stdout, "Vendor ID: 0x%X, Device ID: 0x%04X\n", rd_val & 0xffff, rd_val >> 16);
	
	bufad = get_buffer_addr(tpm_device.fd);
	tpm_device.txBuffer = bufad;
	tpm_device.txLen = get_buffer_size(tpm_device.fd);
	fprintf(stdout, "PC buffer: address = 0x%llX, size = 0x%x\n", tpm_device.txBuffer, tpm_device.txLen);
	
	DmaTest(0x88);
	
	sleep(3);
	if (tpm_device.mapBuffer) {
		assert(munmap(tpm_device.mapBuffer, MAP_SIZE) != -1);
		tpm_device.mapBuffer = NULL;
	}
	if (tpm_device.fd >= 0) {
		close(tpm_device.fd);
		tpm_device.fd = -1;
	}
	fprintf(stdout, "PCIE Test code is donex\n");
	
	
}
