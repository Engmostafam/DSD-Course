/*
  Assumptions
 
 - Internal Clock is much faster than serial input clk
 - Data is given out aligned to the LSB
*/ 

module deserial (/*AUTOARG*/
   // Outputs
   dat_o, length, valid,
   // Inputs
   clk_i, rst_i, serial_clk, serial_i
   );


   // General
   input clk_i;
   input rst_i;

   // IN
   input serial_clk; // Serial Data Line
   input serial_i;  // CLK
   
   //Out
   output [31:0] dat_o; // 32 Bit Data Word
   output [4:0]  length; // 5-bit data word length
   output 	 valid; // Data Valid
   
   
   localparam HEADER=4'b1010;
   localparam FOOTER=4'b0111;
   
   localparam idle=2'b00;
   localparam head=2'b01; // Read Random number generator
   localparam data=2'b10; // Serially output header & data
   localparam foot=2'b11; // serially output footer
   

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg [31:0]		dat_o;
   reg [4:0]		length;
   reg			valid;
   // End of automatics


  // Sampling Circuit used to sample the serial clk in

   reg [1:0] 		rSAMPLE;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rSAMPLE <= 2'h0;
	     // End of automatics
	  end
	else 
	  begin
	     rSAMPLE <= {rSAMPLE[0], serial_clk};
	  end
     end

   // Flags for sampling register

   wire   fPOSEDGE;

   assign fPOSEDGE = !rSAMPLE[1] & rSAMPLE[0];

   
   // STATE MACHINE
   reg [1:0] 		state;
   reg [5:0] 		cnt;
   
   always @(posedge clk_i)
     if(rst_i)
       state <= idle;
       /*AUTORESET*/
     else 
       state <= next_state;

   reg [1:0] 		next_state;
   
   always @(/*AUTOSENSE*/fFOOT or fHEAD or state)
     begin
	case (state)
	  idle : next_state <= head;
	  head : next_state <= (fHEAD) ? data : head;
	  data : next_state <= (fFOOT) ? foot : data;
	  foot : next_state <= head;
	endcase // case (state)
     end

   reg [39:0] rSHIFT; // Shift in register
   
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rSHIFT <= 40'h0;
	     // End of automatics
	  end
	else if (fPOSEDGE)
	  rSHIFT <= {rSHIFT[38:0] , serial_i};
     end

   reg [39:0] rMASK; // Shift in register
   
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rMASK <= 40'h0;
	     // End of automatics
	  end
	else if (fPOSEDGE & (state == data))
	  rMASK <= {rMASK[38:0] , 1'b1};
	else if(state == foot)
	  rMASK <= 40'd0;
     end

   
   // Counter - Preloadable 
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     cnt <= 6'h0;
	     // End of automatics
	  end
	else if(fPOSEDGE & (state == data)) // Load
	  cnt <= cnt + 1'b1;
	else if (state == foot)
	  cnt <= 6'h00;
     end // always @ (posedge clk_i)

   // Data flags
   wire fHEAD;
   wire fFOOT;

   assign fHEAD = (rSHIFT[3:0] == HEADER);
   assign fFOOT = (rSHIFT[3:0] == FOOTER);
   
   // ACK signal

   always @(posedge clk_i)
     if(rst_i)
       /*AUTORESET*/
       // Beginning of autoreset for uninitialized flops
       valid <= 1'h0;
       // End of automatics
     else if ((state == data) & fFOOT)
       valid <= 1'b1;
     else 
       valid <= 1'b0;
   
   // output registers

   always @(posedge clk_i)
     if(rst_i)
       begin
	  /*AUTORESET*/
	  // Beginning of autoreset for uninitialized flops
	  dat_o <= 32'h0;
	  length <= 5'h0;
	  // End of automatics
       end
     else if ((state == data) & fFOOT)
       begin
	  dat_o <= rSHIFT[35:4] & rMASK[35:4];
	  length <= cnt - 3'b100;
       end

 
 
endmodule // pnser

