module r_device (/*AUTOARG*/
   // Outputs
   adr_i, dat_i, validtx, ackrx,
   // Inputs
   acktx, validrx, clk_i, rst_i
   );

   parameter DW = 4;// Data Width

   output [2:0] 		adr_i;
   output [DW-1:0] 		dat_i;			
   output			validtx;		
   input			acktx;			

   output			ackrx;			
   input			validrx;		
   
   input			clk_i;			
   input			rst_i;
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			ackrx;
   reg [DW-1:0]		dat_i;
   reg			validtx;
   // End of automatics
   
   reg 			busy;
   reg 			write;

   
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     ackrx <= 1'h0;
	     // End of automatics
	  end
	else if (ackrx)
	  ackrx <= validrx;
	else
	  ackrx <= validrx & ~busy;
     end // always @ (posedge ex_clk)


   
   always @(posedge clk_i)
     begin
	if(rst_i)
	  /*AUTORESET*/
	  // Beginning of autoreset for uninitialized flops
	  validtx <= 1'h0;
	  // End of automatics
	else if(acktx)
	  validtx <= 1'b0;
	else if(write | validtx)
	  validtx <= 1'b1;
	else 
	  validtx <= 1'b0;
     end

   wire [2:0] adr_i;
   assign adr_i = (adr[1:0] == 2'b11)? {adr[2],2'b00} : adr[2:0];

   reg [2:0] adr;
   
   always #9 dat_i <= $random;
   always #9 adr <= $random;
   always #9 busy <= $random;
   always #9 write <= $random;
   
   
endmodule // device


// Local Variables:
// verilog-library-directories:("." "../../rtl/switch/")
// verilog-library-files:("")
// End:
