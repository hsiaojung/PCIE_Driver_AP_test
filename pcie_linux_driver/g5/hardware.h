/*******************************************************************************
 * (c) Copyright 2017-2018 Microsemi SoC Products Group. All rights reserved.
 *
 * File : Hardware.h
 *
 * Description : //Specific to hardware registers and design
 *
********************************************************************************/

#define G5_ECC_DISABLE_OFFSET        0x280E //0xA038  //ECC disable
#define G5_SEC_ERROR_INT_OFFSET      0x280A //0xA028  //SEC_ERROR_INT  clear
#define G5_DED_ERROR_INT_OFFSET      0x280C //0xA030  //DED_ERROR_INT clear
#define G5_PCIE_EVENT_INT_OFFSET     0x2853 //0xA14c  //PCIE_EVENT_INT clear
#define G5_MSI_MASK_OFFSET           0x2062 //0x8188  //MSI MASK
#define G5_MSI_MASK_CLEAR            0x2063 //0x818c  //MSI MASK clear
#define G5_DMA_IMASK_OFFSET			 0x2060	//0x8180
#define G5_DMA_ISTATUS_LOCAL_OFFSET  0x2061 //0x8184  //ISTATUS_LOCAL
#define G5_DMA_IMASK_HOST_OFFSET	 0x2062 //0x8188  //IMASK_HOST
#define G5_ISTATUS_HOST			 0x2063 //0x818c ISTATUS_HOST


#define G5_ECC_DISABLE_VAL			0x0F000000 //ECC disable
#define G5_SEC_ERROR_INT_VAL		0x0000FFFF //SEC_ERROR_INT  clear
#define G5_DED_ERROR_INT_VAL        0x0000FFFF //DED_ERROR_INT clear
#define G5_PCIE_EVENT_INT_VAL       0x00070007 //PCIE_EVENT_INT clear
#define G5_MSI_MASK_VAL				0xFF0000FF //MSI


#define LED_GLOW_REG_OFFSET 0x8 /* Led Offset */
#define DIP_SWITCH_STATUS_REGISTER 0x10 /* Dip Switch Offset */
#define INTERRUPT_OFFSET 0x52

/* Device Serial Number Offset Value */
#define DSN_CTRL_OFFSET 0x28
#define DSN_CTRL_VALUE 0x100 /* Bit 8 set */
#define DSN_STATUS_OFFSET 0x24
#define DSN_STATUS_VALUE 0x4 /* Bit 4 set */

#define dsnOffset0 0x2010
#define dsnOffset1 0x2011
#define dsnOffset2 0x2012
#define dsnOffset3 0x2013
