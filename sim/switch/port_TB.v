module port_TB (/*AUTOARG*/);

   parameter  DW = 4;// Data Width
   parameter  AW = 2;// Defining Fifo Width to be 4

  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg			ackrx;			// To port0 of port.v
  reg [1:0]		adr_i;			// To port0 of port.v
  reg			clk_i;			// To port0 of port.v
  reg [DW-1:0]		dat_i;			// To port0 of port.v
  reg [DW-1:0]		fifo_i;			// To port0 of port.v
  reg			rst_i;			// To port0 of port.v
  reg			validtx;		// To port0 of port.v
  reg			wen;			// To port0 of port.v
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			acktx;			// From port0 of port.v
   wire [DW-1:0]	dat_o;			// From port0 of port.v
   wire			full;			// From port0 of port.v
   wire			validrx1;		// From port0 of port.v
   // End of automatics

   port #(/*AUTOINSTPARAM*/
	  // Parameters
	  .DW				(DW),
	  .AW				(AW))
   port0 (/*AUTOINST*/
	  // Outputs
	  .acktx			(acktx),
	  .dat_o			(dat_o[DW-1:0]),
	  .validrx1			(validrx1),
	  .full				(full),
	  // Inputs
	  .dat_i			(dat_i[DW-1:0]),
	  .adr_i			(adr_i[1:0]),
	  .validtx			(validtx),
	  .ackrx			(ackrx),
	  .rst_i			(rst_i),
	  .clk_i			(clk_i),
	  .fifo_i			(fifo_i[DW-1:0]),
	  .wen				(wen));

   reg 			ex_clk;
   reg [1:0] 		sample;
   
   always @(posedge ex_clk)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     sample <= 2'h0;
	     // End of automatics
	  end
	else
	  begin
	     sample <= {sample[0], validrx1};
	  end
     end

   wire pedge;
   assign pedge = ~sample[1] & sample[0];
   
   wire nedge;
   assign nedge = sample[1] & ~sample[0];


   reg 	busy;
   
   always @(posedge ex_clk)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     ackrx <= 1'h0;
	     // End of automatics
	  end
	else 
	  ackrx <= validrx1 & ~busy;
     end



   // Clock Generation
   always #5 clk_i <= ~clk_i;
   always #7 ex_clk <= ~ex_clk;

   always #9 dat_i <= $random;
   always #9 adr_i <= $random;
   always #9 fifo_i <= $random;
   
   
   
   
   always @(/*AUTOSENSE*/full or rst_i or wdis)
     if(full | rst_i | wdis)
       wen <= 1'b0;
     else
       wen <= 1'b1;

   reg 			wdis, rdis;
   
   
   initial begin
      $dumpfile("output.vcd");
      $dumpvars(0,port_TB);

      clk_i <= $random;
      ex_clk <= $random;
      rst_i <= 0;
      busy <=0;
      
      #8 rst_i <= 1;
      #8 rst_i <= 0;

      #50 busy <= 1;
      #50 busy <=0;
      
	wdis <= 1;
      
      #200 $finish;
      
   end
 
endmodule // fifo_TB



// Local Variables:
// verilog-library-directories:("." "../../rtl/switch/")
// verilog-library-files:("")
// End:
