

/***************************** Include Files *******************************/
#include "backlitLCD.h"

/************************** Function Definitions ***************************/

u32 outBits(lcd screen) {
//	xil_printf( "write: 0x%02x\n", screen.write );
//	xil_printf( "level: 0x%02x\n", screen.level );
//	xil_printf( "db: 0x%02x\n", screen.db );
	u32 allTogether = ( (screen.db << 9) | (screen.level << 1) | (screen.write ));
	return  allTogether;
}

void writeChar(){

}

void delay(numCycles){
	volatile int Delay;
	for (Delay = 0; Delay < numCycles; Delay++) {} ;
}

void INIT_LCD (lcd screen) {
	// Start: LCD is already powered on atleast 15ms
	// Write rs = 0 rw = 0 db5 = 1 db4 = 1
    screen.write = 0x1;
    screen.db = 0x30;
    screen.level = 0xFF;

	u32 data = outBits(screen);
	//xil_printf( "data: 0x%04x\n", data );
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	xil_printf( "data: 0x%04x\n", data );
	// Wait > 4.1ms
	delay(500000);
	// Write rs = 0 rw = 0 db5 = 1 db4 = 1
	screen.write = 0x1;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	// Wait > 100us
	delay(500000);
	// Write rs = 0 rw = 0 db5 = 1 db4 = 1
	screen.write = 0x1;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	// Wait a little tiny bit
	delay(100000);
	// Step 1
	screen.write = 0x1;
	screen.db =0x20;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	delay(100000);
	// Step 2
	screen.write = 0x1;
	screen.db =0x20;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	xil_printf( "data: 0x%04x\n", data );
	delay(100000);
	// Step 3
	screen.write = 0x1;
	screen.db =0xC0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	delay(100000);
	// Step 4
	screen.write = 0x1;
	screen.db =0x00;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen); BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	delay(100000);
	// Step 5
	screen.write = 0x1; screen.db =0x80;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	delay(100000);
	// Step 6
	screen.write = 0x1;
	screen.db =0x00;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	delay(100000);
	// Step 7
	screen.write = 0x1;
	screen.db =0x10;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	delay(100000);
	// Step 8
	screen.write = 0x1;
	screen.db =0x00;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	delay(100000);
	// Step 9
	screen.write = 0x1;
	screen.db =0x40;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	screen.write = 0x0;
	data = outBits(screen);
	BACKLITLCD_mWriteReg( XPAR_BACKLITLCD_0_S_AXI_BASEADDR, 0, data);
	delay(100000);
}
