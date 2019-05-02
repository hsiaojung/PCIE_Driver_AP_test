# Makefile for building the kernel tpm device drivers outside of the kernel
# Will build for the currently booted kernel and the drivers will remain in
# the current directory
ARCH=arm64
CROSS_COMPILE=aarch64-poky-linux-
CC=$(CROSS_COMPILE)gcc --sysroot=/opt/fsl-imx-xwayland/4.14-sumo/sysroots/aarch64-poky-linux


all: pcie_appln_ctrlpln.c
	#$(CC) $(CFLAGS) -o pcie_appln_ctrlpln pcie_appln_ctrlpln.c -L/opt/fsl-imx-xwayland/4.14-sumo/sysroots/aarch64-poky-linux/usr/lib -I/opt/fsl-imx-xwayland/4.14-sumo/sysroots/aarch64-poky-linux/usr/include
	$(CC) $(CFLAGS) -o pcie_appln_ctrlpln pcie_appln_ctrlpln.c

clean :
	rm -rf pcie_appln_ctrlpln pcie_appln_ctrlpln.o


