module switch_TB (/*AUTOARG*/);

   parameter DW = 4;// Data Width
   parameter DEPTH = 2;// Defining Fifo Width to be 4

  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg			clk_i;			// To switch0 of switch.v
  reg			ex_clk;			// To D0X of device.v, ...
  reg			rst_i;			// To switch0 of switch.v, ...
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			X_ackrx_0;		// From D0X of device.v
   wire			X_ackrx_1;		// From D1X of device.v
   wire			X_ackrx_2;		// From D2X of device.v
   wire			X_ackrx_3;		// From D3X of device.v
   wire			X_acktx_0;		// From switch0 of switch.v
   wire			X_acktx_1;		// From switch0 of switch.v
   wire			X_acktx_2;		// From switch0 of switch.v
   wire			X_acktx_3;		// From switch0 of switch.v
   wire [1:0]		X_adr_i_0;		// From D0X of device.v
   wire [1:0]		X_adr_i_1;		// From D1X of device.v
   wire [1:0]		X_adr_i_2;		// From D2X of device.v
   wire [1:0]		X_adr_i_3;		// From D3X of device.v
   wire [DW-1:0]	X_dat_i_0;		// From D0X of device.v
   wire [DW-1:0]	X_dat_i_1;		// From D1X of device.v
   wire [DW-1:0]	X_dat_i_2;		// From D2X of device.v
   wire [DW-1:0]	X_dat_i_3;		// From D3X of device.v
   wire [DW-1:0]	X_dat_o_0;		// From switch0 of switch.v
   wire [DW-1:0]	X_dat_o_1;		// From switch0 of switch.v
   wire [DW-1:0]	X_dat_o_2;		// From switch0 of switch.v
   wire [DW-1:0]	X_dat_o_3;		// From switch0 of switch.v
   wire			X_validrx_0;		// From switch0 of switch.v
   wire			X_validrx_1;		// From switch0 of switch.v
   wire			X_validrx_2;		// From switch0 of switch.v
   wire			X_validrx_3;		// From switch0 of switch.v
   wire			X_validtx_0;		// From D0X of device.v
   wire			X_validtx_1;		// From D1X of device.v
   wire			X_validtx_2;		// From D2X of device.v
   wire			X_validtx_3;		// From D3X of device.v
   wire			Y_ackrx_0;		// From D0Y of device.v
   wire			Y_ackrx_1;		// From D1Y of device.v
   wire			Y_ackrx_2;		// From D2Y of device.v
   wire			Y_ackrx_3;		// From D3Y of device.v
   wire			Y_acktx_0;		// From switch0 of switch.v
   wire			Y_acktx_1;		// From switch0 of switch.v
   wire			Y_acktx_2;		// From switch0 of switch.v
   wire			Y_acktx_3;		// From switch0 of switch.v
   wire [1:0]		Y_adr_i_0;		// From D0Y of device.v
   wire [1:0]		Y_adr_i_1;		// From D1Y of device.v
   wire [1:0]		Y_adr_i_2;		// From D2Y of device.v
   wire [1:0]		Y_adr_i_3;		// From D3Y of device.v
   wire [DW-1:0]	Y_dat_i_0;		// From D0Y of device.v
   wire [DW-1:0]	Y_dat_i_1;		// From D1Y of device.v
   wire [DW-1:0]	Y_dat_i_2;		// From D2Y of device.v
   wire [DW-1:0]	Y_dat_i_3;		// From D3Y of device.v
   wire [DW-1:0]	Y_dat_o_0;		// From switch0 of switch.v
   wire [DW-1:0]	Y_dat_o_1;		// From switch0 of switch.v
   wire [DW-1:0]	Y_dat_o_2;		// From switch0 of switch.v
   wire [DW-1:0]	Y_dat_o_3;		// From switch0 of switch.v
   wire			Y_validrx_0;		// From switch0 of switch.v
   wire			Y_validrx_1;		// From switch0 of switch.v
   wire			Y_validrx_2;		// From switch0 of switch.v
   wire			Y_validrx_3;		// From switch0 of switch.v
   wire			Y_validtx_0;		// From D0Y of device.v
   wire			Y_validtx_1;		// From D1Y of device.v
   wire			Y_validtx_2;		// From D2Y of device.v
   wire			Y_validtx_3;		// From D3Y of device.v
   // End of automatics

   switch #(/*AUTOINSTPARAM*/
	    // Parameters
	    .DW				(DW),
	    .DEPTH			(DEPTH))
   switch0 (/*AUTOINST*/
	    // Outputs
	    .X_acktx_0			(X_acktx_0),
	    .X_acktx_1			(X_acktx_1),
	    .X_acktx_2			(X_acktx_2),
	    .X_acktx_3			(X_acktx_3),
	    .X_dat_o_0			(X_dat_o_0[DW-1:0]),
	    .X_dat_o_1			(X_dat_o_1[DW-1:0]),
	    .X_dat_o_2			(X_dat_o_2[DW-1:0]),
	    .X_dat_o_3			(X_dat_o_3[DW-1:0]),
	    .X_validrx_0		(X_validrx_0),
	    .X_validrx_1		(X_validrx_1),
	    .X_validrx_2		(X_validrx_2),
	    .X_validrx_3		(X_validrx_3),
	    .Y_acktx_0			(Y_acktx_0),
	    .Y_acktx_1			(Y_acktx_1),
	    .Y_acktx_2			(Y_acktx_2),
	    .Y_acktx_3			(Y_acktx_3),
	    .Y_dat_o_0			(Y_dat_o_0[DW-1:0]),
	    .Y_dat_o_1			(Y_dat_o_1[DW-1:0]),
	    .Y_dat_o_2			(Y_dat_o_2[DW-1:0]),
	    .Y_dat_o_3			(Y_dat_o_3[DW-1:0]),
	    .Y_validrx_0		(Y_validrx_0),
	    .Y_validrx_1		(Y_validrx_1),
	    .Y_validrx_2		(Y_validrx_2),
	    .Y_validrx_3		(Y_validrx_3),
	    // Inputs
	    .X_ackrx_0			(X_ackrx_0),
	    .X_ackrx_1			(X_ackrx_1),
	    .X_ackrx_2			(X_ackrx_2),
	    .X_ackrx_3			(X_ackrx_3),
	    .X_adr_i_0			(X_adr_i_0[1:0]),
	    .X_adr_i_1			(X_adr_i_1[1:0]),
	    .X_adr_i_2			(X_adr_i_2[1:0]),
	    .X_adr_i_3			(X_adr_i_3[1:0]),
	    .X_dat_i_0			(X_dat_i_0[DW-1:0]),
	    .X_dat_i_1			(X_dat_i_1[DW-1:0]),
	    .X_dat_i_2			(X_dat_i_2[DW-1:0]),
	    .X_dat_i_3			(X_dat_i_3[DW-1:0]),
	    .X_validtx_0		(X_validtx_0),
	    .X_validtx_1		(X_validtx_1),
	    .X_validtx_2		(X_validtx_2),
	    .X_validtx_3		(X_validtx_3),
	    .Y_ackrx_0			(Y_ackrx_0),
	    .Y_ackrx_1			(Y_ackrx_1),
	    .Y_ackrx_2			(Y_ackrx_2),
	    .Y_ackrx_3			(Y_ackrx_3),
	    .Y_adr_i_0			(Y_adr_i_0[1:0]),
	    .Y_adr_i_1			(Y_adr_i_1[1:0]),
	    .Y_adr_i_2			(Y_adr_i_2[1:0]),
	    .Y_adr_i_3			(Y_adr_i_3[1:0]),
	    .Y_dat_i_0			(Y_dat_i_0[DW-1:0]),
	    .Y_dat_i_1			(Y_dat_i_1[DW-1:0]),
	    .Y_dat_i_2			(Y_dat_i_2[DW-1:0]),
	    .Y_dat_i_3			(Y_dat_i_3[DW-1:0]),
	    .Y_validtx_0		(Y_validtx_0),
	    .Y_validtx_1		(Y_validtx_1),
	    .Y_validtx_2		(Y_validtx_2),
	    .Y_validtx_3		(Y_validtx_3),
	    .clk_i			(clk_i),
	    .rst_i			(rst_i));

   device #(/*AUTOINSTPARAM*/
	    // Parameters
	    .DW				(DW))
   D0X (/*AUTOINST*/
	// Outputs
	.adr_i				(X_adr_i_0[1:0]),	 // Templated
	.dat_i				(X_dat_i_0[DW-1:0]),	 // Templated
	.validtx			(X_validtx_0),		 // Templated
	.ackrx				(X_ackrx_0),		 // Templated
	// Inputs
	.acktx				(X_acktx_0),		 // Templated
	.validrx			(X_validrx_0),		 // Templated
	.clk_i				(ex_clk),		 // Templated
	.rst_i				(rst_i));		 // Templated

      device #(/*AUTOINSTPARAM*/
	       // Parameters
	       .DW			(DW))
   D1X (/*AUTOINST*/
	// Outputs
	.adr_i				(X_adr_i_1[1:0]),	 // Templated
	.dat_i				(X_dat_i_1[DW-1:0]),	 // Templated
	.validtx			(X_validtx_1),		 // Templated
	.ackrx				(X_ackrx_1),		 // Templated
	// Inputs
	.acktx				(X_acktx_1),		 // Templated
	.validrx			(X_validrx_1),		 // Templated
	.clk_i				(ex_clk),		 // Templated
	.rst_i				(rst_i));		 // Templated

      device #(/*AUTOINSTPARAM*/
	       // Parameters
	       .DW			(DW))
   D2X (/*AUTOINST*/
	// Outputs
	.adr_i				(X_adr_i_2[1:0]),	 // Templated
	.dat_i				(X_dat_i_2[DW-1:0]),	 // Templated
	.validtx			(X_validtx_2),		 // Templated
	.ackrx				(X_ackrx_2),		 // Templated
	// Inputs
	.acktx				(X_acktx_2),		 // Templated
	.validrx			(X_validrx_2),		 // Templated
	.clk_i				(ex_clk),		 // Templated
	.rst_i				(rst_i));		 // Templated

      device #(/*AUTOINSTPARAM*/
	       // Parameters
	       .DW			(DW))
   D3X (/*AUTOINST*/
	// Outputs
	.adr_i				(X_adr_i_3[1:0]),	 // Templated
	.dat_i				(X_dat_i_3[DW-1:0]),	 // Templated
	.validtx			(X_validtx_3),		 // Templated
	.ackrx				(X_ackrx_3),		 // Templated
	// Inputs
	.acktx				(X_acktx_3),		 // Templated
	.validrx			(X_validrx_3),		 // Templated
	.clk_i				(ex_clk),		 // Templated
	.rst_i				(rst_i));		 // Templated

      device #(/*AUTOINSTPARAM*/
	       // Parameters
	       .DW			(DW))
   D0Y (/*AUTOINST*/
	// Outputs
	.adr_i				(Y_adr_i_0[1:0]),	 // Templated
	.dat_i				(Y_dat_i_0[DW-1:0]),	 // Templated
	.validtx			(Y_validtx_0),		 // Templated
	.ackrx				(Y_ackrx_0),		 // Templated
	// Inputs
	.acktx				(Y_acktx_0),		 // Templated
	.validrx			(Y_validrx_0),		 // Templated
	.clk_i				(ex_clk),		 // Templated
	.rst_i				(rst_i));		 // Templated


   device #(/*AUTOINSTPARAM*/
	    // Parameters
	    .DW				(DW))
   D1Y (/*AUTOINST*/
	// Outputs
	.adr_i				(Y_adr_i_1[1:0]),	 // Templated
	.dat_i				(Y_dat_i_1[DW-1:0]),	 // Templated
	.validtx			(Y_validtx_1),		 // Templated
	.ackrx				(Y_ackrx_1),		 // Templated
	// Inputs
	.acktx				(Y_acktx_1),		 // Templated
	.validrx			(Y_validrx_1),		 // Templated
	.clk_i				(ex_clk),		 // Templated
	.rst_i				(rst_i));		 // Templated

   device #(/*AUTOINSTPARAM*/
	    // Parameters
	    .DW				(DW))
   D2Y (/*AUTOINST*/
	// Outputs
	.adr_i				(Y_adr_i_2[1:0]),	 // Templated
	.dat_i				(Y_dat_i_2[DW-1:0]),	 // Templated
	.validtx			(Y_validtx_2),		 // Templated
	.ackrx				(Y_ackrx_2),		 // Templated
	// Inputs
	.acktx				(Y_acktx_2),		 // Templated
	.validrx			(Y_validrx_2),		 // Templated
	.clk_i				(ex_clk),		 // Templated
	.rst_i				(rst_i));		 // Templated

   device #(/*AUTOINSTPARAM*/
	    // Parameters
	    .DW				(DW))
   D3Y (/*AUTOINST*/
	// Outputs
	.adr_i				(Y_adr_i_3[1:0]),	 // Templated
	.dat_i				(Y_dat_i_3[DW-1:0]),	 // Templated
	.validtx			(Y_validtx_3),		 // Templated
	.ackrx				(Y_ackrx_3),		 // Templated
	// Inputs
	.acktx				(Y_acktx_3),		 // Templated
	.validrx			(Y_validrx_3),		 // Templated
	.clk_i				(ex_clk),		 // Templated
	.rst_i				(rst_i));		 // Templated



   // Clock Generation
   always #5 clk_i <= ~clk_i;
   always #7 ex_clk <= ~ex_clk;

   
   initial begin
      $dumpfile("switch_TB.vcd");
      $dumpvars(0,switch_TB);

      clk_i <= $random;
      ex_clk <= $random;
      rst_i <= 0;
      
      #20 rst_i <= 1;
      #20 rst_i <= 0;

      #220 $finish;
      
   end
 
endmodule // fifo_TB



// Local Variables:
// verilog-library-directories:("." "../../rtl/switch/")
// verilog-library-files:("")
// End:


   /*    device AUTO_TEMPLATE (
	  .acktx			(@"(substring vl-cell-name 2)"_acktx_@),
	  .validrx			(@"(substring vl-cell-name 2)"_validrx_@),
	  .adr_i			(@"(substring vl-cell-name 2)"_adr_i_@[1:0]),
	  .dat_i			(@"(substring vl-cell-name 2)"_dat_i_@[DW-1:0]),
	  .validtx			(@"(substring vl-cell-name 2)"_validtx_@),
	  .ackrx			(@"(substring vl-cell-name 2)"_ackrx_@),
	  .rst_i			(rst_i),
	  .clk_i			(ex_clk),
    );
*/
/*    
