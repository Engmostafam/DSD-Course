module clkgen_TB (/*AUTOARG*/);

  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg			clk_i;			// To clkgen0 of clkgen.v
  reg			rst_i;			// To clkgen0 of clkgen.v
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk_o;			// From clkgen0 of clkgen.v
   // End of automatics

   parameter CLKIN = 50;
   parameter CLKOUT = 10;
   
   clkgen #(/*AUTOINSTPARAM*/
	    // Parameters
	    .CLKIN			(CLKIN),
	    .CLKOUT			(CLKOUT))
   clkgen0 (/*AUTOINST*/
	    // Outputs
	    .clk_o			(clk_o),
	    // Inputs
	    .clk_i			(clk_i),
	    .rst_i			(rst_i));
   
 


   // Clock Generation
   
   always #5 clk_i <= !clk_i;

   initial begin
      $dumpfile("output.vcd");
      $dumpvars(0,clkgen_TB);
//      $display (DIVIDE);
      

      clk_i <= $random;
      #10 rst_i <= 1;
      #20 rst_i <= 0;
      #200 $finish;
      
   end
 
endmodule // stpmtr_TB


// Local Variables:
// verilog-library-directories:("." "../../rtl/lab/")
// verilog-library-files:("")
// End:
