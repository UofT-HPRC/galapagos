/**
 * @brief  Provides API for abstracting control for handling bare-metal
 *         AXI-Stream DMA Engine configured in Scatter Gather (SG) Mode
 *         with Dynamic ReAlignment Engine (DRE) enabled
 * @author Jason Gutel (github.com/gutelfuldead)
 */

#include "xparameters.h"
#include "xil_exception.h"
#include "xdebug.h"
#include "xil_mmu.h"
#include "stdio.h"
#include "axis_dma_controller.h"

/******************** Constant Definitions **********************************/
/* Size of One MB as used by the TLB when marking mem area as noncacheable */
#define ONE_MB 0x100000U

/* Timeout loop counter for reset */
#define RESET_TIMEOUT_COUNTER 10000
#define DELAY_TIMER_COUNT 100

/**************************** Type Definitions *******************************/

/***************** Macros (Inline Functions) Definitions *********************/
#ifdef AXISDMA_ENABLE_PRINTS
	#define AXISDMA_ERROR_PRINT(fmt, args...) printf("ERROR: %s:%d(): " fmt, \
    		__func__,__LINE__, ##args)
	#define AXISDMA_DEBUG_PRINT(fmt, args...) printf("DEBUG: %s:%d(): " fmt, \
	    __func__,__LINE__, ##args)
#else
	#define AXISDMA_ERROR_PRINT(fmt, args...)
	#define AXISDMA_DEBUG_PRINT(fmt, args...)
#endif

/************************** Function Prototypes ******************************/
static void axisDmaCtrl_txIntrHandler(void *callback);
static void axisDmaCtrl_rxIntrHandler(void *callback);
static int axisDmaCtrl_setupIntrSystem(XScuGic * intcInstancePtr);
static void axisDmaCtrl_disableIntrSystem(XScuGic * intcInstancePtr);
static int axisDmaCtrl_rxSetup(XAxiDma * axiDmaInstPtr);
static int axisDmaCtrl_txSetup(XAxiDma * axiDmaInstPtr);
static void axisDmaCtrl_txIrqBdHandler(XAxiDma_BdRing * txRingPtr);
static void axisDmaCtrl_rxIrqBdHandler(XAxiDma_BdRing * rxRingPtr);
static int axisDmaCtrl_markMemNoncache(void);
static struct axisDmaCtrl_params axisDmaCtrl_copyParamsStruct(struct axisDmaCtrl_params * in);
static void axisDmaCtrl_emptyParamsStruct(struct axisDmaCtrl_params * in);

/************************** Variable Definitions *****************************/
static XAxiDma axiDma;

static dma_tx_cb_t _tx_cb = NULL;
static dma_rx_cb_t _rx_cb = NULL;
static struct axisDmaCtrl_params params;


int axisDmaCtrl_init(struct axisDmaCtrl_params *paramsIn,
	XScuGic * intcInstancePtr,
	dma_rx_cb_t rxCb,
	dma_tx_cb_t txCb
	)
{
	int rc;
	XAxiDma_Config *config;

	rc = axisDmaCtrl_register_tx_cb(txCb);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("axisDmaCtrl_register_tx_cb failed!\r\n");
		return rc;
	}

	axisDmaCtrl_register_rx_cb(rxCb);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("axisDmaCtrl_register_rx_cb failed!\r\n");
		return rc;
	}

	params = axisDmaCtrl_copyParamsStruct(paramsIn);

	rc = axisDmaCtrl_markMemNoncache();
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("axisDmaCtrl_markMemNoncache failed!\r\n");
		return XST_FAILURE;
	}

	config = XAxiDma_LookupConfig(params.dmaDevId);
	rc = XAxiDma_CfgInitialize(&axiDma, config);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("XAxiDma_CfgInitialize failed!\r\n");
		return XST_FAILURE;
	}

	if (!XAxiDma_HasSg(&axiDma)) {
		AXISDMA_ERROR_PRINT("DMA NOT in SG Mode...\r\n");
		return XST_FAILURE;
	}

	/* Set up TX/RX channels to be ready to transmit and receive packets */
	if (params.txEn){
		rc = axisDmaCtrl_txSetup(&axiDma);
		if (rc != XST_SUCCESS) {
			AXISDMA_ERROR_PRINT("Failed TX setup\r\n");
			return XST_FAILURE;
		}
	}

	if (params.rxEn) {
		rc = axisDmaCtrl_rxSetup(&axiDma);
		if (rc != XST_SUCCESS) {
			AXISDMA_ERROR_PRINT("Failed RX setup\r\n");
			return XST_FAILURE;
		}
	}

	/* Set up Interrupt system  */
	rc = axisDmaCtrl_setupIntrSystem(intcInstancePtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Failed interrupt setup\r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

void axisDmaCtrl_printParams(struct axisDmaCtrl_params *in)
{
	printf("rx_bd_space_base      : 0x%x\r\n",(unsigned int)in->rx_bd_space_base);
	printf("rx_bd_space_high      : 0x%x\r\n",(unsigned int)in->rx_bd_space_high);
	printf("tx_bd_space_base      : 0x%x\r\n",(unsigned int)in->tx_bd_space_base);
	printf("tx_bd_space_high      : 0x%x\r\n",(unsigned int)in->tx_bd_space_high);
	printf("tx_buffer_base        : 0x%x\r\n",(unsigned int)in->tx_buffer_base);
	printf("tx_buffer_high        : 0x%x\r\n",(unsigned int)in->tx_buffer_high);
	printf("rx_buffer_base        : 0x%x\r\n",(unsigned int)in->rx_buffer_base);
	printf("rx_buffer_high        : 0x%x\r\n",(unsigned int)in->rx_buffer_high);
	printf("bd_buf_size           : 0x%x\r\n",(unsigned int)in->bd_buf_size);
	printf("dmaDevId              : 0x%x\r\n",(unsigned int)in->dmaDevId);
	printf("txEn                  : %u\r\n",in->txEn);
	printf("txIrqPriority         : 0x%x\r\n",(unsigned int)in->txIrqPriority);
	printf("txIrqId               : 0x%x\r\n",(unsigned int)in->txIrqId);
	printf("rxEn                  : %u\r\n",in->rxEn);
	printf("coalesce_count        : %u\r\n",in->coalesce_count);
	printf("rxIrqId               : 0x%x\r\n",(unsigned int)in->rxIrqId);
	printf("rxIrqPriority         : 0x%x\r\n",(unsigned int)in->rxIrqPriority);
}

void axisDmaCtrl_disable(XScuGic * intcInstancePtr)
{
	axisDmaCtrl_disableIntrSystem(intcInstancePtr);
	_tx_cb = NULL;
	_rx_cb = NULL;
	axisDmaCtrl_emptyParamsStruct(&params);
}

int axisDmaCtrl_register_tx_cb(dma_tx_cb_t cb)
{
	if (cb == NULL)
		return XST_FAILURE;
	XAxiDma_Pause(&axiDma);
	_tx_cb = cb;
	XAxiDma_Resume(&axiDma);
	return XST_SUCCESS;
}

int axisDmaCtrl_register_rx_cb(dma_rx_cb_t cb)
{
	if (cb == NULL)
		return XST_FAILURE;
	XAxiDma_Pause(&axiDma);
	_rx_cb = cb;
	XAxiDma_Resume(&axiDma);
	return XST_SUCCESS;
}

int axisDmaCtrl_sendPackets(uint8_t * packetBuf, size_t packetSize)
{
	XAxiDma_BdRing *txRingPtr = XAxiDma_GetTxRing(&axiDma);
	XAxiDma_Bd *bdPtr, *bdCurPtr;
	int rc;
	u32 BufferAddr;
	int reqBds;
	int i;
	size_t remaining_bytes;

	/* find number of bds required */
	remaining_bytes = packetSize;
	reqBds = packetSize / params.bd_buf_size;
	reqBds += (packetSize % params.bd_buf_size) ? 1 : 0;

	/* Flush the SrcBuffer before the DMA transfer, in case the Data Cache
         * is enabled
	 */
	Xil_DCacheFlushRange((UINTPTR)packetBuf, params.bd_buf_size * reqBds);

	rc = XAxiDma_BdRingAlloc(txRingPtr, reqBds, &bdPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Failed bd alloc\r\n");
		return E_AXISDMA_NOBDS;
	}

	BufferAddr = (UINTPTR)packetBuf;
	bdCurPtr = bdPtr;

	AXISDMA_DEBUG_PRINT("pkt_len : %d, # bds req %d\r\n",packetSize, reqBds);

	for (i = 0; i < reqBds; i++) {
		u32 CrBits = 0;
		size_t bytes2send = 0;

		/* if this is the only bd send the full received packetSize */
		if (i == reqBds - 1) {
			bytes2send = remaining_bytes;
		}
		/* else send the maximum buffer_size and calculate number of remaining bytes */
		else{
			bytes2send = params.bd_buf_size;
			remaining_bytes -= params.bd_buf_size;
		}

		rc = XAxiDma_BdSetBufAddr(bdCurPtr, BufferAddr);
		if (rc != XST_SUCCESS) {
			AXISDMA_ERROR_PRINT("Tx set buffer addr %x on BD %x failed %d\r\n",
			(unsigned int)BufferAddr,
			(UINTPTR)bdPtr, rc);
			return XST_FAILURE;
		}

		rc = XAxiDma_BdSetLength(bdCurPtr, (uint32_t)bytes2send,
					txRingPtr->MaxTransferLen);
		if (rc != XST_SUCCESS) {
			AXISDMA_ERROR_PRINT("Tx set length %d on BD %x failed %d\r\n",
			params.bd_buf_size, (UINTPTR)bdCurPtr, rc);
			return XST_FAILURE;
		}

		if (i == 0)
			CrBits |= XAXIDMA_BD_CTRL_TXSOF_MASK;
		if (i == reqBds - 1)
			CrBits |= XAXIDMA_BD_CTRL_TXEOF_MASK;

		XAxiDma_BdSetCtrl(bdCurPtr, CrBits);
		XAxiDma_BdSetId(bdCurPtr, BufferAddr);

		if (i != reqBds-1) {
			BufferAddr += params.bd_buf_size;
			bdCurPtr = (XAxiDma_Bd *)XAxiDma_BdRingNext(txRingPtr, bdCurPtr);
		}
	}

	/* Give the BD to hardware */
	rc = XAxiDma_BdRingToHw(txRingPtr, reqBds, bdPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Failed to hw, length %d\r\n",
			(int)XAxiDma_BdGetLength(bdPtr,
					txRingPtr->MaxTransferLen));
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

static int axisDmaCtrl_markMemNoncache(void)
{
	size_t i = 0;
	int invalid_struct = 0;
	invalid_struct |= (!params.txEn && !params.rxEn)
			| (params.rxEn && params.coalesce_count == 0)
			| (params.rxEn && ((params.rx_bd_space_high - params.rx_bd_space_base) == 0))
			| (params.rxEn && ((params.rx_buffer_high - params.rx_buffer_base) == 0))
			| (params.txEn && ((params.tx_bd_space_high - params.tx_bd_space_base) == 0))
			| (params.txEn && ((params.tx_buffer_high - params.tx_buffer_base) == 0)
			);
	if (invalid_struct)
		return XST_FAILURE;
	if (params.rxEn) {
		for (i = params.rx_bd_space_base; i <= params.rx_bd_space_high; i += ONE_MB)
			Xil_SetTlbAttributes(i, NORM_NONCACHE);
		for (i = params.rx_buffer_base; i <= params.rx_buffer_high; i += ONE_MB)
			Xil_SetTlbAttributes(i, NORM_NONCACHE);
	}
	if (params.txEn) {
		for (i = params.tx_bd_space_base; i <= params.tx_bd_space_high; i += ONE_MB)
			Xil_SetTlbAttributes(i, NORM_NONCACHE);
		for (i = params.tx_buffer_base; i <= params.tx_buffer_high; i += ONE_MB)
			Xil_SetTlbAttributes(i, NORM_NONCACHE);
	}
	return XST_SUCCESS;
}

static struct axisDmaCtrl_params axisDmaCtrl_copyParamsStruct(struct axisDmaCtrl_params * in)
{
	struct axisDmaCtrl_params tmp;
	tmp.rx_bd_space_base = in->rx_bd_space_base;
	tmp.rx_bd_space_high = in->rx_bd_space_high;
	tmp.tx_bd_space_base = in->tx_bd_space_base;
	tmp.tx_bd_space_high = in->tx_bd_space_high;
	tmp.tx_buffer_base = in->tx_buffer_base;
	tmp.tx_buffer_high = in->tx_buffer_high;
	tmp.rx_buffer_base = in->rx_buffer_base;
	tmp.rx_buffer_high = in->rx_buffer_high;
	tmp.bd_buf_size = in->bd_buf_size;
	tmp.txEn = in->txEn;
	tmp.txIrqId = in->txIrqId;
	tmp.txIrqPriority = in->txIrqPriority;
	tmp.coalesce_count = in->coalesce_count;
	tmp.rxEn = in->rxEn;
	tmp.rxIrqPriority = in->rxIrqPriority;
	tmp.rxIrqId = in->rxIrqId;
	tmp.dmaDevId = in->dmaDevId;
	return tmp;
}

static void axisDmaCtrl_emptyParamsStruct(struct axisDmaCtrl_params * in)
{
	in->rx_bd_space_base = 0;
	in->rx_bd_space_high = 0;
	in->tx_bd_space_base = 0;
	in->tx_bd_space_high = 0;
	in->tx_buffer_base   = 0;
	in->tx_buffer_high   = 0;
	in->rx_buffer_base   = 0;
	in->rx_buffer_high   = 0;
	in->bd_buf_size      = 0;
	in->coalesce_count   = 1;
	in->rxIrqPriority = 0xff;
	in->txIrqPriority = 0xff;
	in->txEn          = 0;
	in->rxEn          = 0;
}

static void axisDmaCtrl_txIrqBdHandler(XAxiDma_BdRing * txRingPtr)
{
	int bdCount;
	u32 bdSts;
	XAxiDma_Bd *bdPtr;
	XAxiDma_Bd *bdCurPtr;
	int rc;
	int i;

	/* Get all processed BDs from hardware */
	bdCount = XAxiDma_BdRingFromHw(txRingPtr, XAXIDMA_ALL_BDS, &bdPtr);

	/* Handle the BDs */
	bdCurPtr = bdPtr;
	for (i = 0; i < bdCount; i++) {

		/*
 		 * Check the status in each BD
 		 * If error happens, the DMA engine will be halted after this
 		 * BD processing stops.
 		 */
		bdSts = XAxiDma_BdGetSts(bdCurPtr);
		if ((bdSts & XAXIDMA_BD_STS_ALL_ERR_MASK) ||
		    (!(bdSts & XAXIDMA_BD_STS_COMPLETE_MASK))) {
			AXISDMA_ERROR_PRINT("\r\n");
			break;
		}

		_tx_cb();

		/*
  		 * Here we don't need to do anything. But if a RTOS is being
  		 * used, we may need to free the packet buffer attached to
  		 * the processed BD
  		 */

		/* Find the next processed BD */
		if (i != bdCount-1)
			bdCurPtr = (XAxiDma_Bd *)XAxiDma_BdRingNext(txRingPtr, bdCurPtr);
	}

	/* Free all processed BDs for future transmission */
	rc = XAxiDma_BdRingFree(txRingPtr, bdCount, bdPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("XAxiDma_BdRingFree\r\n");
	}
}

static void axisDmaCtrl_txIntrHandler(void *callback)
{
	XAxiDma_BdRing *txRingPtr = (XAxiDma_BdRing *) callback;
	u32 irqStatus;
	int timeOut;

	/* Read pending interrupts */
	irqStatus = XAxiDma_BdRingGetIrq(txRingPtr);

	/* Acknowledge pending interrupts */
	XAxiDma_BdRingAckIrq(txRingPtr, irqStatus);

	/* If no interrupt is asserted, we do not do anything */
	if (!(irqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
  	 * If error interrupt is asserted, raise error flag, reset the
  	 * hardware to recover from the error, and return with no further
  	 * processing.
  	 */
	if ((irqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		XAxiDma_BdRingDumpRegs(txRingPtr);
		AXISDMA_ERROR_PRINT("XAXIDMA_IRQ_ERROR_MASK\r\n");

		/*
 		 * Reset should never fail for transmit channel
 		 */
		XAxiDma_Reset(&axiDma);

		/** @todo raise an error flag */
		timeOut = RESET_TIMEOUT_COUNTER;
		while (timeOut) {
			if (XAxiDma_ResetIsDone(&axiDma)) {
				break;
			}
			timeOut -= 1;
		}
		return;
	}

	/*
  	 * If Transmit done interrupt is asserted, call TX call back function
  	 * to handle the processed BDs and raise the according flag
  	 */
	if ((irqStatus & (XAXIDMA_IRQ_DELAY_MASK | XAXIDMA_IRQ_IOC_MASK))) {
		axisDmaCtrl_txIrqBdHandler(txRingPtr);
	}
}

static void axisDmaCtrl_rxIrqBdHandler(XAxiDma_BdRing * rxRingPtr)
{
	int bdCount;
	XAxiDma_Bd *bdPtr;
	XAxiDma_Bd *bdCurPtr;
	u32 bdSts;
	int i;
	u32 freeBdCount;
	int rc;

	/* Get finished BDs from hardware */
	bdCount = XAxiDma_BdRingFromHw(rxRingPtr, XAXIDMA_ALL_BDS, &bdPtr);
	if (bdCount == 0) {
		return;
	}

	AXISDMA_DEBUG_PRINT("rx %d bds\r\n",bdCount);

	bdCurPtr = bdPtr;
	for (i = 0; i < bdCount; i++) {
		uint32_t addr;
		uint32_t pktLen;
		/*
 		* Check the flags set by the hardware for status
		* If error happens, processing stops, because the DMA engine
 		* is halted after this BD.
		*/
		bdSts = XAxiDma_BdGetSts(bdCurPtr);
		if ((bdSts & XAXIDMA_BD_STS_ALL_ERR_MASK) ||
		    (!(bdSts & XAXIDMA_BD_STS_COMPLETE_MASK))) {
			AXISDMA_ERROR_PRINT("XAxiDma_BdGetSts\r\n");
			break;
		}

		/* get memory offset of current bd */
		addr   = XAxiDma_BdGetBufAddr(bdCurPtr);
		pktLen = XAxiDma_BdGetActualLength(bdCurPtr,rxRingPtr->MaxTransferLen);

		AXISDMA_DEBUG_PRINT("pkt %d, pktLen %lu\r\n",i,pktLen);

		_rx_cb(addr, pktLen);

		/* Find the next processed BD */
		if (i != bdCount-1)
			bdCurPtr = (XAxiDma_Bd *)XAxiDma_BdRingNext(rxRingPtr, bdCurPtr);
	}


	rc = XAxiDma_BdRingFree(rxRingPtr, bdCount, bdPtr);
	if (rc != XST_SUCCESS)
		AXISDMA_ERROR_PRINT("XAxiDma_BdRingFree rc %d\r\n",rc);

	/* Return processed BDs to RX channel so we are ready to receive new
	 * packets:
	 *    - Allocate all free RX BDs
	 *    - Pass the BDs to RX channel
	 */
	freeBdCount = XAxiDma_BdRingGetFreeCnt(rxRingPtr);
	rc = XAxiDma_BdRingAlloc(rxRingPtr, freeBdCount, &bdPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("XAxiDma_BdRingAlloc failed %d - freeBdCount %u\r\n",rc,freeBdCount);
	}

	rc = XAxiDma_BdRingToHw(rxRingPtr, freeBdCount, bdPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("XAxiDma_BdRingToHw failed %d\r\n",rc);
	}
}

static void axisDmaCtrl_rxIntrHandler(void *callback)
{
	XAxiDma_BdRing *rxRingPtr = (XAxiDma_BdRing *) callback;
	u32 irqStatus;
	int timeOut;

	/* Read pending interrupts */
	irqStatus = XAxiDma_BdRingGetIrq(rxRingPtr);

	/* Acknowledge pending interrupts */
	XAxiDma_BdRingAckIrq(rxRingPtr, irqStatus);

	/*
  	 * If no interrupt is asserted, we do not do anything
  	 */
	if (!(irqStatus & XAXIDMA_IRQ_ALL_MASK)) {
		return;
	}

	/*
 	 * If error interrupt is asserted, raise error flag, reset the
  	 * hardware to recover from the error, and return with no further
  	 * processing.
  	 */
	if ((irqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		XAxiDma_BdRingDumpRegs(rxRingPtr);
		AXISDMA_ERROR_PRINT("\r\n");

		/* Reset could fail and hang
  		 * NEED a way to handle this or do not call it??
  		 */
		XAxiDma_Reset(&axiDma);

		timeOut = RESET_TIMEOUT_COUNTER;

		while (timeOut) {
			if (XAxiDma_ResetIsDone(&axiDma)) {
				break;
			}

			timeOut -= 1;
		}

		return;
	}

	/*
   	 * If completion interrupt is asserted, call RX call back function
  	 * to handle the processed BDs and then raise the according flag.
  	 */
	if ((irqStatus & (XAXIDMA_IRQ_DELAY_MASK | XAXIDMA_IRQ_IOC_MASK))) {
		axisDmaCtrl_rxIrqBdHandler(rxRingPtr);
	}
}

static int axisDmaCtrl_setupIntrSystem(XScuGic * intcInstancePtr)
{
	int rc;

#if 0
	XScuGic_Config *intcConfig;

	/*
  	 * Initialize the interrupt controller driver so that it is ready to
  	 * use.
  	 */
	intcConfig = XScuGic_LookupConfig(params.dmaDevId);
	if (NULL == intcConfig) {
		return XST_FAILURE;
	}

	rc = XScuGic_CfgInitialize(intcInstancePtr, intcConfig,
					intcConfig->CpuBaseAddress);
	if (rc != XST_SUCCESS) {
		return XST_FAILURE;
	}
#endif

	if (params.txEn) {
		XAxiDma_BdRing *txRingPtr = XAxiDma_GetTxRing(&axiDma);
		XScuGic_SetPriorityTriggerType(intcInstancePtr, params.txIrqId, params.txIrqPriority, 0x3);
		rc = XScuGic_Connect(intcInstancePtr, params.txIrqId,
					(Xil_InterruptHandler)axisDmaCtrl_txIntrHandler,
					txRingPtr);
		if (rc != XST_SUCCESS) {
			return rc;
		}
		XScuGic_Enable(intcInstancePtr, params.txIrqId);
	}

	if (params.rxEn) {
		XAxiDma_BdRing *rxRingPtr = XAxiDma_GetRxRing(&axiDma);
		XScuGic_SetPriorityTriggerType(intcInstancePtr, params.rxIrqId, params.rxIrqPriority, 0x3);
		rc = XScuGic_Connect(intcInstancePtr, params.rxIrqId,
					(Xil_InterruptHandler)axisDmaCtrl_rxIntrHandler,
					rxRingPtr);
		if (rc != XST_SUCCESS) {
			return rc;
		}
		XScuGic_Enable(intcInstancePtr, params.rxIrqId);
	}


#if 0
	/* Enable interrupts from the hardware */
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XScuGic_InterruptHandler,
			(void *)intcInstancePtr);

	Xil_ExceptionEnable();
#endif
	return XST_SUCCESS;
}

static void axisDmaCtrl_disableIntrSystem(XScuGic * intcInstancePtr)
{
	if (params.txEn)
		XScuGic_Disconnect(intcInstancePtr, params.txIrqId);

	if (params.rxEn)
		XScuGic_Disconnect(intcInstancePtr, params.rxIrqId);
}

static int axisDmaCtrl_rxSetup(XAxiDma * axiDmaInstPtr)
{
	XAxiDma_BdRing *rxRingPtr;
	int rc;
	XAxiDma_Bd bdTemplate;
	XAxiDma_Bd *bdPtr;
	XAxiDma_Bd *bdCurPtr;
	int bdCount;
	int freeBdCount;
	u32 rxBufferPtr;
	int i;

	rxRingPtr = XAxiDma_GetRxRing(axiDmaInstPtr);

	/* Disable all RX interrupts before RxBD space setup */
	XAxiDma_BdRingIntDisable(rxRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Setup Rx BD space */
	bdCount = XAxiDma_BdRingCntCalc(XAXIDMA_BD_MINIMUM_ALIGNMENT,
				params.rx_bd_space_high - params.rx_bd_space_base + 1);

	rc = XAxiDma_BdRingCreate(rxRingPtr, params.rx_bd_space_base,
					params.rx_bd_space_base,
					XAXIDMA_BD_MINIMUM_ALIGNMENT, bdCount);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Rx bd create failed with %d\r\n", rc);
		return XST_FAILURE;
	}
	AXISDMA_DEBUG_PRINT("%d rx bds created\r\n",bdCount);

	/*
  	 * Setup a BD template for the Rx channel. Then copy it to every RX BD.
  	 */
	XAxiDma_BdClear(&bdTemplate);
	rc = XAxiDma_BdRingClone(rxRingPtr, &bdTemplate);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Rx bd clone failed with %d\r\n", rc);
		return XST_FAILURE;
	}

	/* Attach buffers to RxBD ring so we are ready to receive packets */
	freeBdCount = XAxiDma_BdRingGetFreeCnt(rxRingPtr);

	rc = XAxiDma_BdRingAlloc(rxRingPtr, freeBdCount, &bdPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Rx bd alloc failed with %d\r\n", rc);
		return XST_FAILURE;
	}

	bdCurPtr = bdPtr;
	rxBufferPtr = params.rx_buffer_base;

	for (i = 0; i < freeBdCount; i++) {

		rc = XAxiDma_BdSetBufAddr(bdCurPtr, rxBufferPtr);
		if (rc != XST_SUCCESS) {
			AXISDMA_ERROR_PRINT("Rx set buffer addr %x on BD %x failed %d\r\n",
			(unsigned int)rxBufferPtr,
			(UINTPTR)bdCurPtr, rc);

			return XST_FAILURE;
		}

		rc = XAxiDma_BdSetLength(bdCurPtr, params.bd_buf_size,
					rxRingPtr->MaxTransferLen);
		if (rc != XST_SUCCESS) {
			AXISDMA_ERROR_PRINT("Rx set length %d on BD %x failed %d\r\n",
			    params.bd_buf_size, (UINTPTR)bdCurPtr, rc);

			return XST_FAILURE;
		}

		/* Receive BDs do not need to set anything for the control
  		 * The hardware will set the SOF/EOF bits per stream status
  		 */
		XAxiDma_BdSetCtrl(bdCurPtr, 0);

		XAxiDma_BdSetId(bdCurPtr, rxBufferPtr);

		rxBufferPtr += params.bd_buf_size;
		bdCurPtr = (XAxiDma_Bd *)XAxiDma_BdRingNext(rxRingPtr, bdCurPtr);
	}

	rc = XAxiDma_BdRingSetCoalesce(rxRingPtr, params.coalesce_count,
			DELAY_TIMER_COUNT);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Rx set coalesce failed with %d\r\n", rc);
		return XST_FAILURE;
	}

	rc = XAxiDma_BdRingToHw(rxRingPtr, freeBdCount, bdPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Rx ToHw failed with %d\r\n", rc);
		return XST_FAILURE;
	}

	rc = XAxiDma_BdRingCheck(rxRingPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Failed XAxiDma_BdRingCheck %d\r\n",rc);
		return XST_FAILURE;
	}

	/* Enable all RX interrupts */
	XAxiDma_BdRingIntEnable(rxRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Enable Cyclic DMA mode */
	// XAxiDma_BdRingEnableCyclicDMA(rxRingPtr);
	// XAxiDma_SelectCyclicMode(axiDmaInstPtr, XAXIDMA_DEVICE_TO_DMA, 1);

	/* Start RX DMA channel */
	rc = XAxiDma_BdRingStart(rxRingPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Rx start BD ring failed with %d\r\n", rc);
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

static int axisDmaCtrl_txSetup(XAxiDma * axiDmaInstPtr)
{
	XAxiDma_BdRing *txRingPtr = XAxiDma_GetTxRing(axiDmaInstPtr);
	XAxiDma_Bd bdTemplate;
	int rc;
	u32 bdCount;

	/* Disable all TX interrupts before TxBD space setup */
	XAxiDma_BdRingIntDisable(txRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Setup TxBD space  */
	bdCount = XAxiDma_BdRingCntCalc(XAXIDMA_BD_MINIMUM_ALIGNMENT,
			(u32)params.tx_bd_space_high - (u32)params.tx_bd_space_base + 1);
	AXISDMA_DEBUG_PRINT("%d tx bds created\r\n",(int)bdCount);

	rc = XAxiDma_BdRingCreate(txRingPtr, params.tx_bd_space_base,
				     params.tx_bd_space_base,
				     XAXIDMA_BD_MINIMUM_ALIGNMENT, bdCount);
	if (rc != XST_SUCCESS) {

		AXISDMA_ERROR_PRINT("Failed create BD ring\r\n");
		return XST_FAILURE;
	}

	/*
  	 * Like the RxBD space, we create a template and set all BDs to be the
  	 * same as the template. The sender has to set up the BDs as needed.
	 */
	XAxiDma_BdClear(&bdTemplate);
	rc = XAxiDma_BdRingClone(txRingPtr, &bdTemplate);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Failed clone BDs\r\n");
		return XST_FAILURE;
	}

	/*
  	 * Set the coalescing threshold, so only one transmit interrupt
  	 * occurs for this example
  	 *
  	 * If you would like to have multiple interrupts to happen, change
  	 * the params.coalesce_count to be a smaller value
  	 */
	rc = XAxiDma_BdRingSetCoalesce(txRingPtr, params.coalesce_count,
			DELAY_TIMER_COUNT);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Failed set coalescing"
		" %d/%d\r\n",params.coalesce_count, DELAY_TIMER_COUNT);
		return XST_FAILURE;
	}

	rc = XAxiDma_BdRingCheck(txRingPtr);
	if (rc != XST_SUCCESS) {
		AXISDMA_ERROR_PRINT("Failed XAxiDma_BdRingCheck %d\r\n",rc);
		return XST_FAILURE;
	}

	/* Enable all TX interrupts */
	XAxiDma_BdRingIntEnable(txRingPtr, XAXIDMA_IRQ_ALL_MASK);

	/* Start the TX channel */
	rc = XAxiDma_BdRingStart(txRingPtr);
	if (rc != XST_SUCCESS) {

		AXISDMA_ERROR_PRINT("Failed bd start\r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
