module pnser_TB (/*AUTOARG*/);

   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg			clk_i;			// To pnser0 of pnser.v
   reg [31:0]		rnd_i;			// To pnser0 of pnser.v
   reg [4:0]		rnd_len;		// To pnser0 of pnser.v
   reg			rst_i;			// To pnser0 of pnser.v
   // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			ack;			// From pnser0 of pnser.v
   wire			dat_o;			// From pnser0 of pnser.v
   // End of automatics

   pnser #(/*AUTOINSTPARAM*/)
   pnser0 (/*AUTOINST*/
	   // Outputs
	   .ack				(ack),
	   .dat_o			(dat_o),
	   // Inputs
	   .rnd_i			(rnd_i[31:0]),
	   .rnd_len			(rnd_len[4:0]),
	   .clk_i			(clk_i),
	   .rst_i			(rst_i));
   
 


   // Clock Generation
   
   always #5 clk_i <= !clk_i;

   initial begin
      $dumpfile("output.vcd");
      $dumpvars(0,pnser_TB);

      clk_i <= $random;
      #10 rst_i <= 1;
      #20 rst_i <= 0;

      rnd_i <= 32'h000000AB;
      rnd_len <= 5'h8;

      #100 rnd_i <= 32'h000009AB;
      rnd_len <= 5'hC;

      #300 $finish;
      


   end
   

endmodule // pnser

// Local Variables:
// verilog-library-directories:("." "../../rtl/assign0/")
// verilog-library-files:("")
// End:

