#include <linux/init.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/fs.h>
#include <linux/errno.h>
#include <linux/mm.h>
#include <linux/sched.h>
#include <linux/init.h>
#include <linux/cdev.h>
#include <linux/pci.h>
#include <linux/interrupt.h>
#include <asm/io.h>

#include <asm/uaccess.h>
#include <asm/cacheflush.h>

typedef unsigned char U8;
typedef unsigned short U16;
typedef unsigned long U32;

struct bar_t {
	void *base;
	unsigned long len;
};

static struct pci_ccore_dev_t
{
	// constant fields
	struct cdev cdev;
	dev_t dev_no;
	loff_t size;
	struct pci_dev *pci_dev;
	// volatile fields
	loff_t pos;
	void *buf;
	void *exbuf[16];
	struct bar_t bar[6];
	struct fasync_struct *async_queue;  
} pci_ccore_dev;





static unsigned int param_page_cnt = 1024;
static unsigned int param_vendor = 0x11aa;
static unsigned int param_device = 0x11aa;


static unsigned int param_exbuf_cnt = 0;
static unsigned int param_ioctl_log = 0;
static char *param_irq_sign = "pci_ccore_irq";
static char *param_irq_id = "pci_ccore_irq_id";
#define DRIVER_NAME "pcie_ccore"

static struct class *pcie_class;

static loff_t pci_ccore_llseek(struct file *filp, loff_t pos, int arg)
{
	printk(KERN_INFO "pci_ccore_llseek is called\n");

	switch (arg) {
	case SEEK_SET:
		pci_ccore_dev.pos = 0 + pos;
		break;
	case SEEK_CUR:
		pci_ccore_dev.pos = pci_ccore_dev.pos + pos;
		break;
	case SEEK_END:
		pci_ccore_dev.pos = pci_ccore_dev.size + pos;
		break;
	default:
		printk(KERN_INFO "pci_ccore_llseek: bad path\n");
		return -EINVAL;
	}

	if (pci_ccore_dev.pos < 0)
		pci_ccore_dev.pos = 0;
	else if (pci_ccore_dev.pos > pci_ccore_dev.size)
		pci_ccore_dev.pos = pci_ccore_dev.size;

	printk(KERN_INFO "pci_ccore_llseek: current position is %lld\n", pci_ccore_dev.pos);
	return pci_ccore_dev.pos;
}

static ssize_t pci_ccore_read(struct file *filp, char __user *buf, size_t count, loff_t *f_pos)
{
	int j;

	printk(KERN_INFO "pci_ccore_read is called\n");

	count = (count < pci_ccore_dev.size - pci_ccore_dev.pos) ? count : (pci_ccore_dev.size - pci_ccore_dev.pos);
	j = raw_copy_to_user(buf, (u8 *) pci_ccore_dev.buf + pci_ccore_dev.pos, count);
	if (j)
		printk(KERN_INFO "pci_ccore_read: %d bytes are not copied to user\n", j);
	else
		printk(KERN_INFO "pci_ccore_read: copy_to_user succeeds\n");
	pci_ccore_llseek(filp, count - j, SEEK_CUR);

	return count - j;
}

static ssize_t pci_ccore_write(struct file *filp, const char __user *buf, size_t count, loff_t *f_pos)
{
	int j;

	printk(KERN_INFO "pci_ccore_write is called\n");

	count = (count < pci_ccore_dev.size - pci_ccore_dev.pos) ? count : (pci_ccore_dev.size - pci_ccore_dev.pos);
	j = raw_copy_from_user((u8 *) pci_ccore_dev.buf + pci_ccore_dev.pos, buf, count);
	if (j)
		printk(KERN_INFO "pci_ccore_write: %d bytes are not copied from user\n", j);
	else
		printk(KERN_INFO "pci_ccore_write: copy_from_user succeeds\n");
	pci_ccore_llseek(filp, j, SEEK_CUR);

	return count - j;
}

static int pci_ccore_exbuf_alloc(void)
{
	int i;

	for (i = 0; i < param_exbuf_cnt; i++) {
		pci_ccore_dev.exbuf[i] = kmalloc(pci_ccore_dev.size, GFP_KERNEL);
		if (!pci_ccore_dev.exbuf[i]) {
			printk(KERN_INFO "pci_ccore_open: failed to do kmalloc for exbuf[%d]\n", i);
			return -ENOMEM;
		} else {

			printk(KERN_INFO "pci_ccore_open: %u pages are allocated at (virt) 0x%lx (phy) %lx\n", param_page_cnt, (unsigned long) pci_ccore_dev.exbuf[i], (unsigned long) virt_to_phys(pci_ccore_dev.exbuf[i]));
		}
	}

	return 0;
}

static void pci_ccore_exbuf_free(void)
{
	int i;

	for (i = 0; i < param_exbuf_cnt; i++) {
		if (pci_ccore_dev.exbuf[i]) {

			kfree(pci_ccore_dev.exbuf[i]);
			printk(KERN_INFO "pci_ccore_release: %u pages are released at (virt) 0x%lx (phy) 0x%lx\n", param_page_cnt, (unsigned long) pci_ccore_dev.exbuf[i], (unsigned long) virt_to_phys(pci_ccore_dev.exbuf[i]));
		}
	}
}

static int pcie_fasync(int fd,struct file *filp,int mode)
{

    return fasync_helper(fd,filp,mode,&pci_ccore_dev.async_queue);
}


static int pci_ccore_release(struct inode *inode, struct file *filp)
{
	int i;

	printk(KERN_INFO "pci_ccore_release is called\n");
	u8 *uc = pci_ccore_dev.buf;

	printk(KERN_INFO "pci_ccore_release is called\n");
	
	for (i = 0; i < 128; i++) {
		printk(KERN_INFO "read from release pci_ccore_dev.buf[%x] =  0x%x\n", i, uc[i]);		
	}
	
	for (i = 0; i < sizeof(pci_ccore_dev.bar) / sizeof(struct bar_t); i++) {
		if (pci_ccore_dev.bar[i].base) {
			printk(KERN_INFO "pci_ccore_release: iounmap(bar%d): (phy) 0x%lx -> (virt) 0x%lx\n", i, (unsigned long) pci_resource_start(pci_ccore_dev.pci_dev, i), (unsigned long) pci_ccore_dev.bar[i].base);
			iounmap(pci_ccore_dev.bar[i].base);
		}
	}

	if (pci_ccore_dev.buf) {

		kfree(pci_ccore_dev.buf);
		printk(KERN_INFO "pci_ccore_release: %u pages are released at (virt) 0x%lx (phy) 0x%lx\n", param_page_cnt, (unsigned long) pci_ccore_dev.buf, (unsigned long) virt_to_phys(pci_ccore_dev.buf));
	}

	pci_ccore_exbuf_free();

	pcie_fasync(-1,filp,0); 

	return 0;
}

static int pci_ccore_open(struct inode *inode, struct file *filp)
{
	int i;
    u8 *uc;
	printk(KERN_INFO "pci_ccore_open is called\n");

	if ((i = pci_ccore_exbuf_alloc()) != 0) {
		printk(KERN_INFO "pci_ccore_open: failed to allocate extra buffers\n");
		pci_ccore_exbuf_free();
		return i;
	}

	pci_ccore_dev.pos = 0;

	pci_ccore_dev.buf = kmalloc(pci_ccore_dev.size, GFP_KERNEL);
	if (!pci_ccore_dev.buf) {
		printk(KERN_INFO "pci_ccore_open: failed to do kmalloc for buf\n");
		pci_ccore_exbuf_free();
		return -ENOMEM;
	} 

	printk(KERN_INFO "pci_ccore_open: %u pages are allocated at (virt) 0x%lx (phy) %lx\n", param_page_cnt, (unsigned long) pci_ccore_dev.buf, (unsigned long) virt_to_phys(pci_ccore_dev.buf));

	for (i = 0; i < sizeof(pci_ccore_dev.bar) / sizeof(struct bar_t); i++) {
		pci_ccore_dev.bar[i].len = pci_resource_len(pci_ccore_dev.pci_dev, i);
		if (pci_ccore_dev.bar[i].len > 0) {
			pci_ccore_dev.bar[i].base = ioremap_nocache(pci_resource_start(pci_ccore_dev.pci_dev, i), pci_ccore_dev.bar[i].len);
			if (!pci_ccore_dev.bar[i].base) {
				printk(KERN_INFO "pci_ccore_open: failed to do ioremap_nocache for bar%d\n", i);
		
				kfree(pci_ccore_dev.buf);
				pci_ccore_exbuf_free();
				return -ENOMEM;
			}
			printk(KERN_INFO "pci_ccore_open: ioremap_nocache(bar%d): (phy) 0x%lx -> (virt) 0x%lx\n", i, (unsigned long) pci_resource_start(pci_ccore_dev.pci_dev, i), (unsigned long) pci_ccore_dev.bar[i].base);
		}
	}

	return 0;
}



static int pci_ccore_mmap(struct file *filp, struct vm_area_struct *vma)
{
	printk(KERN_INFO "pci_ccore_mmap is called\n");
    int i;
	if (vma->vm_end - vma->vm_start > pci_ccore_dev.size)
		return -EINVAL;

	vma->vm_ops = NULL;

	vma->vm_flags |= (VM_DONTEXPAND | VM_DONTDUMP);
	vma->vm_flags |= VM_IO;
	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
    

	if (remap_pfn_range(vma, vma->vm_start, virt_to_phys(pci_ccore_dev.buf) >> PAGE_SHIFT, vma->vm_end - vma->vm_start, vma->vm_page_prot)) {
		printk(KERN_INFO "pci_ccore_mmap fails\n");
		return -EAGAIN;
	} else {
		printk(KERN_INFO "pci_ccore_mmap succeeds\n");
		
	}
	
	u8 *uc = pci_ccore_dev.buf;
	printk(KERN_INFO "pci_ccore_release is called\n");

	return 0;

}

static inline long do_config_space(unsigned int dir, unsigned int size, unsigned int *arg)
{
	unsigned int off, val;
	
	
	get_user(off, arg + 0);
	if (off >= 0x4000) {
		printk(KERN_INFO "pci_ccore_ioctl: offset = 0x%x exceeds maximum 0x4000 @cfg_space\n", off);
		return -EINVAL;
	} else if ((off % size) != 0) {
		printk(KERN_INFO "pci_ccore_ioctl: offset is not aligned\n");
		return -EINVAL;
	}
	
	printk(KERN_INFO "pci_ccore_ioctl cfg_space: offset = 0x%x exceeds maximum 0x4000 @\n", off);

	if (dir == _IOC_WRITE) {
		get_user(val, arg + 1);
		switch (size) {
		case 1:
			pci_write_config_byte(pci_ccore_dev.pci_dev, off, val & 0x000000ff);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u8) 0x%x is written to 0x%x@cfg_space\n", val & 0x000000ff, off);
			break;
		case 2:
			pci_write_config_word(pci_ccore_dev.pci_dev, off, val & 0x0000ffff);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u16) 0x%x is written to 0x%x@cfg_space\n", val & 0x0000ffff, off);
			break;
		case 4:
			pci_write_config_dword(pci_ccore_dev.pci_dev, off, val & 0xffffffff);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u32) 0x%x is written to 0x%x@cfg_space\n", val & 0xffffffff, off);
			break;
		default:
			printk(KERN_INFO "pci_ccore_ioctl: bad size in cmd\n");
			return -EINVAL;
		}
		return 0;
	} else if (dir == _IOC_READ) {
		val = 0x00000000;
		switch (size) {
		case 1:
			pci_read_config_byte(pci_ccore_dev.pci_dev, off, (u8 *) &val);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u8) 0x%x is read from 0x%x@cfg_space\n", val, off);
			break;
		case 2:
			pci_read_config_word(pci_ccore_dev.pci_dev, off, (u16 *) &val);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u16) 0x%x is read from 0x%x@cfg_space\n", val, off);
			break;
		case 4:
			pci_read_config_dword(pci_ccore_dev.pci_dev, off, (u32 *) &val);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u32) 0x%x is read from 0x%x@cfg_space\n", val, off);
			break;
		default:
			printk(KERN_INFO "pci_ccore_ioctl: bad size in cmd\n");
			return -EINVAL;
		}
		put_user(val, arg + 1);
		return 0;
	} else {
		printk(KERN_INFO "pci_ccore_ioctl: bad direction in cmd\n");
		return -EINVAL;
	}
}

static inline long do_buffer_space(void *p, unsigned int dir, unsigned int size, unsigned int *arg)
{
	unsigned int off, val;

	get_user(off, arg + 0);
	if (off >= pci_ccore_dev.size) {
		printk(KERN_INFO "pci_ccore_ioctl: offset = 0x%x exceeds maximum 0x%llx @buf_space\n", off, pci_ccore_dev.size);
		return -EINVAL;
	} else if ((off % size) != 0) {
		printk(KERN_INFO "pci_ccore_ioctl: offset is not aligned\n");
		return -EINVAL;
	}

	if (dir == _IOC_WRITE) {
		get_user(val, arg + 1);
		switch (size) {
		case 1:
			*((U8 *) ((U8 *) p + off)) = val & 0x000000ff;
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u8) 0x%x is written to (0x%x + 0x%lx)@buf_space\n", val & 0x000000ff, off, (unsigned long) p);
			break;
		case 2:
			*((U16 *) ((U8 *) p + off)) = val & 0x0000ffff;
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u16) 0x%x is written to (0x%x + 0x%lx)@buf_space\n", val & 0x0000ffff, off, (unsigned long) p);
			break;
		case 4:
			*((U32 *) ((U8 *) p + off)) = val & 0xffffffff;
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u32) 0x%x is written to (0x%x + 0x%lx)@buf_space\n", val & 0xffffffff, off, (unsigned long) p);
			break;
		default:
			printk(KERN_INFO "pci_ccore_ioctl: bad size in cmd\n");
			return -EINVAL;
		}
		return 0;
	} else if (dir == _IOC_READ) {
		val = 0x00000000;
		switch (size) {
		case 1:
			val = *((U8 *) ((U8 *) p + off)) & 0x000000ff;
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u8) 0x%x is read from (0x%x + 0x%lx)@buf_space\n", val, off, (unsigned long) p);
			break;
		case 2:
			val = *((U16 *) ((U8 *) p + off)) & 0x0000ffff;
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u16) 0x%x is read from (0x%x + 0x%lx)@buf_space\n", val, off, (unsigned long) p);
			break;
		case 4:
			val = *((U32 *) ((U8 *) p + off)) & 0xffffffff;
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u32) 0x%x is read from (0x%x + 0x%lx)@buf_space\n", val, off, (unsigned long) p);
			break;
		default:
			printk(KERN_INFO "pci_ccore_ioctl: bad size in cmd\n");
			return -EINVAL;
		}
		put_user(val, arg + 1);
		return 0;
	} else {
		printk(KERN_INFO "pci_ccore_ioctl: bad direction in cmd\n");
		return -EINVAL;
	}
}

static inline long do_bar_space(unsigned int idx, unsigned int dir, unsigned int size, unsigned int *arg)
{
	unsigned int off, val;

	get_user(off, arg + 0);
	if (off >= pci_ccore_dev.bar[idx].len) {
		printk(KERN_INFO "pci_ccore_ioctl: offset = 0x%x exceeds maximum 0x%lx @bar%d space\n", off, pci_ccore_dev.bar[idx].len, idx);
		return -EINVAL;
	} else if ((off % size) != 0) {
		printk(KERN_INFO "pci_ccore_ioctl: offset is not aligned\n");
		return -EINVAL;
	}

	if (dir == _IOC_WRITE) {
		get_user(val, arg + 1);
		switch (size) {
		case 1:
			iowrite8(val & 0x000000ff, (u8 *) pci_ccore_dev.bar[idx].base + off);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u8) 0x%x is written to 0x%x@bar%d space\n", val & 0x000000ff, off, idx);
			break;
		case 2:
			iowrite16(val & 0x0000ffff, (u8 *) pci_ccore_dev.bar[idx].base + off);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u16) 0x%x is written to 0x%x@bar%d space\n", val & 0x0000ffff, off, idx);
			break;
		case 4:
			iowrite32(val & 0xffffffff, (u8 *) pci_ccore_dev.bar[idx].base + off);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u32) 0x%x is written to 0x%x@bar%d space\n", val & 0xffffffff, off, idx);
			break;
		default:
			printk(KERN_INFO "pci_ccore_ioctl: bad size in cmd\n");
			return -EINVAL;
		}
		return 0;
	} else if (dir == _IOC_READ) {
		switch (size) {
		case 1:
			val = ioread8((u8 *) pci_ccore_dev.bar[idx].base + off);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u8) 0x%x is read from 0x%x@bar%d space\n", val, off, idx);
			break;
		case 2:
			val = ioread16((u8 *) pci_ccore_dev.bar[idx].base + off);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u16) 0x%x is read from 0x%x@bar%d space\n", val, off, idx);
			break;
		case 4:
			val = ioread32((u8 *) pci_ccore_dev.bar[idx].base + off);
			if (param_ioctl_log)
				printk(KERN_INFO "pci_ccore_ioctl: (u32) 0x%x is read from 0x%x@bar%d space\n", val, off, idx);
			break;
		default:
			printk(KERN_INFO "pci_ccore_ioctl: bad size in cmd\n");
			return -EINVAL;
		}
		put_user(val, arg + 1);
		return 0;
	} else {
		printk(KERN_INFO "pci_ccore_ioctl: bad direction in cmd\n");
		return -EINVAL;
	}
}

static long pci_ccore_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
{
	int idx = _IOC_NR(cmd), pof;
	void *p;
	const int eb_nr = 0x40;

	if (param_ioctl_log)
		printk(KERN_INFO "pci_ccore_ioctl is called: _IOC_NR(cmd) = 0x%x\n", idx);

	if (idx >= eb_nr && idx < eb_nr + param_exbuf_cnt) { // exbuf
		p = pci_ccore_dev.exbuf[idx - eb_nr];
		return do_buffer_space(p, _IOC_DIR(cmd), _IOC_SIZE(cmd), (unsigned int *) arg);
	}

	switch (idx) {
	case 0xff: // config space
		return do_config_space(_IOC_DIR(cmd), _IOC_SIZE(cmd), (unsigned int *) arg);
	case 0xfe: // buffer space
		p = pci_ccore_dev.buf;
		return do_buffer_space(p, _IOC_DIR(cmd), _IOC_SIZE(cmd), (unsigned int *) arg);
	case 0x14:
		get_user(pof, ((unsigned int *) arg) + 1);
		if (pof >= 0 && pof < param_exbuf_cnt) {
			put_user((unsigned int) virt_to_phys(pci_ccore_dev.exbuf[pof]), ((unsigned int *) arg) + 1);
			return 0;
		} else {
			put_user(0x00000000, ((unsigned int *) arg) + 1);
			return -EINVAL;
		}
	case 0x10:
		put_user((unsigned int) virt_to_phys(pci_ccore_dev.buf), ((unsigned int *) arg) + 1);
		return 0;
	case 0x11:
		put_user((unsigned int) pci_ccore_dev.size, ((unsigned int *) arg) + 1);
		return 0;
	case 0x12:
		put_user((unsigned int) pci_ccore_dev.pci_dev->irq, ((unsigned int *) arg) + 1);
		return 0;
	case 0x13:
		put_user(pci_find_capability(pci_ccore_dev.pci_dev, *(((unsigned int *) arg))), ((unsigned int *) arg) + 1);
		return 0;
	case 0x15:
		put_user(param_exbuf_cnt, ((unsigned int *) arg) + 1);
		return 0;
	case 0x16:
		put_user((unsigned int) virt_to_phys(pci_ccore_dev.buf), ((unsigned int *) arg));
		put_user((unsigned int) (virt_to_phys(pci_ccore_dev.buf) >> 32), ((unsigned int *) arg) + 1);
		return 0;
	case 0x17:
		put_user((unsigned int) pci_resource_start(pci_ccore_dev.pci_dev, 0), ((unsigned int *) arg));
		return 0;
	case 0x18:
		put_user((unsigned int) pci_resource_start(pci_ccore_dev.pci_dev, 1), ((unsigned int *) arg));
		return 0;
	case 0x19:
		put_user((unsigned int) pci_resource_start(pci_ccore_dev.pci_dev, 2), ((unsigned int *) arg));
		return 0;
	case 0x20:
		put_user((unsigned int) pci_resource_start(pci_ccore_dev.pci_dev, 3), ((unsigned int *) arg));
		return 0;
	case 0x21:
		put_user((unsigned int) pci_resource_start(pci_ccore_dev.pci_dev, 4), ((unsigned int *) arg));
		return 0;
	case 0x22:
		put_user((unsigned int) pci_resource_start(pci_ccore_dev.pci_dev, 5), ((unsigned int *) arg));
		return 0;

	case 0: // bar0 space
	case 1: // bar1 space
	case 2: // bar2 space
	case 3: // bar3 space
	case 4: // bar4 space
	case 5: // bar5 space
		if (pci_ccore_dev.bar[idx].base) {
			return do_bar_space(idx, _IOC_DIR(cmd), _IOC_SIZE(cmd), (unsigned int *) arg);
		} else {
			printk(KERN_INFO "pci_ccore_ioctl: bar%d is not available\n", idx);
			return -EINVAL;
		}
	default:
		printk(KERN_INFO "pci_ccore_ioctl: bad nr = 0x%x in cmd\n", idx);
		return -ENOTTY;
	}
}

static struct file_operations pci_ccore_fops =
{
	.owner = THIS_MODULE,
	.read = pci_ccore_read,
	.open = pci_ccore_open,
	.release = pci_ccore_release,
	.write = pci_ccore_write,
	.llseek = pci_ccore_llseek,
	.mmap = pci_ccore_mmap,
	.unlocked_ioctl = pci_ccore_ioctl,
	.fasync  = pcie_fasync,
};

static irqreturn_t pci_ccore_isr(int irq, void *dev_id)
{
	if(pci_ccore_dev.async_queue)
	{
		kill_fasync(&pci_ccore_dev.async_queue,SIGIO,POLL_IN);
		printk(KERN_INFO "kill fasync!\n");
	}
	
	printk(KERN_INFO "pci_ccore_isr is called\n");
	return irq == pci_ccore_dev.pci_dev->irq ? IRQ_HANDLED : IRQ_NONE;
}

static int pci_ccore_probe(struct pci_dev *pci_dev, const struct pci_device_id *pci_id)
{
	int ret, i;

	printk(KERN_INFO "pci_ccore_probe is called\n");

	if (!!(ret = pci_enable_device(pci_dev))) {
		printk(KERN_INFO "pci_ccore_probe: failed to enable device pci_ccore\n");
		return ret;
	}
	if (!pci_dev_msi_enabled(pci_dev)) {
		if (!!(ret = pci_enable_msi(pci_dev))) {
			printk(KERN_INFO "pci_ccore_probe: failed to enable msi of pci_ccore\n");
			pci_disable_device(pci_dev);
			return ret;
		}
	}
	if (!!(ret = request_irq(pci_dev->irq, pci_ccore_isr, 46, param_irq_sign, param_irq_id))) {
		printk(KERN_INFO "pci_ccore_probe: failed to do request_irq\n");
		pci_disable_msi(pci_dev);
		pci_disable_device(pci_dev);
		return ret;
	}

	memset(&pci_ccore_dev, 0x00, sizeof(pci_ccore_dev));
	pci_ccore_dev.pci_dev = pci_dev;
	pci_ccore_dev.size = PAGE_SIZE * param_page_cnt;

	cdev_init(&pci_ccore_dev.cdev, &pci_ccore_fops);
	pci_ccore_dev.cdev.owner = THIS_MODULE;
	if (!!(ret = alloc_chrdev_region(&(pci_ccore_dev.dev_no), 0, 1, "ccore's pcie device"))) {
		printk(KERN_INFO "pci_ccore_probe: failed to do alloc_chrdev_region\n");
		free_irq(pci_dev->irq, param_irq_id);
		pci_disable_msi(pci_dev);
		pci_disable_device(pci_dev);
	}
	if (!!(ret = cdev_add(&(pci_ccore_dev.cdev), pci_ccore_dev.dev_no, 1))) {
		printk(KERN_INFO "pci_ccore_probe: failed to do cdev_add\n");
		unregister_chrdev_region(pci_ccore_dev.dev_no, 1);
		free_irq(pci_dev->irq, param_irq_id);
		pci_disable_msi(pci_dev);
		pci_disable_device(pci_dev);
		return ret;
	}

	pcie_class = class_create(THIS_MODULE,"pcie_ccore");

	if(IS_ERR(pcie_class)){
		printk(KERN_INFO "pci_ccore_probe is IS_ERR\n");
		return ret;
	}

   	device_create(pcie_class,NULL,pci_ccore_dev.dev_no,NULL,"pcie""%d",1);

	printk(KERN_INFO "pci_ccore_probe: vendor = 0x%x, device = 0x%x\n", (unsigned int) pci_dev->vendor, (unsigned int) pci_dev->device);
	printk(KERN_INFO "pci_ccore_probe: major = %u, minor = %u\n", (unsigned int) (MAJOR(pci_ccore_dev.dev_no)), (unsigned int) (MINOR(pci_ccore_dev.dev_no)));
	for (i = 0; i < sizeof(pci_ccore_dev.bar) / sizeof(struct bar_t); i++)
		printk(KERN_INFO "pci_ccore_probe: bar%d: base = 0x%lx, length = 0x%lx, flag = 0x%lx\n", i, (unsigned long) pci_resource_start(pci_dev, i), (unsigned long) pci_resource_len(pci_dev, i), (unsigned long) pci_resource_flags(pci_dev, i));

	return 0;
}

static void pci_ccore_remove(struct pci_dev *pdev)
{
	printk(KERN_INFO "pci_ccore_remove is called\n");

	device_destroy(pcie_class,pci_ccore_dev.dev_no);
	class_destroy(pcie_class);
	cdev_del(&pci_ccore_dev.cdev);
	unregister_chrdev_region(pci_ccore_dev.dev_no, 1);
	free_irq(pdev->irq, param_irq_id);
	pci_disable_msi(pdev);
	pci_disable_device(pdev);
}

static struct pci_device_id pci_ccore_pci_tbl [] __initdata = {
	{PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
	{0}
};

MODULE_DEVICE_TABLE(pci, pci_ccore_pci_tbl);

static struct pci_driver pci_ccore_pci_driver = {
	name: DRIVER_NAME,
	id_table: pci_ccore_pci_tbl,
	probe: pci_ccore_probe,
	remove: pci_ccore_remove,
};

static int __init pci_ccore_init(void)
{
	int err;

	printk(KERN_INFO "pci_ccore_init is called\n");

	if (param_exbuf_cnt > 16) {
		printk(KERN_INFO "pci_ccore_init: param_exbuf_cnt should not be greater than 16\n");
		return -EINVAL;
	}

	pci_ccore_pci_tbl[0].vendor = param_vendor;
	pci_ccore_pci_tbl[0].device = param_device;

	err = pci_register_driver(&pci_ccore_pci_driver);
	if (err)
		printk(KERN_INFO "pci_ccore_init: failed to do pci_register_driver, error = %d\n", err);
	else
		printk(KERN_INFO "pci_ccore_init: success to do pci_register_driver, error = %d\n", err);
	return err;
}

static void __exit pci_ccore_exit(void)
{
	printk(KERN_INFO "pci_ccore_exit is called\n");
	pci_unregister_driver(&pci_ccore_pci_driver);
}

module_init(pci_ccore_init);
module_exit(pci_ccore_exit);

module_param(param_page_cnt, uint, S_IRUGO | S_IWUSR);
module_param(param_vendor, uint, S_IRUGO | S_IWUSR);
module_param(param_device, uint, S_IRUGO | S_IWUSR);
module_param(param_exbuf_cnt, uint, S_IRUGO | S_IWUSR);
module_param(param_ioctl_log, uint, S_IRUGO | S_IWUSR);
module_param(param_irq_sign, charp,  S_IRUGO | S_IWUSR);
module_param(param_irq_id, charp,  S_IRUGO | S_IWUSR);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("CCore");
MODULE_DESCRIPTION("Polarfire PCIe End Point device driver");
MODULE_VERSION("v1.0");
