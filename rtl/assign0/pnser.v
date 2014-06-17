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

   localparam HEADER=4'b1101;
   localparam FOOTER=4'b0101;
   
   localparam idle=2'b00;
   localparam read=2'b01; // Read Random number generator
   localparam srld=2'b10; // Serially output header & data
   localparam srlf=2'b11; // serially output footer
   

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			ack;
   // End of automatics

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
   
   always @(/*AUTOSENSE*/cnt or state)
     begin
	case (state)
	  idle : next_state <= read;
	  read : next_state <= srld;
	  srld : next_state <= (~|cnt) ? srlf : srld;
	  srlf : next_state <= (~|cnt) ? read : srlf;
	endcase // case (state)
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
	else if(state == read) // Load
	  cnt <= rlength + 3'h4;
	else if ((state == srld) & (~|cnt))
	  cnt <= 3'h4;
	else if ((state == srld) | (state == srlf))
	  cnt <= cnt - 1'b1;
     end

   wire fread;
   assign fread = (state == idle) | ((state == srlf) & (~|cnt)) ;
   
   // ACK signal

   always @(posedge clk_i)
     if(rst_i)
       /*AUTORESET*/
       // Beginning of autoreset for uninitialized flops
       ack <= 1'h0;
       // End of automatics
     else if (fread)
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
     else if (fread)
       begin
	  rdata <= rnd_i;
	  rlength <= rnd_len;
       end

   // Shift registers

   reg [36:0] rhnd; // Header & Data shift register
   
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rhnd <= 37'h0;
	     // End of automatics
	  end
	else if (state == read)
	  rhnd <= {HEADER,rdata};
	else if (state == srld)
	  rhnd <= {rhnd[35:0], 1'b0};
     end

   reg [4:0] rfoot; // Footer Shift register
   
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rfoot <= 5'h0;
	     // End of automatics
	  end
	else if (state == srlf)
	  rfoot <= {rfoot[3:0] , rfoot[4]};
     end

   assign dat_o = (state == srlf)? rfoot[4] : rhnd[36];
   
   
 
endmodule // pnser

