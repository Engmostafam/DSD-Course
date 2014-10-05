
module stpmtr_TB (/*AUTOARG*/);

  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg			clk_i;			// To stpmtr0 of stpmtr.v
  reg [7:0]		pos_i;			// To stpmtr0 of stpmtr.v
  reg			rst_i;			// To stpmtr0 of stpmtr.v
  reg			valid;			// To stpmtr0 of stpmtr.v
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			ack;			// From stpmtr0 of stpmtr.v
   wire			dir;			// From stpmtr0 of stpmtr.v
   wire			pulse;			// From stpmtr0 of stpmtr.v
   // End of automatics

   stpmtr #(/*AUTOINSTPARAM*/)
   stpmtr0 (/*AUTOINST*/
	    // Outputs
	    .ack			(ack),
	    .dir			(dir),
	    .pulse			(pulse),
	    // Inputs
	    .clk_i			(clk_i),
	    .rst_i			(rst_i),
	    .pos_i			(pos_i[7:0]),
	    .valid			(valid));
   
 


   // Clock Generation
   
   always #5 clk_i <= !clk_i;

   initial begin
      $dumpfile("output.vcd");
      $dumpvars(0,stpmtr_TB);

      clk_i <= $random;
      valid <= 0;
      #10 rst_i <= 1;
      #20 rst_i <= 0;

      pos_i <= 8'h03;
      #10
	valid <= 1;
      #10
	valid <= 0;

      #30
	valid <= 1;
      pos_i <= 8'h8;

      #200 valid <= 0;

      #50 valid <= 1;
      pos_i <= 8'h5;

      #30 valid <= 0;
      
      #200 $finish;
      
   end
 
endmodule // stpmtr_TB


// Local Variables:
// verilog-library-directories:("." "../../rtl/stepper_motor/")
// verilog-library-files:("")
// End:
