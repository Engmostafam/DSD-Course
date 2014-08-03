/*
 Switch Wrapper
 Contains both sides of the switch
*/ 

module switch(/*AUTOARG*/
   // Outputs
   Y_validrx_3, Y_validrx_2, Y_validrx_1, Y_validrx_0, Y_dat_o_3,
   Y_dat_o_2, Y_dat_o_1, Y_dat_o_0, Y_acktx_3, Y_acktx_2, Y_acktx_1,
   Y_acktx_0, X_validrx_3, X_validrx_2, X_validrx_1, X_validrx_0,
   X_dat_o_3, X_dat_o_2, X_dat_o_1, X_dat_o_0, X_acktx_3, X_acktx_2,
   X_acktx_1, X_acktx_0,
   // Inputs
   rst_i, clk_i, Y_validtx_3, Y_validtx_2, Y_validtx_1, Y_validtx_0,
   Y_dat_i_3, Y_dat_i_2, Y_dat_i_1, Y_dat_i_0, Y_adr_i_3, Y_adr_i_2,
   Y_adr_i_1, Y_adr_i_0, Y_ackrx_3, Y_ackrx_2, Y_ackrx_1, Y_ackrx_0,
   X_validtx_3, X_validtx_2, X_validtx_1, X_validtx_0, X_dat_i_3,
   X_dat_i_2, X_dat_i_1, X_dat_i_0, X_adr_i_3, X_adr_i_2, X_adr_i_1,
   X_adr_i_0, X_ackrx_3, X_ackrx_2, X_ackrx_1, X_ackrx_0
   );

   parameter DW = 4;// Data Width
   parameter DEPTH = 2;// Defining Fifo Width to be 4

   
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		X_ackrx_0;		// To S_X of side.v
   input		X_ackrx_1;		// To S_X of side.v
   input		X_ackrx_2;		// To S_X of side.v
   input		X_ackrx_3;		// To S_X of side.v
   input [1:0]		X_adr_i_0;		// To S_X of side.v
   input [1:0]		X_adr_i_1;		// To S_X of side.v
   input [1:0]		X_adr_i_2;		// To S_X of side.v
   input [1:0]		X_adr_i_3;		// To S_X of side.v
   input [DW-1:0]	X_dat_i_0;		// To S_X of side.v
   input [DW-1:0]	X_dat_i_1;		// To S_X of side.v
   input [DW-1:0]	X_dat_i_2;		// To S_X of side.v
   input [DW-1:0]	X_dat_i_3;		// To S_X of side.v
   input		X_validtx_0;		// To S_X of side.v
   input		X_validtx_1;		// To S_X of side.v
   input		X_validtx_2;		// To S_X of side.v
   input		X_validtx_3;		// To S_X of side.v
   input		Y_ackrx_0;		// To S_Y of side.v
   input		Y_ackrx_1;		// To S_Y of side.v
   input		Y_ackrx_2;		// To S_Y of side.v
   input		Y_ackrx_3;		// To S_Y of side.v
   input [1:0]		Y_adr_i_0;		// To S_Y of side.v
   input [1:0]		Y_adr_i_1;		// To S_Y of side.v
   input [1:0]		Y_adr_i_2;		// To S_Y of side.v
   input [1:0]		Y_adr_i_3;		// To S_Y of side.v
   input [DW-1:0]	Y_dat_i_0;		// To S_Y of side.v
   input [DW-1:0]	Y_dat_i_1;		// To S_Y of side.v
   input [DW-1:0]	Y_dat_i_2;		// To S_Y of side.v
   input [DW-1:0]	Y_dat_i_3;		// To S_Y of side.v
   input		Y_validtx_0;		// To S_Y of side.v
   input		Y_validtx_1;		// To S_Y of side.v
   input		Y_validtx_2;		// To S_Y of side.v
   input		Y_validtx_3;		// To S_Y of side.v
   input		clk_i;			// To S_X of side.v, ...
   input		rst_i;			// To S_X of side.v, ...
   // End of automatics
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output		X_acktx_0;		// From S_X of side.v
   output		X_acktx_1;		// From S_X of side.v
   output		X_acktx_2;		// From S_X of side.v
   output		X_acktx_3;		// From S_X of side.v
   output [DW-1:0]	X_dat_o_0;		// From S_X of side.v
   output [DW-1:0]	X_dat_o_1;		// From S_X of side.v
   output [DW-1:0]	X_dat_o_2;		// From S_X of side.v
   output [DW-1:0]	X_dat_o_3;		// From S_X of side.v
   output		X_validrx_0;		// From S_X of side.v
   output		X_validrx_1;		// From S_X of side.v
   output		X_validrx_2;		// From S_X of side.v
   output		X_validrx_3;		// From S_X of side.v
   output		Y_acktx_0;		// From S_Y of side.v
   output		Y_acktx_1;		// From S_Y of side.v
   output		Y_acktx_2;		// From S_Y of side.v
   output		Y_acktx_3;		// From S_Y of side.v
   output [DW-1:0]	Y_dat_o_0;		// From S_Y of side.v
   output [DW-1:0]	Y_dat_o_1;		// From S_Y of side.v
   output [DW-1:0]	Y_dat_o_2;		// From S_Y of side.v
   output [DW-1:0]	Y_dat_o_3;		// From S_Y of side.v
   output		Y_validrx_0;		// From S_Y of side.v
   output		Y_validrx_1;		// From S_Y of side.v
   output		Y_validrx_2;		// From S_Y of side.v
   output		Y_validrx_3;		// From S_Y of side.v
   // End of automatics
   /*AUTOWIRE*/

   wire [DW-1:0]	Y_int_dat_o;
   wire [3:0] 		Y_int_wen_o;
   wire [DW-1:0] 	X_int_dat_o;
   wire [3:0] 		X_int_wen_o;
   wire [3:0] 		X_full_o;
   wire [3:0] 		Y_full_o;
   

   /*AUTOREG*/

   side #(/*AUTOINSTPARAM*/
	  // Parameters
	  .DW				(DW),
	  .DEPTH			(DEPTH))
   S_X (
	.int_wen_i			(Y_int_wen_o),
	.int_dat_i			(Y_int_dat_o),
	.full_i				(Y_full_o),
	.int_wen_o			(X_int_wen_o[3:0]),
	.int_dat_o			(X_int_dat_o[DW-1:0]),
	.full_o				(X_full_o[3:0]),	
	/*AUTOINST*/
	// Outputs
	.acktx_0			(X_acktx_0),		 // Templated
	.acktx_1			(X_acktx_1),		 // Templated
	.acktx_2			(X_acktx_2),		 // Templated
	.acktx_3			(X_acktx_3),		 // Templated
	.dat_o_0			(X_dat_o_0[DW-1:0]),	 // Templated
	.dat_o_1			(X_dat_o_1[DW-1:0]),	 // Templated
	.dat_o_2			(X_dat_o_2[DW-1:0]),	 // Templated
	.dat_o_3			(X_dat_o_3[DW-1:0]),	 // Templated
	.validrx_0			(X_validrx_0),		 // Templated
	.validrx_1			(X_validrx_1),		 // Templated
	.validrx_2			(X_validrx_2),		 // Templated
	.validrx_3			(X_validrx_3),		 // Templated
	// Inputs
	.ackrx_0			(X_ackrx_0),		 // Templated
	.ackrx_1			(X_ackrx_1),		 // Templated
	.ackrx_2			(X_ackrx_2),		 // Templated
	.ackrx_3			(X_ackrx_3),		 // Templated
	.adr_i_0			(X_adr_i_0[1:0]),	 // Templated
	.adr_i_1			(X_adr_i_1[1:0]),	 // Templated
	.adr_i_2			(X_adr_i_2[1:0]),	 // Templated
	.adr_i_3			(X_adr_i_3[1:0]),	 // Templated
	.clk_i				(clk_i),		 // Templated
	.dat_i_0			(X_dat_i_0[DW-1:0]),	 // Templated
	.dat_i_1			(X_dat_i_1[DW-1:0]),	 // Templated
	.dat_i_2			(X_dat_i_2[DW-1:0]),	 // Templated
	.dat_i_3			(X_dat_i_3[DW-1:0]),	 // Templated
	.rst_i				(rst_i),		 // Templated
	.validtx_0			(X_validtx_0),		 // Templated
	.validtx_1			(X_validtx_1),		 // Templated
	.validtx_2			(X_validtx_2),		 // Templated
	.validtx_3			(X_validtx_3));		 // Templated

   side #(/*AUTOINSTPARAM*/
	  // Parameters
	  .DW				(DW),
	  .DEPTH			(DEPTH))
   S_Y (
	.int_wen_i			(X_int_wen_o),
	.int_dat_i			(X_int_dat_o),
	.full_i				(X_full_o),
	.int_wen_o			(Y_int_wen_o[3:0]),
	.int_dat_o			(Y_int_dat_o[DW-1:0]),
	.full_o				(Y_full_o[3:0]),	
	/*AUTOINST*/
	// Outputs
	.acktx_0			(Y_acktx_0),		 // Templated
	.acktx_1			(Y_acktx_1),		 // Templated
	.acktx_2			(Y_acktx_2),		 // Templated
	.acktx_3			(Y_acktx_3),		 // Templated
	.dat_o_0			(Y_dat_o_0[DW-1:0]),	 // Templated
	.dat_o_1			(Y_dat_o_1[DW-1:0]),	 // Templated
	.dat_o_2			(Y_dat_o_2[DW-1:0]),	 // Templated
	.dat_o_3			(Y_dat_o_3[DW-1:0]),	 // Templated
	.validrx_0			(Y_validrx_0),		 // Templated
	.validrx_1			(Y_validrx_1),		 // Templated
	.validrx_2			(Y_validrx_2),		 // Templated
	.validrx_3			(Y_validrx_3),		 // Templated
	// Inputs
	.ackrx_0			(Y_ackrx_0),		 // Templated
	.ackrx_1			(Y_ackrx_1),		 // Templated
	.ackrx_2			(Y_ackrx_2),		 // Templated
	.ackrx_3			(Y_ackrx_3),		 // Templated
	.adr_i_0			(Y_adr_i_0[1:0]),	 // Templated
	.adr_i_1			(Y_adr_i_1[1:0]),	 // Templated
	.adr_i_2			(Y_adr_i_2[1:0]),	 // Templated
	.adr_i_3			(Y_adr_i_3[1:0]),	 // Templated
	.clk_i				(clk_i),		 // Templated
	.dat_i_0			(Y_dat_i_0[DW-1:0]),	 // Templated
	.dat_i_1			(Y_dat_i_1[DW-1:0]),	 // Templated
	.dat_i_2			(Y_dat_i_2[DW-1:0]),	 // Templated
	.dat_i_3			(Y_dat_i_3[DW-1:0]),	 // Templated
	.rst_i				(rst_i),		 // Templated
	.validtx_0			(Y_validtx_0),		 // Templated
	.validtx_1			(Y_validtx_1),		 // Templated
	.validtx_2			(Y_validtx_2),		 // Templated
	.validtx_3			(Y_validtx_3));		 // Templated

   

endmodule // top


// Local Variables:
// verilog-library-directories:("." "../../rtl/arbiter/"  "../../rtl/lab/"   "../../rtl/debouncer/")
// verilog-library-files:("")
// End:


   /*    side AUTO_TEMPLATE (
	.acktx_0			(@"(substring vl-cell-name 2)"_acktx_0),
	.acktx_1			(@"(substring vl-cell-name 2)"_acktx_1),
	.acktx_2			(@"(substring vl-cell-name 2)"_acktx_2),
	.acktx_3			(@"(substring vl-cell-name 2)"_acktx_3),
	.dat_o_0			(@"(substring vl-cell-name 2)"_dat_o_0[DW-1:0]),
	.dat_o_1			(@"(substring vl-cell-name 2)"_dat_o_1[DW-1:0]),
	.dat_o_2			(@"(substring vl-cell-name 2)"_dat_o_2[DW-1:0]),
	.dat_o_3			(@"(substring vl-cell-name 2)"_dat_o_3[DW-1:0]),
	.validrx_0			(@"(substring vl-cell-name 2)"_validrx_0),
	.validrx_1			(@"(substring vl-cell-name 2)"_validrx_1),
	.validrx_2			(@"(substring vl-cell-name 2)"_validrx_2),
	.validrx_3			(@"(substring vl-cell-name 2)"_validrx_3),
	.ackrx_0			(@"(substring vl-cell-name 2)"_ackrx_0),
	.ackrx_1			(@"(substring vl-cell-name 2)"_ackrx_1),
	.ackrx_2			(@"(substring vl-cell-name 2)"_ackrx_2),
	.ackrx_3			(@"(substring vl-cell-name 2)"_ackrx_3),
	.adr_i_0			(@"(substring vl-cell-name 2)"_adr_i_0[1:0]),
	.adr_i_1			(@"(substring vl-cell-name 2)"_adr_i_1[1:0]),
	.adr_i_2			(@"(substring vl-cell-name 2)"_adr_i_2[1:0]),
	.adr_i_3			(@"(substring vl-cell-name 2)"_adr_i_3[1:0]),
	.clk_i				(clk_i),
	.dat_i_0			(@"(substring vl-cell-name 2)"_dat_i_0[DW-1:0]),
	.dat_i_1			(@"(substring vl-cell-name 2)"_dat_i_1[DW-1:0]),
	.dat_i_2			(@"(substring vl-cell-name 2)"_dat_i_2[DW-1:0]),
	.dat_i_3			(@"(substring vl-cell-name 2)"_dat_i_3[DW-1:0]),
	.rst_i				(rst_i),
	.validtx_0			(@"(substring vl-cell-name 2)"_validtx_0),
	.validtx_1			(@"(substring vl-cell-name 2)"_validtx_1),
	.validtx_2			(@"(substring vl-cell-name 2)"_validtx_2),
	.validtx_3			(@"(substring vl-cell-name 2)"_validtx_3),
    );
*/
/*    

