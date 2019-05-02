/*******************************************************************************
 * (c) Copyright 2017-2018 Microsemi SoC Products Group. All rights reserved.
 *
 * File : pci_chr_drv_ctrlpln.c
 *
 * Description : Linux Device Driver to access Polarfire PCIe Endpoint
 *
********************************************************************************/

#include "pci_chr_drv_ctrlpln.h"
#include "hardware.h"


struct privData *pciData;

struct cdev *ms_pci_cdev = NULL;
dev_t ms_pci_dev;
static struct class *ms_pci_class = NULL;

static unsigned long intCounter;
struct isr_count g_isr_count;

void interrupt_control(struct pci_dev *pdev, unsigned char);
struct pci_dev *samplePdev;
int i = 0,Devdetect = 0;

//Endpoint vendorID/DeviceID
static struct pci_device_id ms_pci_tbl[] = {
	{ MPCI_VENDOR_ID, MPCI_DEVICE_ID, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
	{0,}
};

MODULE_DEVICE_TABLE(pci, ms_pci_tbl);

/**
* ms_pci_interrupt() - PCIe interrupt Handler
*
*  @irq : PCIe interrupt number
*/
static irqreturn_t ms_pci_interrupt(int irq,void *dev_id)
{

	int lirq = 0;
	unsigned int *ptr_local = NULL;
	printk(" intCounter = %ld\n", intCounter);


	lirq = pciData->pdev->irq;
	if(lirq == irq)
	{
	        g_isr_count.isr1++;
	}
	else if((lirq+1) == irq)
	{
					g_isr_count.isr2++;
	}
	else if((lirq+2) == irq)
	{
        	g_isr_count.isr3++;
	}
	else if((lirq+3) == irq)
	{
	       g_isr_count.isr4++;
	}

	// clear IRQ
	ptr_local = (unsigned int *)pciData->barInfo[0].baseVAddr;

	*(ptr_local + G5_ISTATUS_HOST ) = 0XFFFFFFFF;

	printk("irq cleared %d\n",irq);
        return IRQ_HANDLED;
}

/**
* ms_pci_probe() - Initialize char device Module
*
*  @pdev : Platform Device
*  @ent  : PCI Device ID List Entry
*/

static int ms_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
{
	int err = 0,nvec = 4;
	int i = 0;
	unsigned int *ptr_local = NULL;

   printk("Initializing %s \n", pci_name(pdev));

	/*Enable PCIe endpoint device */
 	err = pci_enable_device(pdev);
	if (err) {
		printk("pci_enable_device() failed, err \n");
		return err;
	}

	pciData = kzalloc(sizeof(struct privData), GFP_KERNEL);
	if (pciData == NULL) {
		printk("Unable to allocate memory for PCI resource\n");
		pci_disable_device(pdev);
		return err;
	}

	/*
	* Enable bus-mastering on device.
	*/
	pci_set_master(pdev);


	/*
	* Check for PCI resources
	*/

	err = pci_request_regions(pdev, "/dev/MS_PCI_DEV");

	if (err) {
		printk("Cannot obtain PCI resources :%d\n", err);
		kfree(pciData);
    pci_disable_device(pdev);
		return err;
	}


	pciData->barInfo[0].baseVAddr = pci_iomap(pdev, 0, 0);

	if(pciData->barInfo[0].baseVAddr == NULL) {
		printk(KERN_INFO "Unable to map BAR #0 address");
  }

	pciData->barInfo[2].baseVAddr  = pci_iomap(pdev, 2, 0);

	if(pciData->barInfo[2].baseVAddr == NULL) {
		printk(KERN_INFO "Unable to map BAR #2 address");
  }
//For Interrupts allocation
	nvec = pci_alloc_irq_vectors(pdev,1,nvec,PCI_IRQ_MSI);
	if(nvec < 0)
	{
		printk("unable to allocate irq 0x%x\n", pdev->irq);
	}
	printk("nvec = %d\n",nvec);
	printk("request irg:%d\n", pdev->irq);

	for(i = 0;i<nvec;i++)
	{
		if(request_irq(pdev->irq+i, ms_pci_interrupt, IRQF_SHARED, DRV_NAME, pdev)) {

			printk("unable to register irq 0x%x\n", pdev->irq);
		}
	}

	pciData->pdev=pdev;

	 /* Save private data pointer in device structure */
	pci_set_drvdata(pdev, pciData);

	ptr_local = (unsigned int *)pciData->barInfo[0].baseVAddr;

	if(pciData->barInfo[0].baseVAddr != NULL)
	{
		//For MSI
		*(ptr_local + G5_MSI_MASK_OFFSET) = G5_MSI_MASK_VAL;
		*(ptr_local +  G5_ISTATUS_HOST) = 0xffffffff;
	}

	Devdetect = TRUE;

	return PCI_SUCCESS;
}

/**
* ms_pci_remove() - Uninitialize the PCIe device
*
*  @pdev : Platform Device
*/
static void ms_pci_remove(struct pci_dev *pdev)
{
	printk("in ms_pci_remove");
 	pci_clear_master(pdev);
	pci_release_regions(pdev);
	pci_disable_device(pdev);

	for(i = 0;i<4;i++)
	{
		free_irq(pdev->irq+i, pdev);
	}

	pci_set_drvdata(pdev, NULL);
	kfree(pciData);
}

static struct pci_driver ms_pci_driver = {
        .name           = DRV_NAME,
        .probe          = ms_pci_probe,
        .remove         = ms_pci_remove,
        .id_table       = ms_pci_tbl,
};

/**
* char_dev_open() - Open Char Device
*
*  @inode : Device Driver Information
*  @file  : Pointer to the file struct
*/
static int char_dev_open(struct inode *inode,
			    struct file  *file)
{
	printk("open operation invoked \n");
	return SUCCESS;
}

/**
* char_dev_release() - Release Char Device
*
*  @inode : Device Driver Information
*  @file  : Pointer to the file struct
*/

static int char_dev_release(struct inode *inode,
		            struct file *file)
{
	printk("close operation invoked \n");
	return SUCCESS;
}

#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,35))
static int char_dev_ioctl(struct inode *i, struct file *f, unsigned int cmd, unsigned long arg)
#else
static long char_dev_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
#endif
{
	int ret = 0,size = 0,bar = 0;
	struct config_bar local_cf;
	struct config_info local_info;
	u8 cap_ptr;
	u16 config_read = 0;
	struct device_info lmdev;
	struct isr_count local_isr;
	struct pci_config local_config;
	unsigned int *ptr_local = NULL;

    switch (cmd)
    {
		case MPCI_IOCBAR_WRITE:
			printk("in MPCI_IOCBAR_WRITE \n" );
			if (copy_from_user( &local_cf,(struct config_bar *)arg, sizeof(struct config_bar)))
			{
				return -EACCES;
			}
			printk("in MPCI_IOCBAR_WRITE bar    = %lu \n",local_cf.bar );
			printk("in MPCI_IOCBAR_WRITE offest = %lu \n",local_cf.offset );
			printk("in MPCI_IOCBAR_WRITE val    = %lu \n",local_cf.val );


			ptr_local = (unsigned int *)pciData->barInfo[local_cf.bar].baseVAddr;
			*(ptr_local + local_cf.offset) = local_cf.val;

		break;
		case MPCI_IOCBAR_READ:
			printk("in MPCI_IOCBAR_READ \n" );
			if (copy_from_user( &local_cf,(struct config_bar *)arg, sizeof(struct config_bar)))
			{
				return -EACCES;
			}
			printk("in MPCI_IOCBAR_WRITE bar    = %lu \n",local_cf.bar );
			printk("in MPCI_IOCBAR_WRITE offest = %lu \n",local_cf.offset );
			printk("in MPCI_IOCBAR_WRITE val    = %lu \n",local_cf.val );

			ptr_local = (unsigned int *)pciData->barInfo[local_cf.bar].baseVAddr;

			local_cf.val = *(ptr_local + local_cf.offset);

			ret = copy_to_user ((struct config_bar *)arg,&local_cf,sizeof(struct config_bar));
			printk(KERN_INFO "ret = %d\n",ret);

		break;
		case MPCI_IOCCONFIG_WRITE:
			printk("in MPCI_IOCCONFIG_WRITE \n" );
			break;
		case MPCI_IOCCONFIG_READ:
			printk("in MPCI_IOCCONFIG_READ \n" );

			if (copy_from_user( &local_info,(struct config_info *)arg, sizeof(local_info)))
			{
				return -EACCES;
			}

			if(local_info.val_16)
			{

				pci_read_config_word(pciData->pdev, local_info.offset,&config_read);
                        	local_info.val_16 = config_read;
			}
			if(local_info.val_32)
			{

				pci_read_config_dword(pciData->pdev, local_info.offset,&local_info.val_32);
                        	//local_info.val_32 = config_read;
			}
			printk("PCI driver local_info.offset = %x\n", local_info.val_16);
			printk("PCI driver local_info.offset = %x\n", local_info.val_32);
			ret = copy_to_user ((struct config_info *)arg,&local_info,sizeof(local_info));

		break;
		case MPCI_IOCCONFIG_READ_ALL:
			printk("in MPCI_IOCCONFIG_READ \n" );

			if (copy_from_user( &local_config,(struct pci_config *)arg, sizeof(local_config)))
			{
				return -EACCES;
			}


			pci_read_config_word(pciData->pdev, PCI_VENDOR_ID, &local_config.VendorID);

			pci_read_config_word(pciData->pdev, PCI_DEVICE_ID, &local_config.DeviceID);

			pci_read_config_word(pciData->pdev, PCI_COMMAND, &local_config.Command);

			pci_read_config_word(pciData->pdev, PCI_STATUS, &local_config.Status);

			pci_read_config_dword(pciData->pdev,PCI_REVISION_ID, &local_config.RevisionID);

			pci_read_config_byte(pciData->pdev, PCI_CLASS_PROG, &local_config.Clase_prog);

			pci_read_config_word(pciData->pdev, PCI_CLASS_DEVICE, &local_config.Class_device);

			pci_read_config_byte(pciData->pdev, PCI_CACHE_LINE_SIZE, &local_config.CacheLineSize);

			pci_read_config_byte(pciData->pdev, PCI_LATENCY_TIMER, &local_config.LatencyTimer);

			pci_read_config_byte(pciData->pdev, PCI_HEADER_TYPE, &local_config.HeaderType);

			pci_read_config_byte(pciData->pdev, PCI_BIST, &local_config.BIST);

			pci_read_config_dword(pciData->pdev, PCI_BASE_ADDRESS_0, &local_config.BaseAddresses[0]);
			printk("PCI driver local_info.BaseAddresses = %x\n", local_config.BaseAddresses[0]);
			pci_read_config_dword(pciData->pdev, PCI_BASE_ADDRESS_1, &local_config.BaseAddresses[1]);
			printk("PCI driver local_info.BaseAddresses = %x\n", local_config.BaseAddresses[1]);
			pci_read_config_dword(pciData->pdev, PCI_BASE_ADDRESS_2, &local_config.BaseAddresses[2]);
			printk("PCI driver local_info.BaseAddresses = %x\n", local_config.BaseAddresses[2]);
			pci_read_config_dword(pciData->pdev, PCI_BASE_ADDRESS_3, &local_config.BaseAddresses[3]);
			printk("PCI driver local_info.BaseAddresses = %x\n", local_config.BaseAddresses[3]);
			pci_read_config_dword(pciData->pdev, PCI_BASE_ADDRESS_4, &local_config.BaseAddresses[4]);
			printk("PCI driver local_info.BaseAddresses = %x\n", local_config.BaseAddresses[4]);
			pci_read_config_dword(pciData->pdev, PCI_BASE_ADDRESS_5, &local_config.BaseAddresses[5]);
			printk("PCI driver local_info.BaseAddresses = %x\n", local_config.BaseAddresses[5]);


			pci_read_config_dword(pciData->pdev, PCI_CARDBUS_CIS, &local_config.CIS);

			pci_read_config_word(pciData->pdev, PCI_SUBSYSTEM_VENDOR_ID, &local_config.Sub_VID);

			pci_read_config_word(pciData->pdev, PCI_SUBSYSTEM_ID, &local_config.Sub_DID);

			pci_read_config_dword(pciData->pdev, PCI_ROM_ADDRESS, &local_config.ROMBaseAddress);

			pci_read_config_byte(pciData->pdev, PCI_INTERRUPT_LINE, &local_config.IRQ_Line);

			pci_read_config_byte(pciData->pdev, PCI_INTERRUPT_PIN, &local_config.IRQ_Pin);

			pci_read_config_byte(pciData->pdev, PCI_MIN_GNT, &local_config.Min_Gnt);

			pci_read_config_byte(pciData->pdev, PCI_MAX_LAT, &local_config.Max_Lat);

			//For MSI
			cap_ptr = pci_find_capability(pciData->pdev,PCI_CAP_ID_MSI);

			pci_read_config_word(pciData->pdev, cap_ptr + PCI_MSI_FLAGS,(u16 *) &local_config.MessageControl);

			printk("MSIEnable = %x\n", local_config.MessageControl.MSIEnable);
			printk("MultipleMessageCapable = %x\n", local_config.MessageControl.MultipleMessageCapable);
			printk("PCI_MSI_FLAGS = %x\n", local_config.MessageControl.MultipleMessageEnable);

			//local_config.MessageControl =( config_read;


			printk("PCI driver Vendor ID = %x\n", local_config.VendorID);
			printk("PCI driver Device ID = %x\n", local_config.DeviceID);

			ret = copy_to_user ((struct pci_config *)arg,&local_config,sizeof(struct pci_config));


		break;
		case MPCI_IOCDEVICE_INFO:
			printk("in MPCI_IOCDEVICE_INFO \n" );

			if(Devdetect == TRUE)
			{
				lmdev.device_status = TRUE;
			}
			else
			{
				lmdev.device_status = FALSE;
			}

			lmdev.demo_type = 1;

			lmdev.device_type = POLARFIRE_EVAL;

			size = pci_resource_len(pciData->pdev, 0);

			pci_read_config_dword(pciData->pdev, PCI_BASE_ADDRESS_0, &local_config.BaseAddresses[0]);
			printk("PCI driver local_info.BaseAddresses = %x\n", local_config.BaseAddresses[0]);
			pci_read_config_dword(pciData->pdev, PCI_BASE_ADDRESS_1, &local_config.BaseAddresses[1]);
			printk("PCI driver local_info.BaseAddresses = %x\n", local_config.BaseAddresses[1]);
			pci_read_config_dword(pciData->pdev, PCI_BASE_ADDRESS_2, &local_config.BaseAddresses[2]);
			printk("PCI driver local_info.BaseAddresses = %x\n", local_config.BaseAddresses[2]);
			//bar info
			lmdev.bar0_add =(long) local_config.BaseAddresses[0];
			lmdev.bar0_size =  size;
			lmdev.bar1_add = (long) local_config.BaseAddresses[1];
			lmdev.bar1_size = 0;
			size = pci_resource_len(pciData->pdev, 2);
			lmdev.bar2_add = (long)  local_config.BaseAddresses[2];
			lmdev.bar2_size = size;

			for(i=0; i<MAX_BARS; i++)
			 {
				/* Atleast BAR0 must be there. */
				if ((size = pci_resource_len(pciData->pdev, i)) == 0) {
				continue;
				}
				bar++;
			}

			lmdev.num_bar = bar;

			printk("demo_type = %d\n",lmdev.demo_type);
			printk("device_status = %d \n",lmdev.device_status);
			printk("device_type = %d \n",lmdev.device_type);
			printk("num_bar     = %d\n",lmdev.num_bar);
			printk("bar0_add     = 0x%lx\n",(long )pciData->barInfo[0].baseVAddr);
			printk("bar0_size     = %x\n",lmdev.bar0_size);
			printk("bar2_add     = 0x%lx\n",(long)pciData->barInfo[2].baseVAddr);
			printk("bar2_size     = %x\n",lmdev.bar2_size);


			ret = copy_to_user ((struct device_info *)arg,&lmdev,sizeof(struct device_info));


		break;
		case MPCI_IOCISR_INFO:
			printk("in MPCI_IOCISR_INFO \n" );

			if (copy_from_user( &local_isr,(struct local_isr *)arg, sizeof(local_isr)))
			{
				return -EACCES;
			}

			if( local_isr.isr_type_act == 1)
			{
				local_isr.isr1 = g_isr_count.isr1;
				local_isr.isr2 = g_isr_count.isr2;
				local_isr.isr3 = g_isr_count.isr3;
				local_isr.isr4 = g_isr_count.isr4;

			}
			else if(local_isr.isr_type_act == 2)
			{
				local_isr.isr1 = g_isr_count.isr1 = 0;
				local_isr.isr2 = g_isr_count.isr2 = 0;
				local_isr.isr3 = g_isr_count.isr3 = 0;
				local_isr.isr4 = g_isr_count.isr4 = 0;

			}
			else
			{
				return -EINVAL;
			}
			ret = copy_to_user ((struct local_isr*)arg,&local_isr,sizeof(local_isr));

		break;
		default:
		printk("in default \n" );
		return -EINVAL;
    }

    return 0;
}


static struct file_operations char_dev_fops = {
	.owner = THIS_MODULE,
	.open = char_dev_open,
	.release = char_dev_release,
#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,6,35))
   	.ioctl = char_dev_ioctl,
#else
    .unlocked_ioctl = char_dev_ioctl,
#endif
};

/**
*  pcidrv_init() - Initialize PCIe Module
*
*  Registers Platform Driver
*/

static __init int pcidrv_init(void)
{
	int ret,count=1;

	printk("Module Inserted \n");

	if(pci_register_driver(&ms_pci_driver)){
		printk("unable to register pci driver \n");
		return -1;
	}

	if (alloc_chrdev_region (&ms_pci_dev, 0, count, PCI_DEV_NAME) < 0) {
            printk (KERN_ERR "failed to reserve major/minor range\n");
            return -1;
    	}

	printk("MS_PCI_DEV:  Got Major %d\n", MAJOR(ms_pci_dev));

        if (!(ms_pci_cdev = cdev_alloc ())) {
            printk (KERN_ERR "cdev_alloc() failed\n");
            unregister_chrdev_region (ms_pci_dev, count);
            return -1;
 	}
	cdev_init(ms_pci_cdev,&char_dev_fops);

	ret=cdev_add(ms_pci_cdev,ms_pci_dev,count);
	if( ret < 0 ) {
		printk("Error registering device driver\n");
	        cdev_del (ms_pci_cdev);
                unregister_chrdev_region (ms_pci_dev, count);
		return -1;
	}

	ms_pci_class = class_create (THIS_MODULE, "VIRTUAL");
	device_create (ms_pci_class, NULL, ms_pci_dev,"%s",PCI_DEV_NAME);

	printk("Successfully created /dev/MS_PCI_DEV\n");

	printk("\nDevice Registered: %s\n",PCI_DEV_NAME);
	printk (KERN_INFO "Major number = %d, Minor number = %d\n", MAJOR (ms_pci_dev),MINOR (ms_pci_dev));

	return 0;
}

/**
* pcidrv_cleanup() - Uninitialize the PCIe Module
*
*  Unregister the Platform Driver
*/

static __exit void  pcidrv_cleanup(void)
{
	printk("Module Deleted \n");
	pci_unregister_driver (&ms_pci_driver);
        device_destroy (ms_pci_class, ms_pci_dev);
        class_destroy (ms_pci_class);
 	cdev_del(ms_pci_cdev);
	unregister_chrdev_region(ms_pci_dev,1);
	printk("\n Driver unregistered \n");
}

module_init(pcidrv_init);
module_exit(pcidrv_cleanup);

MODULE_AUTHOR("Durga Prasad");
MODULE_DESCRIPTION("PolarFire PCI Endpoint Device Driver");
MODULE_LICENSE("GPL");
