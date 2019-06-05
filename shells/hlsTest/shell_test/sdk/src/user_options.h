#ifndef USER_OPTIONS_H_
#define USER_OPTIONS_H_

/*******************************************************************************
 *  USER OPTIONS
*******************************************************************************/

//                              Common Options

// max number of unique simultaneous connections to maintain
#define MAX_PCBS 10

// uncomment to enable IP mode, comment to enable Ethernet mode
#define IP_MODE

// Address of the M_AXI_CONTROL memory interface in the shell
#define M_AXI_CONTROL 0x83C00000

// Addresses to use for this FPGA 
#define MAC_ADDRESS 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02
#define IP_ADDRESS 192, 168, 1, 10
#define IP_MASK 255, 255, 255, 0
#define IP_GATEWAY 192, 168, 1, 1

// This macro is called prior to starting. Place any application specific 
// commands here as needed
//? set shell_test mode followed by tdest
#define APP_OFFSET 0x8000
#define INITIALIZE_APP \
    Xil_Out16(M_AXI_CONTROL + APP_OFFSET + 0x10, 0); \
	Xil_Out8(M_AXI_CONTROL + APP_OFFSET + 0x20, 0);

//                                IP Options

// Address of the memory containing the IP addresses
#define IP_MEM_ADDR (M_AXI_CONTROL + 0)

// Port to use during IP mode
#define PORT 7

// Number of IPs to open TCP connections to. This should <= MAX_PCBS
#define MAX_IPS 2

// TDEST indices of the addresses to open connections to. Must be equal to MAX_IPS
#define CONNECT_IPS 0, 1

//                             Ethernet Options

// Address of the memory containing the MAC addresses
#define MAC_MEM_ADDR (M_AXI_CONTROL + 0x1000)

// Ethertype to use during Ethernet mode. Changing this requires recompiling LWIP
#define ETHTYPE_CUSTOM 0x80cb
#define ETHTYPE_CUSTOM_REV 0xcb80

//                             Hardware Options

// Upper offset of the memory region for one set of BDs
#define BD_BASE_ADDR 0x40000000
#define MEM_REGION_BD_SIZE 0x0000FFF

// Size of BD buffer in bytes. Since we're not handling the case if a BD contains 
// part a packet, this size must be larger than the largest single packet that 
// may be sent
#define BD_BUFFER_SIZE 2048

// Base address for one set of rx/tx buffers at an arbitrary offset
#define MEM_BASE_ADDR (XPAR_PS7_DDR_0_S_AXI_BASEADDR + 0x1000000)

// Upper offset of the memory region for one set of rx/tx buffers. 0x2000 can 
// hold 2048 32-bit words 
#define MEM_REGION_BUF_SIZE 0x0001FFF

// device IDs should come from xparameters.h
#define DMA_DEV_ID XPAR_AXIDMA_0_DEVICE_ID
#define XScuGic_DEVICE_ID XPAR_SCUGIC_SINGLE_DEVICE_ID

// Interrupt IDs for the AXI DMA. These should match the values in xparameters.h
#define RX_INTR_ID XPAR_FABRIC_AXIDMA_0_S2MM_INTROUT_VEC_ID
#define TX_INTR_ID XPAR_FABRIC_AXIDMA_0_MM2S_INTROUT_VEC_ID
/******************************************************************************/

#endif // USER_OPTIONS_H_
