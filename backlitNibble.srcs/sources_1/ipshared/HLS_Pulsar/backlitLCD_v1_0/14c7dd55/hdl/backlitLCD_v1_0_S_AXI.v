
`timescale 1 ps / 1 ps

	module backlitLCD_v1_0_S_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
//        input wire clock, 
//        input wire [7:0] char,
//        input wire [7:0] level,
//        input wire reset,
//        input wire writeEnable, 
        output wire rs,
        output wire rw,
        output wire en, 
        output wire [3:0] db,
        output wire v0,
        output wire inp,
        output wire write,
        output wire [3:0] writeState,
		// User ports ends
		// Do not modify the ports beyond this line

		// Global Clock Signal
		input wire  S_AXI_ACLK,
		// Global Reset Signal. This Signal is Active LOW
		input wire  S_AXI_ARESETN,
		// Write address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
		// Write channel Protection type. This signal indicates the
    		// privilege and security level of the transaction, and whether
    		// the transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_AWPROT,
		// Write address valid. This signal indicates that the master signaling
    		// valid write address and control information.
		input wire  S_AXI_AWVALID,
		// Write address ready. This signal indicates that the slave is ready
    		// to accept an address and associated control signals.
		output wire  S_AXI_AWREADY,
		// Write data (issued by master, acceped by Slave) 
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
		// Write strobes. This signal indicates which byte lanes hold
    		// valid data. There is one write strobe bit for each eight
    		// bits of the write data bus.    
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
		// Write valid. This signal indicates that valid write
    		// data and strobes are available.
		input wire  S_AXI_WVALID,
		// Write ready. This signal indicates that the slave
    		// can accept the write data.
		output wire  S_AXI_WREADY,
		// Write response. This signal indicates the status
    		// of the write transaction.
		output wire [1 : 0] S_AXI_BRESP,
		// Write response valid. This signal indicates that the channel
    		// is signaling a valid write response.
		output wire  S_AXI_BVALID,
		// Response ready. This signal indicates that the master
    		// can accept a write response.
		input wire  S_AXI_BREADY,
		// Read address (issued by master, acceped by Slave)
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
		// Protection type. This signal indicates the privilege
    		// and security level of the transaction, and whether the
    		// transaction is a data access or an instruction access.
		input wire [2 : 0] S_AXI_ARPROT,
		// Read address valid. This signal indicates that the channel
    		// is signaling valid read address and control information.
		input wire  S_AXI_ARVALID,
		// Read address ready. This signal indicates that the slave is
    		// ready to accept an address and associated control signals.
		output wire  S_AXI_ARREADY,
		// Read data (issued by slave)
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
		// Read response. This signal indicates the status of the
    		// read transfer.
		output wire [1 : 0] S_AXI_RRESP,
		// Read valid. This signal indicates that the channel is
    		// signaling the required read data.
		output wire  S_AXI_RVALID,
		// Read ready. This signal indicates that the master can
    		// accept the read data and response information.
		input wire  S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 1;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 4
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	        end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID)
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	      slv_reg2 <= 0;
	      slv_reg3 <= 0;
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          2'h0:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h1:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 1
	                slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h2:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	                slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          2'h3:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 3
	                slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                      slv_reg2 <= slv_reg2;
	                      slv_reg3 <= slv_reg3;
	                    end
	        endcase
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      reg_data_out <= 0;
	    end 
	  else
	    begin    
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        2'h0   : reg_data_out <= slv_reg0;
	        2'h1   : reg_data_out <= slv_reg1;
	        2'h2   : reg_data_out <= slv_reg2;
	        2'h3   : reg_data_out <= slv_reg3;
	        default : reg_data_out <= 0;
	      endcase
	    end   
	end

	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    

//    input wire clock, 
//        input wire [7:0] char,
//        input wire [7:0] level,
//        input wire reset,
//        input wire writeEnable, 
        
	// Add user logic here
    backlitLCDnibble myLCD(
    .clock(S_AXI_ACLK), 
    .reset(S_AXI_ARESETN),
    .slv_reg_wren(slv_reg_wren),
    .axi_awaddr(axi_awaddr[C_S_AXI_ADDR_WIDTH-1:ADDR_LSB]),
    .S_AXI_WDATA(S_AXI_WDATA),
    .rs(rs),
    .rw(rw),
    .en(en), 
    .db(db),
    .v0(v0),
    .inp(inp),
    .write(write),
    .writeState(writeState)
    );
	// User logic ends

	endmodule

module backlitLCDnibble(
    input clock, 
   // input [7:0] char,
    //input [7:0] level,
    input reset,
    input [2:0] axi_awaddr,
    input [31:0] S_AXI_WDATA,
    input slv_reg_wren,
    //input write,
    output rs,
    output rw,
    output en,
    output [3:0] db,
    output v0,
    output inp,
    output write,
    output [3:0] writeState
    );
    
// 18 bits for counting... 2^18 / 100Mhz is 2.621 milliseconds    
reg [17:0] counter = 18'b0;
reg [3:0] db = 4'b0;
reg [7:0] level = 8'b0;
reg [7:0] char = 8'b0;

reg en, rs, rw;
parameter IDLE          = 4'b0000;
parameter INIT          = 4'b0001;
parameter INIT_1        = 4'b0010;
parameter LOWER_NIBBLE  = 4'b0100;
parameter UPPER_NIBBLE  = 4'b0110;
parameter LOWER_INIT    = 4'b0101;
parameter LOWER_INIT_1  = 4'b1000;  
parameter DONE          = 4'b1111;
parameter EMPTY = 5'b11111;
parameter INITIALIZE_LCD =5'b10000;
parameter WRITE_LCD = 5'b11000;
parameter READ_LCD = 5'b111100;

reg [4:0] lcd_current_state = EMPTY;
reg init_done = 1'b0;
reg [3:0] current_state = IDLE;
reg inp = 1'b0;
reg write = 1'b0;
reg initial_in_progress = 1'b0;
potVoltage potentiometer(clock, level, v0);

assign writeState = current_state;
// Newer Larger Verilog implementation of Initialization
// S_AXI_WDATA[0:0] is the initial case....
always @ (posedge clock) begin
    if (slv_reg_wren && (axi_awaddr == 3'h0) ) begin
        if (S_AXI_WDATA[31] == 1'b1 && initial_in_progress == 1'b0 ) begin
        // Initialization request
        initial_in_progress <= 1'b1;
        lcd_current_state <= INITIALIZE_LCD;
        end else if (S_AXI_WDATA[31] == 1'b1 && initial_in_progress == 1'b1) begin
        // initialize request is already being handled....
        end else if (S_AXI_WDATA[31] == 1'b0 && initial_in_progress == 1'b1) begin
        // covering all my cases...
        end else if  (S_AXI_WDATA[31] == 1'b0 && initial_in_progress == 1'b0) begin
        // Not an initialize request, also not currently initializing 
        end
    end
end


always @ (posedge clock) begin
    if (slv_reg_wren && (axi_awaddr == 3'h0) ) begin
        level <= S_AXI_WDATA[8:1];
    end
end

always @ (posedge clock) begin

    if (slv_reg_wren && (axi_awaddr == 3'h0) ) begin
    
        char <= S_AXI_WDATA[16:9];
        write <= S_AXI_WDATA[0:0]; 
    
    end
    
    counter <= counter + 1'b1;
    
    if(reset == 1'b0) begin
            current_state <= IDLE;
            inp <= 0;
            db <= 4'bz;
    end
    else begin
            case(current_state)
                IDLE : begin
                    if (write == 1 && inp == 0 ) begin
                        current_state <= INIT;
                        inp <= 1;
                        rs = 0;
                        rw = 0;
                        en = 0;  
                        db <= 4'bz;
                     end else if (write == 1 && inp == 1) begin
                        // Already writing... let it happen...
                        current_state <= IDLE;
                     end else if (write == 0 && inp == 1) begin
                        current_state <= IDLE;
                        // Reset inProgress. Ready to receive another write command
                        inp <= 0;
                     end else if (write == 0 && inp == 0) begin
                       // Be idle... do nothing... 
                        current_state <= IDLE;
                        rs = 0;
                        rw = 0;
                        en = 0;
                        db <= 4'bz;
                     end
                end
                 // Go through the initialization sequence
                INIT : begin
                    rs = 0;
                    rw = 0;
                    en = 0;
                    // (2^5-2^4) / 100Mhz = 160ns             
                    if (counter[5] == 1'b1) begin
                        current_state <= INIT_1;
                        counter <= 18'b0;
                        counter = counter + 1'b1;
                    end
                end
                INIT_1: begin
                    en = 1;
                    // (2^6-2^5) / 100Mhz = 320ns before turning on Valid Data 
                    if (counter[6] == 1'b1) begin
                        current_state <= UPPER_NIBBLE;
                        counter <= 18'b0;
                        counter = counter + 1'b1;
                    end
                end
                UPPER_NIBBLE: begin
                // Print a Char on the screen
                    db <= char[7:4];
                    if (counter[4] == 1'b1) begin
                        en = 0;
                    end
                    // Leave valid data on for 320ns
                    if (counter[6] == 1'b1) begin
                        current_state <= DONE;
                        counter <= 18'b0;
                        counter = counter + 1'b1;
                    end
                end
                DONE: begin
                    if (counter[13] == 1'b1) begin
                        inp <= 0;
                    end
                    if (counter[17] == 1'b1) begin
                        current_state <= IDLE;
                        counter <= 18'b0;
                        counter = counter + 1'b1;
                    end
                end       
                default : begin
                    current_state <= IDLE;
                end
            endcase
            
            
            
    end
end
    
endmodule

module potVoltage(input clock, input [7:0] level, output v);
reg [22:0] randNumber = 23'h0F0F;
reg [7:0] eightBits = 8'hFF;
    always @ (posedge clock) begin
        randNumber <= randNumber << 1  ; //{randNumber[0]^randNumber[1], randNumber[21:0] }; 
        eightBits <= { randNumber[10], randNumber[1], randNumber[5], randNumber[6], randNumber[18], randNumber[2], randNumber[3], randNumber[22]};   
    
    end 
    assign v = (eightBits > level) ? 1'b0 : 1'b1;
endmodule