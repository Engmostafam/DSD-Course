/*
 - Asynchronous concurrent FIFO
 - Has no internal running clock
 - All resets need to be Asynchronous to account for the absence of a free running general clock 
 - Two Clock domains exist, Read Clock and Write Clock 
 - Read and Write Pointers are passed through two FFs for synchronization when being used at the other clock domain
 - Full condition is wptr = rdptr-2 to account for any delay and make use of synchronization possible delays
 - Empty condition is similar 
*/ 

module fifo (/*AUTOARG*/
   // Outputs
   full, dat_o, empty,
   // Inputs
   dat_i, wclk, wen, rclk, ren, rst_i
   );

   parameter WIDTH = 4;
   parameter DEPTH = 2; // Power of 2

   // Write Side
   input [WIDTH-1:0] dat_i;
   input 	       wclk;
   input 	       wen;
   output 	       full;

   // Read Side
   output [WIDTH-1:0]  dat_o;
   input 	       rclk;
   input 	       ren;
   output 	       empty;

   input 	       rst_i;
   
   reg [WIDTH-1:0]   RAM[(1<<DEPTH)-1:0];
   
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			empty;
   reg			full;
   // End of automatics

   // Read Clock Domain
   // Read Pointer, Up Counter
   reg [DEPTH:0] 	rptr; // MSB not an address
   wire [DEPTH-1:0] 	rcrnt; // Current read address
   
   always @(posedge rclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rptr <= {(1+(DEPTH)){1'b0}};
	     // End of automatics
	  end
	else if(ren & !empty) // Load
	  rptr <= rptr + 1'b1;
     end // always @ (posedge rclk or posedge rst_i)

   assign rcrnt = rptr[DEPTH-1:0];
   
   assign dat_o = RAM[rcrnt];
   
   // Sync For Write Pointer
   reg [DEPTH:0] wptr1, wptr2;
   
   always @(posedge rclk or posedge rst_i)
     begin
	if(rst_i)
	  begin

	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     wptr1 <= {(1+(DEPTH)){1'b0}};
	     wptr2 <= {(1+(DEPTH)){1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     wptr2 <= wptr1;
	     wptr1 <= wptr;
	  end
     end


   always @(/*AUTOSENSE*/rptr or rst_i or wptr1)
     if(rst_i)
       empty <= 1'h1;
   /*AUTORESET*/
       else
	 empty <= ((rptr[DEPTH] ~^ wptr1[DEPTH]) & (rptr[DEPTH-1:0] == wptr1[DEPTH-1:0]));
   

   // Write Clock Domain
   // Write Pointer, Up Counter
   reg [DEPTH:0] 	wptr;
   wire [DEPTH-1:0] 	wcrnt;
   

   always @(posedge wclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     wptr <= {(1+(DEPTH)){1'b0}};
	     // End of automatics
	  end
	else if(wen & !full) // Load
	  wptr <= wptr + 1'b1;
     end // always @ (posedge wclk or posedge rst_i)
 
   assign wcrnt = wptr[DEPTH-1:0];
   

   always @(posedge wclk )
     if (wen & !full)
       RAM[wcrnt] <= dat_i;


   // Sync For Read Pointer
   reg [DEPTH:0] rptr1, rptr2;
   
   always @(posedge wclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rptr1 <= {(1+(DEPTH)){1'b0}};
	     rptr2 <= {(1+(DEPTH)){1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     rptr2 <= rptr1;
	     rptr1 <= rptr;
	  end
     end


   always @(/*AUTOSENSE*/rptr1 or rst_i or wptr)
     if(rst_i)
       /*AUTORESET*/
       // Beginning of autoreset for uninitialized flops
       full <= 1'h0;
       // End of automatics
       else
	 full <= ((wptr[DEPTH] ^ rptr1[DEPTH]) & (wptr[DEPTH-1:0] == rptr1[DEPTH-1:0]));

endmodule // fifo


