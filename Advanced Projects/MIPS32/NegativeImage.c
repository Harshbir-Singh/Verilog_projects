#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xuartps.h"
#include "imageData.h"
#include "sleep.h"

#define imageSize 512*512
#define headerSize 1080

XUartPs uart;
XUartPs_Config *Uart_config;

void uart_init(){
	Uart_config = XUartPs_LookupConfig(XPAR_PS7_UART_0_DEVICE_ID);
    s32 status = XUartPs_CfgInitialize(&uart,Uart_config, Uart_config -> BaseAddress);

    if(status != XST_SUCCESS)
    	xil_printf("UART Initialization failed\n");
    XUartPs_SetBaudRate(&uart,115200);
}

int main(){
	u32 totalTransmittedBytes = 0;
	u32 transmittedBytes = 0;
    uart_init();


    for(int i=0; i<imageSize; i++){
        imageData[i] = 255-imageData[i];
    }

    while(totalTransmittedBytes<imageSize){

    	transmittedBytes = XUartPs_Send(&uart,(u8*)&imageData[totalTransmittedBytes],1);
    	totalTransmittedBytes += transmittedBytes;
        usleep(1000);
    }

    cleanup_platform();
}


