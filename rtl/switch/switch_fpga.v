// TOP Module for FPGA Implementation
// The underlying modules have been adjusted to work for the Router. To simply test the switch checkout the commit merge feature/arbiterswitch
module switch_fpga (/*AUTOARG*/
   // Outputs
   valids, Y_acktx_3, Y_acktx_2, Y_acktx_1, Y_acktx_0, X_validrx_3,
   X_validrx_2, X_validrx_1, X_validrx_0, X_dat_o_3, X_dat_o_2,
   X_dat_o_1, X_dat_o_0, LED,
   // Inputs
   switch, rst_i, push_button, clk, Y_validtx_3, Y_validtx_2,
   Y_validtx_1, Y_validtx_0, Y_dat_i_3, Y_dat_i_2, Y_dat_i_1,
   Y_dat_i_0, Y_adr_i_3, Y_adr_i_2, Y_adr_i_1, Y_adr_i_0, X_ackrx_3,
   X_ackrx_2, X_ackrx_1, X_ackrx_0
   );

   parameter DW = 4;// Data Width
   parameter DEPTH = 2;// Defining Fifo Width to be 4

   parameter CLKIN = 50;
   parameter clk_i_CLKOUT = 25;// Clocks for switch
   parameter clk_i2_CLKOUT = 15;// Clocks for devices and circuit around the switch


   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		X_ackrx_0;		// To switch0 of switch_top.v
   input		X_ackrx_1;		// To switch0 of switch_top.v
   input		X_ackrx_2;		// To switch0 of switch_top.v
   input		X_ackrx_3;		// To switch0 of switch_top.v
   input [1:0]		Y_adr_i_0;		// To switch0 of switch_top.v
   input [1:0]		Y_adr_i_1;		// To switch0 of switch_top.v
   input [1:0]		Y_adr_i_2;		// To switch0 of switch_top.v
   input [1:0]		Y_adr_i_3;		// To switch0 of switch_top.v
   input [DW-1:0]	Y_dat_i_0;		// To switch0 of switch_top.v
   input [DW-1:0]	Y_dat_i_1;		// To switch0 of switch_top.v
   input [DW-1:0]	Y_dat_i_2;		// To switch0 of switch_top.v
   input [DW-1:0]	Y_dat_i_3;		// To switch0 of switch_top.v
   input		Y_validtx_0;		// To switch0 of switch_top.v
   input		Y_validtx_1;		// To switch0 of switch_top.v
   input		Y_validtx_2;		// To switch0 of switch_top.v
   input		Y_validtx_3;		// To switch0 of switch_top.v
   input		clk;			// To u_clk_i of clkgen.v, ...
   input		push_button;		// To switch0 of switch_top.v
   input		rst_i;			// To switch0 of switch_top.v, ...
   input [1:0]		switch;			// To switch0 of switch_top.v
   // End of automatics

   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output [3:0]		LED;			// From switch0 of switch_top.v
   output [DW-1:0]	X_dat_o_0;		// From switch0 of switch_top.v
   output [DW-1:0]	X_dat_o_1;		// From switch0 of switch_top.v
   output [DW-1:0]	X_dat_o_2;		// From switch0 of switch_top.v
   output [DW-1:0]	X_dat_o_3;		// From switch0 of switch_top.v
   output		X_validrx_0;		// From switch0 of switch_top.v
   output		X_validrx_1;		// From switch0 of switch_top.v
   output		X_validrx_2;		// From switch0 of switch_top.v
   output		X_validrx_3;		// From switch0 of switch_top.v
   output		Y_acktx_0;		// From switch0 of switch_top.v
   output		Y_acktx_1;		// From switch0 of switch_top.v
   output		Y_acktx_2;		// From switch0 of switch_top.v
   output		Y_acktx_3;		// From switch0 of switch_top.v
   output [3:0]		valids;			// From switch0 of switch_top.v
   // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk_i;			// From u_clk_i of clkgen.v
   wire			clk_i2;			// From u_clk_i2 of clkgen.v
   // End of automatics


   switch_top #(/*AUTOINSTPARAM*/
		// Parameters
		.DW			(DW),
		.DEPTH			(DEPTH))
   switch0 (
	    /*AUTOINST*/
	    // Outputs
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
	    .LED			(LED[3:0]),
	    .valids			(valids[3:0]),
	    // Inputs
	    .X_ackrx_0			(X_ackrx_0),
	    .X_ackrx_1			(X_ackrx_1),
	    .X_ackrx_2			(X_ackrx_2),
	    .X_ackrx_3			(X_ackrx_3),
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
	    .clk_i2			(clk_i2),
	    .rst_i			(rst_i),
	    .push_button		(push_button),
	    .switch			(switch[1:0]));

   clkgen #(/*AUTOINSTPARAM*/
	    // Parameters
	    .CLKIN			(CLKIN),		 // Templated
	    .CLKOUT			(clk_i_CLKOUT))		 // Templated
   u_clk_i (/*AUTOINST*/
	    // Outputs
	    .clk_o			(clk_i),		 // Templated
	    // Inputs
	    .clk_i			(clk),			 // Templated
	    .rst_i			(rst_i));		 // Templated

   clkgen #(/*AUTOINSTPARAM*/
	    // Parameters
	    .CLKIN			(CLKIN),		 // Templated
	    .CLKOUT			(clk_i2_CLKOUT))	 // Templated
   u_clk_i2 (/*AUTOINST*/
	     // Outputs
	     .clk_o			(clk_i2),		 // Templated
	     // Inputs
	     .clk_i			(clk),			 // Templated
	     .rst_i			(rst_i));		 // Templated


endmodule // fifo_TB



// Local Variables:
// verilog-library-directories:("." "../switch/" "../fifo/" "../lab")
// verilog-library-files:("")
// End:


   /* clkgen AUTO_TEMPLATE (
    .CLKIN			(CLKIN),
    .CLKOUT			(@"(substring vl-cell-name 2)"_CLKOUT),
    .clk_o			(@"(substring vl-cell-name 2)"),
    .clk_i			(clk),
    .rst_i			(rst_i),
    );
    */

