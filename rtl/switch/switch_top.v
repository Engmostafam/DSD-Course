// Combines the switch with the dummy devices for testing
module switch_top (/*AUTOARG*/
   // Outputs
   adr_int_3, adr_int_2, adr_int_1, adr_int_0, Y_acktx_3, Y_acktx_2,
   Y_acktx_1, Y_acktx_0, X_validrx_3, X_validrx_2, X_validrx_1,
   X_validrx_0, X_dat_o_3, X_dat_o_2, X_dat_o_1, X_dat_o_0, LED,
   valids,
   // Inputs
   rst_i, clk_i2, clk_i, Y_validtx_3, Y_validtx_2, Y_validtx_1,
   Y_validtx_0, Y_dat_i_3, Y_dat_i_2, Y_dat_i_1, Y_dat_i_0, Y_adr_i_3,
   Y_adr_i_2, Y_adr_i_1, Y_adr_i_0, X_ackrx_3, X_ackrx_2, X_ackrx_1,
   X_ackrx_0, push_button, switch
   );

   parameter DW = 4;// Data Width
   parameter DEPTH = 2;// Defining Fifo Width to be 4

   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		X_ackrx_0;		// To switch0 of switch.v
   input		X_ackrx_1;		// To switch0 of switch.v
   input		X_ackrx_2;		// To switch0 of switch.v
   input		X_ackrx_3;		// To switch0 of switch.v
   input [2:0]		Y_adr_i_0;		// To switch0 of switch.v
   input [2:0]		Y_adr_i_1;		// To switch0 of switch.v
   input [2:0]		Y_adr_i_2;		// To switch0 of switch.v
   input [2:0]		Y_adr_i_3;		// To switch0 of switch.v
   input [DW-1:0]	Y_dat_i_0;		// To switch0 of switch.v
   input [DW-1:0]	Y_dat_i_1;		// To switch0 of switch.v
   input [DW-1:0]	Y_dat_i_2;		// To switch0 of switch.v
   input [DW-1:0]	Y_dat_i_3;		// To switch0 of switch.v
   input		Y_validtx_0;		// To switch0 of switch.v
   input		Y_validtx_1;		// To switch0 of switch.v
   input		Y_validtx_2;		// To switch0 of switch.v
   input		Y_validtx_3;		// To switch0 of switch.v
   input		clk_i;			// To switch0 of switch.v
   input		clk_i2;			// To D0X of xdevice.v, ...
   input		rst_i;			// To switch0 of switch.v, ...
   // End of automatics

   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output [DW-1:0]	X_dat_o_0;		// From switch0 of switch.v
   output [DW-1:0]	X_dat_o_1;		// From switch0 of switch.v
   output [DW-1:0]	X_dat_o_2;		// From switch0 of switch.v
   output [DW-1:0]	X_dat_o_3;		// From switch0 of switch.v
   output		X_validrx_0;		// From switch0 of switch.v
   output		X_validrx_1;		// From switch0 of switch.v
   output		X_validrx_2;		// From switch0 of switch.v
   output		X_validrx_3;		// From switch0 of switch.v
   output		Y_acktx_0;		// From switch0 of switch.v
   output		Y_acktx_1;		// From switch0 of switch.v
   output		Y_acktx_2;		// From switch0 of switch.v
   output		Y_acktx_3;		// From switch0 of switch.v
   output [2:0]		adr_int_0;		// From switch0 of switch.v
   output [2:0]		adr_int_1;		// From switch0 of switch.v
   output [2:0]		adr_int_2;		// From switch0 of switch.v
   output [2:0]		adr_int_3;		// From switch0 of switch.v
   // End of automatics

   output [3:0] 	LED; // LED LSB
   output [3:0] 	valids; //  LED MSB
   input 		push_button;
   input [1:0] 		switch;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			X_acktx_0;		// From switch0 of switch.v
   wire			X_acktx_1;		// From switch0 of switch.v
   wire			X_acktx_2;		// From switch0 of switch.v
   wire			X_acktx_3;		// From switch0 of switch.v
   wire [1:0]		X_adr_i_0;		// From D0X of xdevice.v
   wire [1:0]		X_adr_i_1;		// From D1X of xdevice.v
   wire [1:0]		X_adr_i_2;		// From D2X of xdevice.v
   wire [1:0]		X_adr_i_3;		// From D3X of xdevice.v
   wire [DW-1:0]	X_dat_i_0;		// From D0X of xdevice.v
   wire [DW-1:0]	X_dat_i_1;		// From D1X of xdevice.v
   wire [DW-1:0]	X_dat_i_2;		// From D2X of xdevice.v
   wire [DW-1:0]	X_dat_i_3;		// From D3X of xdevice.v
   wire			X_validtx_0;		// From D0X of xdevice.v
   wire			X_validtx_1;		// From D1X of xdevice.v
   wire			X_validtx_2;		// From D2X of xdevice.v
   wire			X_validtx_3;		// From D3X of xdevice.v
   // End of automatics


   wire [DW-1:0] 	Y_dat_o_0;		
   wire [DW-1:0]	Y_dat_o_1;		
   wire [DW-1:0]	Y_dat_o_2;		
   wire [DW-1:0]	Y_dat_o_3;		
   wire 		Y_validrx_0;		
   wire 		Y_validrx_1;		
   wire 		Y_validrx_2;		
   wire 		Y_validrx_3;
   wire 		Y_ackrx_0;
   wire 		Y_ackrx_1;
   wire 		Y_ackrx_2;
   wire 		Y_ackrx_3;

   

   switch #(/*AUTOINSTPARAM*/
	    // Parameters
	    .DW				(DW),
	    .DEPTH			(DEPTH))
   switch0 (
	    .Y_dat_o_0			(Y_dat_o_0[DW-1:0]),
	    .Y_dat_o_1			(Y_dat_o_1[DW-1:0]),
	    .Y_dat_o_2			(Y_dat_o_2[DW-1:0]),
	    .Y_dat_o_3			(Y_dat_o_3[DW-1:0]),
	    .Y_validrx_0		(Y_validrx_0),
	    .Y_validrx_1		(Y_validrx_1),
	    .Y_validrx_2		(Y_validrx_2),
	    .Y_validrx_3		(Y_validrx_3),
	    /*AUTOINST*/
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
	    .adr_int_0			(adr_int_0[2:0]),
	    .adr_int_1			(adr_int_1[2:0]),
	    .adr_int_2			(adr_int_2[2:0]),
	    .adr_int_3			(adr_int_3[2:0]),
	    // Inputs
	    .X_ackrx_0			(X_ackrx_0),
	    .X_ackrx_1			(X_ackrx_1),
	    .X_ackrx_2			(X_ackrx_2),
	    .X_ackrx_3			(X_ackrx_3),
	    .X_adr_i_0			(X_adr_i_0[2:0]),
	    .X_adr_i_1			(X_adr_i_1[2:0]),
	    .X_adr_i_2			(X_adr_i_2[2:0]),
	    .X_adr_i_3			(X_adr_i_3[2:0]),
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
	    .Y_adr_i_0			(Y_adr_i_0[2:0]),
	    .Y_adr_i_1			(Y_adr_i_1[2:0]),
	    .Y_adr_i_2			(Y_adr_i_2[2:0]),
	    .Y_adr_i_3			(Y_adr_i_3[2:0]),
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

   xdevice #(/*AUTOINSTPARAM*/
	     // Parameters
	     .DW			(DW),
	     .init			(0))			 // Templated
   D0X (/*AUTOINST*/
	// Outputs
	.adr_i				(X_adr_i_0[1:0]),	 // Templated
	.dat_i				(X_dat_i_0[DW-1:0]),	 // Templated
	.validtx			(X_validtx_0),		 // Templated
	// Inputs
	.acktx				(X_acktx_0),		 // Templated
	.clk_i2				(clk_i2),
	.rst_i				(rst_i));		 // Templated

      xdevice #(/*AUTOINSTPARAM*/
		// Parameters
		.DW			(DW),
		.init			(1))			 // Templated
   D1X (/*AUTOINST*/
	// Outputs
	.adr_i				(X_adr_i_1[1:0]),	 // Templated
	.dat_i				(X_dat_i_1[DW-1:0]),	 // Templated
	.validtx			(X_validtx_1),		 // Templated
	// Inputs
	.acktx				(X_acktx_1),		 // Templated
	.clk_i2				(clk_i2),
	.rst_i				(rst_i));		 // Templated

      xdevice #(/*AUTOINSTPARAM*/
		// Parameters
		.DW			(DW),
		.init			(2))			 // Templated
   D2X (/*AUTOINST*/
	// Outputs
	.adr_i				(X_adr_i_2[1:0]),	 // Templated
	.dat_i				(X_dat_i_2[DW-1:0]),	 // Templated
	.validtx			(X_validtx_2),		 // Templated
	// Inputs
	.acktx				(X_acktx_2),		 // Templated
	.clk_i2				(clk_i2),
	.rst_i				(rst_i));		 // Templated

      xdevice #(/*AUTOINSTPARAM*/
		// Parameters
		.DW			(DW),
		.init			(3))			 // Templated
   D3X (/*AUTOINST*/
	// Outputs
	.adr_i				(X_adr_i_3[1:0]),	 // Templated
	.dat_i				(X_dat_i_3[DW-1:0]),	 // Templated
	.validtx			(X_validtx_3),		 // Templated
	// Inputs
	.acktx				(X_acktx_3),		 // Templated
	.clk_i2				(clk_i2),
	.rst_i				(rst_i));		 // Templated


   reg [3:0] 		LED;
   
   always @(/*AUTOSENSE*/Y_dat_o_0 or Y_dat_o_1 or Y_dat_o_2
	    or Y_dat_o_3 or switch)
     begin
	case (switch)
	  2'b00 : LED <= Y_dat_o_0;
	  2'b01 : LED <= Y_dat_o_1;
	  2'b10 : LED <= Y_dat_o_2;
	  2'b11 : LED <= Y_dat_o_3;
	endcase // case (switch)
     end

   assign valids = {Y_validrx_0, Y_validrx_1, Y_validrx_2, Y_validrx_3};

   assign Y_ackrx_0 = push_button;
   assign Y_ackrx_1 = push_button;
   assign Y_ackrx_2 = push_button;
   assign Y_ackrx_3 = push_button;
   
   

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
