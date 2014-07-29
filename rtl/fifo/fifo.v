/*
 - Synchronous concurrent FIFO
 - Has no internal running clock
 - All resets need to be Asynchronous to account for the absence of a free running general clock 
 - Two Clock domains exist, Read Clock and Write Clock 
 - Read and Write Pointers are changed to gray code then passed through two FFs for synchronization when being used at the other clock domain
*/ 

module fifo (/*AUTOARG*/
   // Outputs
   full, dat_o, empty,
   // Inputs
   dat_i, wclk, wen, rclk, ren, rst_i
   );

   parameter DW = 4;// Data Width 
   parameter AW = 2; // Address Width. FIFO DEPTH = 2^AW

   // Write Side
   input [DW-1:0] dat_i;
   input 	  wclk;
   input 	  wen;
   output 	  full;
   
   // Read Side
   output [DW-1:0] dat_o;
   input 	   rclk;
   input 	   ren;
   output 	   empty;

   input 	   rst_i;
   
   reg [DW-1:0]    RAM[(1<<AW)-1:0];
   
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg [DW-1:0]		dat_o;
   reg			empty;
   reg			full;
   // End of automatics

   // Read Clock Domain
   // Read Pointer, Up Counter
   reg [AW:0] 	rptr; // MSB not an address
   wire [AW-1:0] 	rcrnt; // Current read address
   
   always @(posedge rclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rptr <= {(1+(AW)){1'b0}};
	     // End of automatics
	  end
	else if(ren & !empty) // Load
	  rptr <= rptr + 1'b1;
     end // always @ (posedge rclk or posedge rst_i)

   
   wire [AW:0] rptr_gry;
   // Changing rptr to gray code to prepare for synchronization
   bin2gry #(/*AUTOINSTPARAM*/
	     // Parameters
	     .DW			(AW+1))			 // Templated
   u_rptr (/*AUTOINST*/
	   // Outputs
	   .gry				(rptr_gry[AW:0]),	 // Templated
	   // Inputs
	   .bin				(rptr[AW:0]));		 // Templated

   assign rcrnt = rptr[AW-1:0];   
   
   always @(posedge rclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     dat_o <= {DW{1'b0}};
	     // End of automatics
	  end
	else if(ren & !empty)
	  begin
	     dat_o <= RAM[rcrnt];
	  end
     end

   // Sync For Write Pointer
   reg [AW:0] wptr1;
   always @(posedge rclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     wptr1 <= {(1+(AW)){1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     wptr1 <= wptr_gry;
	  end
     end

   wire [AW:0] wptr1_bin;
   // Changing synchronized wptr back to binary
   gry2bin #(/*AUTOINSTPARAM*/
	     // Parameters
	     .DW			(AW+1))			 // Templated
   u_wptr1 (/*AUTOINST*/
	    // Outputs
	    .bin			(wptr1_bin[AW:0]),	 // Templated
	    // Inputs
	    .gry			(wptr1[AW:0]));		 // Templated

   
   always @(/*AUTOSENSE*/rptr or rst_i or wptr1_bin)
     if(rst_i)
       empty <= 1'h1;
   /*AUTORESET*/
       else
	 empty <= ((rptr[AW] ~^ wptr1_bin[AW]) & (rptr[AW-1:0] == wptr1_bin[AW-1:0]));
   
   // Write Clock Domain
   // Write Pointer, Up Counter
   reg [AW:0] 	wptr;
   wire [AW-1:0] 	wcrnt;
   

   always @(posedge wclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     wptr <= {(1+(AW)){1'b0}};
	     // End of automatics
	  end
	else if(wen & !full) // Load
	  wptr <= wptr + 1'b1;
     end // always @ (posedge wclk or posedge rst_i)

   wire [AW:0] wptr_gry;
   // Changing wptr to Gray to prepare for synchronization
   bin2gry #(/*AUTOINSTPARAM*/
	     // Parameters
	     .DW			(AW+1))			 // Templated
   u_wptr (/*AUTOINST*/
	   // Outputs
	   .gry				(wptr_gry[AW:0]),	 // Templated
	   // Inputs
	   .bin				(wptr[AW:0]));		 // Templated
 
   assign wcrnt = wptr[AW-1:0];
   
   always @(posedge wclk )
     if (wen & !full)
       RAM[wcrnt] <= dat_i;

   // Sync For Read Pointer
   reg [AW:0] rptr1;
   always @(posedge wclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rptr1 <= {(1+(AW)){1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     rptr1 <= rptr_gry;
	  end
     end

   wire [AW:0] rptr1_bin;
   // Changing synchronized rptr back to binary
   gry2bin #(/*AUTOINSTPARAM*/
	     // Parameters
	     .DW			(AW+1))			 // Templated
   u_rptr1 (/*AUTOINST*/
	    // Outputs
	    .bin			(rptr1_bin[AW:0]),	 // Templated
	    // Inputs
	    .gry			(rptr1[AW:0]));		 // Templated


   always @(/*AUTOSENSE*/rptr1_bin or rst_i or wptr)
     if(rst_i)
       /*AUTORESET*/
       // Beginning of autoreset for uninitialized flops
       full <= 1'h0;
       // End of automatics
       else
	 full <= ((wptr[AW] ^ rptr1_bin[AW]) & (wptr[AW-1:0] == rptr1_bin[AW-1:0]));

endmodule // fifo

// Local Variables:
// verilog-library-directories:("." "../../rtl/bin2gry/")
// verilog-library-files:("")
// End:


   /* bin2gry AUTO_TEMPLATE (
    .DW			(AW+1),
    .gry		(@"(substring vl-cell-name 2)"_gry[AW:0]),
    .bin		(@"(substring vl-cell-name 2)"[AW:0]),
    );
    */

   /* gry2bin AUTO_TEMPLATE (
    .DW			(AW+1),
    .gry		(@"(substring vl-cell-name 2)"[AW:0]),
    .bin		(@"(substring vl-cell-name 2)"_bin[AW:0]),
    );
    */
