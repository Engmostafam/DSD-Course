/*
 - Synchronization between the packetizer and the device being tested (deserializer) is achieved through the header and footer
 
 - An ACK signal is needed to synchronize with the random number generator. This is important so that the random number generator knows when to generate new data. 
*/ 

module pnser (/*AUTOARG*/
   // Outputs
   ack, dat_o,
   // Inputs
   rnd_i, rnd_len, clk_i, rst_i
   );

   // Random Number generator interface
   input [31:0] rnd_i;
   input [4:0] 	rnd_len;
   output 	ack;

   // Deserializer interface
   output 	dat_o;

   // Control Signals
   input 	clk_i;
   input 	rst_i;

   localparam idle=2'b00;
   localparam read=2'b01;
   localparam srlz=2'b10;
   

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			ack;
   reg			dat_o;
   // End of automatics

   // STATE MACHINE
   reg [1:0] 		state;
   
   always @(posedge clk_i)
     if(rst_i)
       /*AUTORESET*/
       // Beginning of autoreset for uninitialized flops
       state <= 2'h0;
       // End of automatics
     else
       state <= next_state;

   reg [1:0] 		next_state;
   
   always @(/*AUTOSENSE*/cnt or state)
     begin
	case (state)
	  idle : next_state <= read;
	  read : next_state <= srlz;
	  srlz : next_state <= (~|cnt) ? read : srlz;
	  default : next_state <= idle;
	endcase // case (state)
     end

   // ACK signal

   always @(posedge clk_i)
     if(rst_i)
       /*AUTORESET*/
       // Beginning of autoreset for uninitialized flops
       ack <= 1'h0;
       // End of automatics
     else if ((state == srlz) & (~|cnt))
       ack <= 1'b1;
     else 
       ack <= 1'b0;
   
   // Input registers

   reg [31:0] rdata;
   reg [4:0]  rlength;
   
   always @(posedge clk_i)
     if(rst_i)
       begin
	  /*AUTORESET*/
	  // Beginning of autoreset for uninitialized flops
	  rdata <= 32'h0;
	  rlength <= 5'h0;
	  // End of automatics
       end
     else if ((state == srlz) & (~|cnt))
       begin
	  rdata <= rnd_i;
	  rlength <= rnd_len;
       end

   
 
endmodule // pnser

