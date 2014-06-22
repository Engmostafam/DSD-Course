/*
 - Clock signal is expected to be 1 KHZ
 - Position register provides an Absolute position from 0 to 240. 
 - Acknowledge signal is only sent after the curret rotation is complete
 - Clockwise is 1 and Counter clock wise is 0. 
*/ 

module stpmtr (/*AUTOARG*/
   // Outputs
   ack, dir, pulse,
   // Inputs
   clk_i, rst_i, pos_i, valid
   );

   // General
   input clk_i;
   input rst_i;
   
   // Circuit interface
   input [7:0] pos_i;   
   input       valid;
   output      ack;

   // Motor Interface
   output      dir;
   output      pulse;

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			ack;
   reg			pulse;
   // End of automatics
   
   // Position register
   reg [7:0]   rPOS;

   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rPOS <= 8'h0;
	     // End of automatics
	  end
	else if(valid & fDONE)
	  begin
	     rPOS <= pos_i;
	  end
     end

   // Acknowledge Signal
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     ack <= 1'h0;
	     // End of automatics
	  end
	else if (fDONE)
	  begin
	     ack <= valid & !ack;
	  end
     end

   // Flags
   wire fDONE;
   wire fCW;
   wire fCCW;

   assign fDONE = (count == rPOS);
   assign fCW = (count > rPOS);
   assign fCCW = !fDONE & !fCW;
   
   
   //Counter , Up-down Counter, 8-bit

   reg [7:0] count;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     count <= 8'h0;
	     // End of automatics
	  end
	else if (fCW)
	  begin
	     count <= count -1'b1;
	  end
	else if (fCCW)
	  begin
	     count <= count +1'b1;
	  end
     end

   reg dir;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     dir <= 1'h0;
	     // End of automatics
	  end
	else 
	  begin
	     dir <= fCW;
	  end
     end // always @ (posedge clk_i)

   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     pulse <= 1'h0;
	     // End of automatics
	  end
	else 
	  begin
	     pulse <= ~pulse;
	  end
     end

endmodule // stpmtr


