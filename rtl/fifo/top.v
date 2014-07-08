/*
*/ 

module top(/*AUTOARG*/
   // Outputs
   full, empty, dat_o,
   // Inputs
   rst_i, push1, push0, dat_i, clk_i
   );

   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		clk_i;			// To u_wclk of clkgen.v, ...
   input [DW-1:0]	dat_i;			// To fifo0 of fifo.v
   input		push0;			// To u0w of debouncer.v
   input		push1;			// To u1r of debouncer.v
   input		rst_i;			// To fifo0 of fifo.v, ...
   // End of automatics
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output [DW-1:0]	dat_o;			// From fifo0 of fifo.v
   output		empty;			// From fifo0 of fifo.v
   output		full;			// From fifo0 of fifo.v
   // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			rclk;			// From u_rclk of clkgen.v
   wire			ren;			// From u1r of debouncer.v
   wire			wclk;			// From u_wclk of clkgen.v
   wire			wen;			// From u0w of debouncer.v
   // End of automatics

   parameter DW = 4;// Data Width 
   parameter AW = 2; // Address Width. FIFO DEPTH = 2^AW

   parameter CLKIN = 50;
   parameter wclk_CLKOUT = 25;
   parameter rclk_CLKOUT = 12.5;
   parameter w_n = 17;
   parameter r_n = 16;
   

   fifo #(/*AUTOINSTPARAM*/
	  // Parameters
	  .DW				(DW),
	  .AW				(AW))
   fifo0 (/*AUTOINST*/
	  // Outputs
	  .full				(full),
	  .dat_o			(dat_o[DW-1:0]),
	  .empty			(empty),
	  // Inputs
	  .dat_i			(dat_i[DW-1:0]),
	  .wclk				(wclk),
	  .wen				(wen),
	  .rclk				(rclk),
	  .ren				(ren),
	  .rst_i			(rst_i));
  
   clkgen #(/*AUTOINSTPARAM*/
	    // Parameters
	    .CLKIN			(CLKIN),		 // Templated
	    .CLKOUT			(wclk_CLKOUT))		 // Templated
   u_wclk (/*AUTOINST*/
	   // Outputs
	   .clk_o			(wclk),			 // Templated
	   // Inputs
	   .clk_i			(clk_i),		 // Templated
	   .rst_i			(rst_i));		 // Templated

   clkgen #(/*AUTOINSTPARAM*/
	    // Parameters
	    .CLKIN			(CLKIN),		 // Templated
	    .CLKOUT			(rclk_CLKOUT))		 // Templated
   u_rclk (/*AUTOINST*/
	   // Outputs
	   .clk_o			(rclk),			 // Templated
	   // Inputs
	   .clk_i			(clk_i),		 // Templated
	   .rst_i			(rst_i));		 // Templated
  
   debouncer #(/*AUTOINSTPARAM*/
	       // Parameters
	       .n			(w_n))			 // Templated
   u0w (/*AUTOINST*/
	// Outputs
	.pulse				(wen),			 // Templated
	// Inputs
	.clk_i				(wclk),			 // Templated
	.rst_i				(rst_i),		 // Templated
	.push				(push0));		 // Templated

   debouncer #(/*AUTOINSTPARAM*/
	       // Parameters
	       .n			(r_n))			 // Templated
   u1r (/*AUTOINST*/
	// Outputs
	.pulse				(ren),			 // Templated
	// Inputs
	.clk_i				(rclk),			 // Templated
	.rst_i				(rst_i),		 // Templated
	.push				(push1));		 // Templated
  

endmodule // fifo

// Local Variables:
// verilog-library-directories:("." "../../rtl/bin2gry/"  "../../rtl/lab/"   "../../rtl/debouncer/")
// verilog-library-files:("")
// End:


   /* clkgen AUTO_TEMPLATE (
    .CLKIN			(CLKIN),
    .CLKOUT			(@"(substring vl-cell-name 2)"_CLKOUT),
    .clk_o			(@"(substring vl-cell-name 2)"),
    .clk_i			(clk_i),
    .rst_i			(rst_i),
    );
    */


   /* debouncer AUTO_TEMPLATE (
    .n			(@"(substring vl-cell-name 2)"_n),
    .pulse			(@"(substring vl-cell-name 2)"en),
    .clk_i			(@"(substring vl-cell-name 2)"clk),
    .rst_i			(rst_i),
    .push			(push@),
    );
    */
