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
   dat_i, wclk, rclk, rst_i
   );

   parameter WIDTH = 4;
   parameter DEPTH = 2; // Power of 2

   // Write Side
   input [WIDTH-1:0] dat_i;
   input 	       wclk;
   output 	       full;

   // Read Side
   output [WIDTH-1:0]  dat_o;
   input 	       rclk;
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
   reg [DEPTH-1:0] 	rptr;

   always @(posedge rclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rptr <= {DEPTH{1'b0}};
	     // End of automatics
	  end
	else if(!empty) // Load
	  rptr <= rptr + 1'b1;
     end

   assign dat_o = RAM[rptr];
   
   // Sync For Write Pointer
   reg [DEPTH-1:0] wptr1, wptr2;
   
   always @(posedge rclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     wptr1 <= {DEPTH{1'b0}};
	     wptr2 <= {DEPTH{1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     wptr2 <= wptr1;
	     wptr1 <= wptr;
	  end
     end

   always @(posedge rclk or posedge rst_i)
     if(rst_i)
       empty <= 1'h1;
	  /*AUTORESET*/
       else
	 empty <= (rptr == wptr2);
   
   // Write Clock Domain
   // Write Pointer, Up Counter
   reg [DEPTH-1:0] 	wptr;

   always @(posedge wclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     wptr <= {DEPTH{1'b0}};
	     // End of automatics
	  end
	else if(!full) // Load
	  wptr <= wptr + 1'b1;
     end // always @ (posedge wclk or posedge rst_i)
   

   always @(posedge wclk )
     if (!full)
       RAM[wptr] <= dat_i;


   // Sync For Read Pointer
   reg [DEPTH-1:0] rptr1, rptr2;
   
   always @(posedge wclk or posedge rst_i)
     begin
	if(rst_i)
	  begin
	     rptr1 <= {DEPTH{1'b1}};
	     rptr2 <= {DEPTH{1'b1}};

	     /*AUTORESET*/
	  end
	else
	  begin
	     rptr2 <= rptr1;
	     rptr1 <= rptr;
	  end
     end

   always @(posedge wclk or posedge rst_i)
     if(rst_i)
	  /*AUTORESET*/
	  // Beginning of autoreset for uninitialized flops
	  full <= 1'h0;
	  // End of automatics
       else
	 full <= (wptr == rptr2);
 
endmodule // fifo


