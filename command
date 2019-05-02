scp aewin@192.168.99.173:/home/aewin/work/imx/linux_pcie_app/pcie_appln_ctrlpln ./
scp aewin@192.168.99.173:/home/aewin/work/imx/pcie_linux_driver/pci_ccore.ko ./

i = 0x841C; ./
echo 1 > /proc/sys/kernel/printk
echo "0 0 0 0" > /proc/sys/kernel/printk
echo "7 7 7 7" > /proc/sys/kernel/printk

  insmod ./pci_ccore.ko;echo 1 > /proc/sys/kernel/printk;scp aewin@192.168.99.173:/home/aewin/work/imx/linux_pcie_app/pcie_appln_ctrlpln ./;./pcie_appln_ctrlpln;

