module arbiter_TB (/*AUTOARG*/);


   parameter N = 4;
   
  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg [N-1:0]		RQT;			// To arbiter0 of arbiter.v
  reg			clk_i;			// To arbiter0 of arbiter.v
  reg			rst_i;			// To arbiter0 of arbiter.v
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [N-1:0]		GNT;			// From arbiter0 of arbiter.v
   // End of automatics

   arbiter #(/*AUTOINSTPARAM*/
	     // Parameters
	     .N				(N))
   arbiter0 (/*AUTOINST*/
	     // Outputs
	     .GNT			(GNT[N-1:0]),
	     // Inputs
	     .RQT			(RQT[N-1:0]),
	     .clk_i			(clk_i),
	     .rst_i			(rst_i));
   
 


   // Clock Generation
   always #1 clk_i <= ~clk_i;
   always #9 RQT <= $random;
   
   
   
   initial begin
      $dumpfile("output.vcd");
      $dumpvars(0,arbiter_TB);

      rst_i <= 1;
      clk_i <= $random;
      RQT <=  4'hA;
      #4 rst_i <= 0;
      #80 $finish;
      
   end
 
endmodule // fifo_TB



// Local Variables:
// verilog-library-directories:("." "../../rtl/arbiter/")
// verilog-library-files:("")
// End:
