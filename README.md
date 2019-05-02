# PCIE_Driver_AP_test

HOW to test PCIE driver and it's APP

##########################################################

cd  pcie_linux_driver
make clean
make
then, it creates pci_ccore.ko 

cd pcie_linux_driver

make clean
make

then, it creates the pcie_appln_ctrlpln application.

insmod pci_ccore on your platform.


then, execute pcie_appln_ctrlpln to run DMA sending and receiving.


you can modify the code to meet your requirement test!

currently, we set 0x88 into the memory of 4MB and using DMA transfer them by using 1024K content.

