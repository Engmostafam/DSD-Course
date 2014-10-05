module top_TB (/*AUTOARG*/);

   parameter DW = 4;// Data Width 
   parameter AW = 2; // Address Width. FIFO DEPTH = 2^AW

   parameter CLKIN = 50;
   parameter wclk_CLKOUT = 25;
   parameter rclk_CLKOUT = 10;
   parameter w_n = 18;
   parameter r_n = 17;
   
  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg			clk_i;			// To top0 of top.v
  reg [DW-1:0]		dat_i;			// To top0 of top.v
  reg			push0;			// To top0 of top.v
  reg			push1;			// To top0 of top.v
  reg			rst_i;			// To top0 of top.v
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [DW-1:0]	dat_o;			// From top0 of top.v
   wire			empty;			// From top0 of top.v
   wire			full;			// From top0 of top.v
   // End of automatics

   top #(/*AUTOINSTPARAM*/
	 // Parameters
	 .DW				(DW),
	 .AW				(AW),
	 .CLKIN				(CLKIN),
	 .wclk_CLKOUT			(wclk_CLKOUT),
	 .rclk_CLKOUT			(rclk_CLKOUT),
	 .w_n				(w_n),
	 .r_n				(r_n))
   top0 (/*AUTOINST*/
	 // Outputs
	 .dat_o				(dat_o[DW-1:0]),
	 .empty				(empty),
	 .full				(full),
	 // Inputs
	 .clk_i				(clk_i),
	 .dat_i				(dat_i[DW-1:0]),
	 .push0				(push0),
	 .push1				(push1),
	 .rst_i				(rst_i));
   
 


   // Clock Generation
   always #5 clk_i <= ~clk_i;
   always #9 dat_i <= $random;
   
   
   
   initial begin
      $dumpfile("output.vcd");
      $dumpvars(0,top_TB);

      rst_i <= 0;
      #200 $finish;
      
   end
 
endmodule // fifo_TB



// Local Variables:
// verilog-library-directories:("." "../../rtl/fifo/")
// verilog-library-files:("")
// End:
