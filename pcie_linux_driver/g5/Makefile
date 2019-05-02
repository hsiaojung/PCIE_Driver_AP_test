# Makefile for building the kernel tpm device drivers outside of the kernel
# Will build for the currently booted kernel and the drivers will remain in
# the current directory
ARCH=arm64
CROSS_COMPILE=aarch64-poky-linux-
CC=$(CROSS_COMPILE)gcc
CC=$(CROSS_COMPILE)gcc

obj-m += pci_chr_drv_ctrlpln.o   
KDIR	:=/home/ubuntu/imx-yocto-bsp/build-xwayland-imx8mqevk/tmp/work/imx8mqevk-poky-linux/linux-imx/4.14.78-r0/git
PWD	:= $(shell pwd)
modules:
	$(MAKE) -C $(KDIR) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) M=$(PWD) modules
clean:
	$(MAKE) -C $(KDIR) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) M=$(PWD) clean

