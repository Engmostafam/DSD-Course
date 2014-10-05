// Router, A combination of two switches. Not fully completed 
module router (/*AUTOARG*/
   // Outputs
   BY_validrx_2, BY_validrx_1, BY_validrx_0, BY_dat_o_2, BY_dat_o_1,
   BY_dat_o_0, BY_acktx_2, BY_acktx_1, BY_acktx_0, BX_validrx_2,
   BX_validrx_1, BX_validrx_0, BX_dat_o_2, BX_dat_o_1, BX_dat_o_0,
   BX_acktx_2, BX_acktx_1, BX_acktx_0, AY_validrx_2, AY_validrx_1,
   AY_validrx_0, AY_dat_o_2, AY_dat_o_1, AY_dat_o_0, AY_acktx_2,
   AY_acktx_1, AY_acktx_0, AX_validrx_2, AX_validrx_1, AX_validrx_0,
   AX_dat_o_2, AX_dat_o_1, AX_dat_o_0, AX_acktx_2, AX_acktx_1,
   AX_acktx_0,
   // Inputs
   rst_i, clk_i, BY_validtx_2, BY_validtx_1, BY_validtx_0, BY_dat_i_2,
   BY_dat_i_1, BY_dat_i_0, BY_adr_i_2, BY_adr_i_1, BY_adr_i_0,
   BY_ackrx_2, BY_ackrx_1, BY_ackrx_0, BX_validtx_2, BX_validtx_1,
   BX_validtx_0, BX_dat_i_2, BX_dat_i_1, BX_dat_i_0, BX_adr_i_2,
   BX_adr_i_1, BX_adr_i_0, BX_ackrx_2, BX_ackrx_1, BX_ackrx_0,
   AY_validtx_2, AY_validtx_1, AY_validtx_0, AY_dat_i_2, AY_dat_i_1,
   AY_dat_i_0, AY_adr_i_2, AY_adr_i_1, AY_adr_i_0, AY_ackrx_2,
   AY_ackrx_1, AY_ackrx_0, AX_validtx_2, AX_validtx_1, AX_validtx_0,
   AX_dat_i_2, AX_dat_i_1, AX_dat_i_0, AX_adr_i_2, AX_adr_i_1,
   AX_adr_i_0, AX_ackrx_2, AX_ackrx_1, AX_ackrx_0
   );

   parameter DW = 4;// Data Width
   parameter DEPTH = 2;// Defining Fifo Width to be 4
   parameter A_sw_adr = 1'b0;
   parameter B_sw_adr = 1'b1;
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		AX_ackrx_0;		// To s_A of switch.v
   input		AX_ackrx_1;		// To s_A of switch.v
   input		AX_ackrx_2;		// To s_A of switch.v
   input [2:0]		AX_adr_i_0;		// To s_A of switch.v
   input [2:0]		AX_adr_i_1;		// To s_A of switch.v
   input [2:0]		AX_adr_i_2;		// To s_A of switch.v
   input [DW-1:0]	AX_dat_i_0;		// To s_A of switch.v
   input [DW-1:0]	AX_dat_i_1;		// To s_A of switch.v
   input [DW-1:0]	AX_dat_i_2;		// To s_A of switch.v
   input		AX_validtx_0;		// To s_A of switch.v
   input		AX_validtx_1;		// To s_A of switch.v
   input		AX_validtx_2;		// To s_A of switch.v
   input		AY_ackrx_0;		// To s_A of switch.v
   input		AY_ackrx_1;		// To s_A of switch.v
   input		AY_ackrx_2;		// To s_A of switch.v
   input [2:0]		AY_adr_i_0;		// To s_A of switch.v
   input [2:0]		AY_adr_i_1;		// To s_A of switch.v
   input [2:0]		AY_adr_i_2;		// To s_A of switch.v
   input [DW-1:0]	AY_dat_i_0;		// To s_A of switch.v
   input [DW-1:0]	AY_dat_i_1;		// To s_A of switch.v
   input [DW-1:0]	AY_dat_i_2;		// To s_A of switch.v
   input		AY_validtx_0;		// To s_A of switch.v
   input		AY_validtx_1;		// To s_A of switch.v
   input		AY_validtx_2;		// To s_A of switch.v
   input		BX_ackrx_0;		// To s_B of switch.v
   input		BX_ackrx_1;		// To s_B of switch.v
   input		BX_ackrx_2;		// To s_B of switch.v
   input [2:0]		BX_adr_i_0;		// To s_B of switch.v
   input [2:0]		BX_adr_i_1;		// To s_B of switch.v
   input [2:0]		BX_adr_i_2;		// To s_B of switch.v
   input [DW-1:0]	BX_dat_i_0;		// To s_B of switch.v
   input [DW-1:0]	BX_dat_i_1;		// To s_B of switch.v
   input [DW-1:0]	BX_dat_i_2;		// To s_B of switch.v
   input		BX_validtx_0;		// To s_B of switch.v
   input		BX_validtx_1;		// To s_B of switch.v
   input		BX_validtx_2;		// To s_B of switch.v
   input		BY_ackrx_0;		// To s_B of switch.v
   input		BY_ackrx_1;		// To s_B of switch.v
   input		BY_ackrx_2;		// To s_B of switch.v
   input [2:0]		BY_adr_i_0;		// To s_B of switch.v
   input [2:0]		BY_adr_i_1;		// To s_B of switch.v
   input [2:0]		BY_adr_i_2;		// To s_B of switch.v
   input [DW-1:0]	BY_dat_i_0;		// To s_B of switch.v
   input [DW-1:0]	BY_dat_i_1;		// To s_B of switch.v
   input [DW-1:0]	BY_dat_i_2;		// To s_B of switch.v
   input		BY_validtx_0;		// To s_B of switch.v
   input		BY_validtx_1;		// To s_B of switch.v
   input		BY_validtx_2;		// To s_B of switch.v
   input		clk_i;			// To s_A of switch.v, ...
   input		rst_i;			// To s_A of switch.v, ...
   // End of automatics

   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output		AX_acktx_0;		// From s_A of switch.v
   output		AX_acktx_1;		// From s_A of switch.v
   output		AX_acktx_2;		// From s_A of switch.v
   output [DW+2:0]	AX_dat_o_0;		// From s_A of switch.v
   output [DW+2:0]	AX_dat_o_1;		// From s_A of switch.v
   output [DW+2:0]	AX_dat_o_2;		// From s_A of switch.v
   output		AX_validrx_0;		// From s_A of switch.v
   output		AX_validrx_1;		// From s_A of switch.v
   output		AX_validrx_2;		// From s_A of switch.v
   output		AY_acktx_0;		// From s_A of switch.v
   output		AY_acktx_1;		// From s_A of switch.v
   output		AY_acktx_2;		// From s_A of switch.v
   output [DW+2:0]	AY_dat_o_0;		// From s_A of switch.v
   output [DW+2:0]	AY_dat_o_1;		// From s_A of switch.v
   output [DW+2:0]	AY_dat_o_2;		// From s_A of switch.v
   output		AY_validrx_0;		// From s_A of switch.v
   output		AY_validrx_1;		// From s_A of switch.v
   output		AY_validrx_2;		// From s_A of switch.v
   output		BX_acktx_0;		// From s_B of switch.v
   output		BX_acktx_1;		// From s_B of switch.v
   output		BX_acktx_2;		// From s_B of switch.v
   output [DW+2:0]	BX_dat_o_0;		// From s_B of switch.v
   output [DW+2:0]	BX_dat_o_1;		// From s_B of switch.v
   output [DW+2:0]	BX_dat_o_2;		// From s_B of switch.v
   output		BX_validrx_0;		// From s_B of switch.v
   output		BX_validrx_1;		// From s_B of switch.v
   output		BX_validrx_2;		// From s_B of switch.v
   output		BY_acktx_0;		// From s_B of switch.v
   output		BY_acktx_1;		// From s_B of switch.v
   output		BY_acktx_2;		// From s_B of switch.v
   output [DW+2:0]	BY_dat_o_0;		// From s_B of switch.v
   output [DW+2:0]	BY_dat_o_1;		// From s_B of switch.v
   output [DW+2:0]	BY_dat_o_2;		// From s_B of switch.v
   output		BY_validrx_0;		// From s_B of switch.v
   output		BY_validrx_1;		// From s_B of switch.v
   output		BY_validrx_2;		// From s_B of switch.v
   // End of automatics

   /*AUTOWIRE*/
   

   wire 		AX_ackrx_3;		// To s_A of switch.v
   wire [2:0] 		AX_adr_i_3;		// To s_A of switch.v
   wire [DW-1:0] 	AX_dat_i_3;		// To s_A of switch.v
   wire 		AX_validtx_3;		// To s_A of switch.v
   wire 		AY_ackrx_3;		// To s_A of switch.v
   wire [2:0] 		AY_adr_i_3;		// To s_A of switch.v
   wire [DW-1:0] 	AY_dat_i_3;		// To s_A of switch.v
   wire 		AY_validtx_3;		// To s_A of switch.v
   wire 		BX_ackrx_3;		// To s_B of switch.v
   wire [2:0] 		BX_adr_i_3;		// To s_B of switch.v
   wire 		BX_validtx_3;		// To s_B of switch.v
   wire [DW-1:0] 	BX_dat_i_3;		// To s_A of switch.v
   wire 		BY_ackrx_3;		// To s_B of switch.v
   wire [2:0] 		BY_adr_i_3;		// To s_B of switch.v
   wire [DW-1:0] 	BY_dat_i_3;		// To s_B of switch.v
   wire 		BY_validtx_3;		// To s_B of switch.v
   wire 		AX_acktx_3;		// From s_A of switch.v
   wire [DW+2:0] 	AX_dat_o_3;		// From s_A of switch.v
   wire 		AX_validrx_3;		// From s_A of switch.v
   wire 		AY_acktx_3;		// From s_A of switch.v
   wire [DW+2:0] 	AY_dat_o_3;		// From s_A of switch.v
   wire 		AY_validrx_3;		// From s_A of switch.v
   wire 		BX_acktx_3;		// From s_B of switch.v
   wire [DW+2:0] 	BX_dat_o_3;		// From s_B of switch.v
   wire 		BX_validrx_3;		// From s_B of switch.v
   wire 		BY_acktx_3;		// From s_B of switch.v
   wire [DW+2:0] 	BY_dat_o_3;		// From s_B of switch.v
   wire 		BY_validrx_3;		// From s_B of switch.v
   

   switch #(/*AUTOINSTPARAM*/
	    // Parameters
	    .DW				(DW),
	    .DEPTH			(DEPTH),
	    .sw_adr			(A_sw_adr))		 // Templated
   s_A (
	.X_ackrx_3			(BY_acktx_3),
	.X_adr_i_3			(BY_dat_o_3[6:4]),
	.X_dat_i_3			(BY_dat_o_3[DW-1:0]),
	.X_validtx_3			(BY_validrx_3),
	
	.Y_ackrx_3			(BX_acktx_3),
	.Y_adr_i_3			(BX_dat_o_3[6:4]),
	.Y_dat_i_3			(BX_dat_o_3[DW-1:0]),
	.Y_validtx_3			(BX_validrx_3),
	
	.X_acktx_3			(AX_acktx_3),
	.X_dat_o_3			(AX_dat_o_3[DW+2:0]),
	.X_validrx_3			(AX_validrx_3),
	
	.Y_acktx_3			(AY_acktx_3),
	.Y_dat_o_3			(AY_dat_o_3[DW+2:0]),
	.Y_validrx_3			(AY_validrx_3),
	/*AUTOINST*/
	// Outputs
	.X_acktx_0			(AX_acktx_0),		 // Templated
	.X_acktx_1			(AX_acktx_1),		 // Templated
	.X_acktx_2			(AX_acktx_2),		 // Templated
	.X_dat_o_0			(AX_dat_o_0[DW+2:0]),	 // Templated
	.X_dat_o_1			(AX_dat_o_1[DW+2:0]),	 // Templated
	.X_dat_o_2			(AX_dat_o_2[DW+2:0]),	 // Templated
	.X_validrx_0			(AX_validrx_0),		 // Templated
	.X_validrx_1			(AX_validrx_1),		 // Templated
	.X_validrx_2			(AX_validrx_2),		 // Templated
	.Y_acktx_0			(AY_acktx_0),		 // Templated
	.Y_acktx_1			(AY_acktx_1),		 // Templated
	.Y_acktx_2			(AY_acktx_2),		 // Templated
	.Y_dat_o_0			(AY_dat_o_0[DW+2:0]),	 // Templated
	.Y_dat_o_1			(AY_dat_o_1[DW+2:0]),	 // Templated
	.Y_dat_o_2			(AY_dat_o_2[DW+2:0]),	 // Templated
	.Y_validrx_0			(AY_validrx_0),		 // Templated
	.Y_validrx_1			(AY_validrx_1),		 // Templated
	.Y_validrx_2			(AY_validrx_2),		 // Templated
	// Inputs
	.X_ackrx_0			(AX_ackrx_0),		 // Templated
	.X_ackrx_1			(AX_ackrx_1),		 // Templated
	.X_ackrx_2			(AX_ackrx_2),		 // Templated
	.X_adr_i_0			(AX_adr_i_0[2:0]),	 // Templated
	.X_adr_i_1			(AX_adr_i_1[2:0]),	 // Templated
	.X_adr_i_2			(AX_adr_i_2[2:0]),	 // Templated
	.X_dat_i_0			(AX_dat_i_0[DW-1:0]),	 // Templated
	.X_dat_i_1			(AX_dat_i_1[DW-1:0]),	 // Templated
	.X_dat_i_2			(AX_dat_i_2[DW-1:0]),	 // Templated
	.X_validtx_0			(AX_validtx_0),		 // Templated
	.X_validtx_1			(AX_validtx_1),		 // Templated
	.X_validtx_2			(AX_validtx_2),		 // Templated
	.Y_ackrx_0			(AY_ackrx_0),		 // Templated
	.Y_ackrx_1			(AY_ackrx_1),		 // Templated
	.Y_ackrx_2			(AY_ackrx_2),		 // Templated
	.Y_adr_i_0			(AY_adr_i_0[2:0]),	 // Templated
	.Y_adr_i_1			(AY_adr_i_1[2:0]),	 // Templated
	.Y_adr_i_2			(AY_adr_i_2[2:0]),	 // Templated
	.Y_dat_i_0			(AY_dat_i_0[DW-1:0]),	 // Templated
	.Y_dat_i_1			(AY_dat_i_1[DW-1:0]),	 // Templated
	.Y_dat_i_2			(AY_dat_i_2[DW-1:0]),	 // Templated
	.Y_validtx_0			(AY_validtx_0),		 // Templated
	.Y_validtx_1			(AY_validtx_1),		 // Templated
	.Y_validtx_2			(AY_validtx_2),		 // Templated
	.clk_i				(clk_i),		 // Templated
	.rst_i				(rst_i));		 // Templated

   switch #(/*AUTOINSTPARAM*/
	    // Parameters
	    .DW				(DW),
	    .DEPTH			(DEPTH),
	    .sw_adr			(B_sw_adr))		 // Templated
   s_B (
	.X_ackrx_3			(AY_acktx_3),
	.X_adr_i_3			(AY_dat_o_3[6:4]),
	.X_dat_i_3			(AY_dat_o_3[DW-1:0]),
	.X_validtx_3			(AY_validrx_3),
	
	.Y_ackrx_3			(AX_acktx_3),
	.Y_adr_i_3			(AX_dat_o_3[6:4]),
	.Y_dat_i_3			(AX_dat_o_3[DW-1:0]),
	.Y_validtx_3			(AX_validrx_3),
	
	.X_acktx_3			(BX_acktx_3),
	.X_dat_o_3			(BX_dat_o_3[DW+2:0]),
	.X_validrx_3			(BX_validrx_3),
	
	.Y_acktx_3			(BY_acktx_3),
	.Y_dat_o_3			(BY_dat_o_3[DW+2:0]),
	.Y_validrx_3			(BY_validrx_3),
	/*AUTOINST*/
	// Outputs
	.X_acktx_0			(BX_acktx_0),		 // Templated
	.X_acktx_1			(BX_acktx_1),		 // Templated
	.X_acktx_2			(BX_acktx_2),		 // Templated
	.X_dat_o_0			(BX_dat_o_0[DW+2:0]),	 // Templated
	.X_dat_o_1			(BX_dat_o_1[DW+2:0]),	 // Templated
	.X_dat_o_2			(BX_dat_o_2[DW+2:0]),	 // Templated
	.X_validrx_0			(BX_validrx_0),		 // Templated
	.X_validrx_1			(BX_validrx_1),		 // Templated
	.X_validrx_2			(BX_validrx_2),		 // Templated
	.Y_acktx_0			(BY_acktx_0),		 // Templated
	.Y_acktx_1			(BY_acktx_1),		 // Templated
	.Y_acktx_2			(BY_acktx_2),		 // Templated
	.Y_dat_o_0			(BY_dat_o_0[DW+2:0]),	 // Templated
	.Y_dat_o_1			(BY_dat_o_1[DW+2:0]),	 // Templated
	.Y_dat_o_2			(BY_dat_o_2[DW+2:0]),	 // Templated
	.Y_validrx_0			(BY_validrx_0),		 // Templated
	.Y_validrx_1			(BY_validrx_1),		 // Templated
	.Y_validrx_2			(BY_validrx_2),		 // Templated
	// Inputs
	.X_ackrx_0			(BX_ackrx_0),		 // Templated
	.X_ackrx_1			(BX_ackrx_1),		 // Templated
	.X_ackrx_2			(BX_ackrx_2),		 // Templated
	.X_adr_i_0			(BX_adr_i_0[2:0]),	 // Templated
	.X_adr_i_1			(BX_adr_i_1[2:0]),	 // Templated
	.X_adr_i_2			(BX_adr_i_2[2:0]),	 // Templated
	.X_dat_i_0			(BX_dat_i_0[DW-1:0]),	 // Templated
	.X_dat_i_1			(BX_dat_i_1[DW-1:0]),	 // Templated
	.X_dat_i_2			(BX_dat_i_2[DW-1:0]),	 // Templated
	.X_validtx_0			(BX_validtx_0),		 // Templated
	.X_validtx_1			(BX_validtx_1),		 // Templated
	.X_validtx_2			(BX_validtx_2),		 // Templated
	.Y_ackrx_0			(BY_ackrx_0),		 // Templated
	.Y_ackrx_1			(BY_ackrx_1),		 // Templated
	.Y_ackrx_2			(BY_ackrx_2),		 // Templated
	.Y_adr_i_0			(BY_adr_i_0[2:0]),	 // Templated
	.Y_adr_i_1			(BY_adr_i_1[2:0]),	 // Templated
	.Y_adr_i_2			(BY_adr_i_2[2:0]),	 // Templated
	.Y_dat_i_0			(BY_dat_i_0[DW-1:0]),	 // Templated
	.Y_dat_i_1			(BY_dat_i_1[DW-1:0]),	 // Templated
	.Y_dat_i_2			(BY_dat_i_2[DW-1:0]),	 // Templated
	.Y_validtx_0			(BY_validtx_0),		 // Templated
	.Y_validtx_1			(BY_validtx_1),		 // Templated
	.Y_validtx_2			(BY_validtx_2),		 // Templated
	.clk_i				(clk_i),		 // Templated
	.rst_i				(rst_i));		 // Templated


   

endmodule // fifo_TB



// Local Variables:
// verilog-library-directories:("." "../switch/" "../fifo/" "../clkgen")
// verilog-library-files:("")
// End:


   /*    xdevice AUTO_TEMPLATE (
    .init (@),
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
 
    switch AUTO_TEMPLATE (
 	    .sw_adr			(@"(substring vl-cell-name 2)"_sw_adr),
	    .Y_dat_o_0			(@"(substring vl-cell-name 2)"Y_dat_o_0[DW+2:0]),
	    .Y_dat_o_1			(@"(substring vl-cell-name 2)"Y_dat_o_1[DW+2:0]),
	    .Y_dat_o_2			(@"(substring vl-cell-name 2)"Y_dat_o_2[DW+2:0]),
	    .Y_dat_o_3			(@"(substring vl-cell-name 2)"Y_dat_o_3[DW+2:0]),
	    .Y_validrx_0		(@"(substring vl-cell-name 2)"Y_validrx_0),
	    .Y_validrx_1		(@"(substring vl-cell-name 2)"Y_validrx_1),
	    .Y_validrx_2		(@"(substring vl-cell-name 2)"Y_validrx_2),
	    .Y_validrx_3		(@"(substring vl-cell-name 2)"Y_validrx_3),
	     .X_acktx_0			(@"(substring vl-cell-name 2)"X_acktx_0),
	     .X_acktx_1			(@"(substring vl-cell-name 2)"X_acktx_1),
	     .X_acktx_2			(@"(substring vl-cell-name 2)"X_acktx_2),
	     .X_acktx_3			(@"(substring vl-cell-name 2)"X_acktx_3),
	     .X_dat_o_0			(@"(substring vl-cell-name 2)"X_dat_o_0[DW+2:0]),
	     .X_dat_o_1			(@"(substring vl-cell-name 2)"X_dat_o_1[DW+2:0]),
	     .X_dat_o_2			(@"(substring vl-cell-name 2)"X_dat_o_2[DW+2:0]),
	     .X_dat_o_3			(@"(substring vl-cell-name 2)"X_dat_o_3[DW+2:0]),
	     .X_validrx_0		(@"(substring vl-cell-name 2)"X_validrx_0),
	     .X_validrx_1		(@"(substring vl-cell-name 2)"X_validrx_1),
	     .X_validrx_2		(@"(substring vl-cell-name 2)"X_validrx_2),
	     .X_validrx_3		(@"(substring vl-cell-name 2)"X_validrx_3),
	     .Y_acktx_0			(@"(substring vl-cell-name 2)"Y_acktx_0),
	     .Y_acktx_1			(@"(substring vl-cell-name 2)"Y_acktx_1),
	     .Y_acktx_2			(@"(substring vl-cell-name 2)"Y_acktx_2),
	     .Y_acktx_3			(@"(substring vl-cell-name 2)"Y_acktx_3),
	     .X_ackrx_0			(@"(substring vl-cell-name 2)"X_ackrx_0),
	     .X_ackrx_1			(@"(substring vl-cell-name 2)"X_ackrx_1),
	     .X_ackrx_2			(@"(substring vl-cell-name 2)"X_ackrx_2),
	     .X_ackrx_3			(@"(substring vl-cell-name 2)"X_ackrx_3),
	     .X_adr_i_0			(@"(substring vl-cell-name 2)"X_adr_i_0[2:0]),
	     .X_adr_i_1			(@"(substring vl-cell-name 2)"X_adr_i_1[2:0]),
	     .X_adr_i_2			(@"(substring vl-cell-name 2)"X_adr_i_2[2:0]),
	     .X_adr_i_3			(@"(substring vl-cell-name 2)"Y_dat_o_3[6:4]),
	     .X_dat_i_0			(@"(substring vl-cell-name 2)"X_dat_i_0[DW-1:0]),
	     .X_dat_i_1			(@"(substring vl-cell-name 2)"X_dat_i_1[DW-1:0]),
	     .X_dat_i_2			(@"(substring vl-cell-name 2)"X_dat_i_2[DW-1:0]),
	     .X_dat_i_3			(@"(substring vl-cell-name 2)"Y_dat_o_3[DW-1:0]),
	     .X_validtx_0		(@"(substring vl-cell-name 2)"X_validtx_0),
	     .X_validtx_1		(@"(substring vl-cell-name 2)"X_validtx_1),
	     .X_validtx_2		(@"(substring vl-cell-name 2)"X_validtx_2),
	     .X_validtx_3		(@"(substring vl-cell-name 2)"X_validtx_3),
	     .Y_ackrx_0			(@"(substring vl-cell-name 2)"Y_ackrx_0),
	     .Y_ackrx_1			(@"(substring vl-cell-name 2)"Y_ackrx_1),
	     .Y_ackrx_2			(@"(substring vl-cell-name 2)"Y_ackrx_2),
	     .Y_ackrx_3			(@"(substring vl-cell-name 2)"Y_ackrx_3),
	     .Y_adr_i_0			(@"(substring vl-cell-name 2)"Y_adr_i_0[2:0]),
	     .Y_adr_i_1			(@"(substring vl-cell-name 2)"Y_adr_i_1[2:0]),
	     .Y_adr_i_2			(@"(substring vl-cell-name 2)"Y_adr_i_2[2:0]),
	     .Y_adr_i_3			(@"(substring vl-cell-name 2)"Y_adr_i_3[2:0]),
	     .Y_dat_i_0			(@"(substring vl-cell-name 2)"Y_dat_i_0[DW-1:0]),
	     .Y_dat_i_1			(@"(substring vl-cell-name 2)"Y_dat_i_1[DW-1:0]),
	     .Y_dat_i_2			(@"(substring vl-cell-name 2)"Y_dat_i_2[DW-1:0]),
	     .Y_dat_i_3			(@"(substring vl-cell-name 2)"Y_dat_i_3[DW-1:0]),
	     .Y_validtx_0		(@"(substring vl-cell-name 2)"Y_validtx_0),
	     .Y_validtx_1		(@"(substring vl-cell-name 2)"Y_validtx_1),
	     .Y_validtx_2		(@"(substring vl-cell-name 2)"Y_validtx_2),
	     .Y_validtx_3		(@"(substring vl-cell-name 2)"Y_validtx_3),
	     .clk_i			(clk_i),
	     .rst_i			(rst_i),
 );

     
