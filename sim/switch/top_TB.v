module top_TB (/*AUTOARG*/);

   parameter DW = 4;// Data Width
   parameter DEPTH = 2;// Defining Fifo Width to be 4

  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg			X_ackrx_0;		// To top of switch_top.v
  reg			X_ackrx_1;		// To top of switch_top.v
  reg			X_ackrx_2;		// To top of switch_top.v
  reg			X_ackrx_3;		// To top of switch_top.v
  reg [1:0]		Y_adr_i_0;		// To top of switch_top.v
  reg [1:0]		Y_adr_i_1;		// To top of switch_top.v
  reg [1:0]		Y_adr_i_2;		// To top of switch_top.v
  reg [1:0]		Y_adr_i_3;		// To top of switch_top.v
  reg [DW-1:0]		Y_dat_i_0;		// To top of switch_top.v
  reg [DW-1:0]		Y_dat_i_1;		// To top of switch_top.v
  reg [DW-1:0]		Y_dat_i_2;		// To top of switch_top.v
  reg [DW-1:0]		Y_dat_i_3;		// To top of switch_top.v
  reg			Y_validtx_0;		// To top of switch_top.v
  reg			Y_validtx_1;		// To top of switch_top.v
  reg			Y_validtx_2;		// To top of switch_top.v
  reg			Y_validtx_3;		// To top of switch_top.v
  reg			clk_i;			// To top of switch_top.v
  reg			clk_i2;			// To top of switch_top.v
  reg			push_button;		// To top of switch_top.v
  reg			rst_i;			// To top of switch_top.v
  reg [1:0]		switch;			// To top of switch_top.v
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [3:0]		LED;			// From top of switch_top.v
   wire [DW-1:0]	X_dat_o_0;		// From top of switch_top.v
   wire [DW-1:0]	X_dat_o_1;		// From top of switch_top.v
   wire [DW-1:0]	X_dat_o_2;		// From top of switch_top.v
   wire [DW-1:0]	X_dat_o_3;		// From top of switch_top.v
   wire			X_validrx_0;		// From top of switch_top.v
   wire			X_validrx_1;		// From top of switch_top.v
   wire			X_validrx_2;		// From top of switch_top.v
   wire			X_validrx_3;		// From top of switch_top.v
   wire			Y_acktx_0;		// From top of switch_top.v
   wire			Y_acktx_1;		// From top of switch_top.v
   wire			Y_acktx_2;		// From top of switch_top.v
   wire			Y_acktx_3;		// From top of switch_top.v
   wire [3:0]		valids;			// From top of switch_top.v
   // End of automatics

   switch_top #(/*AUTOINSTPARAM*/
		// Parameters
		.DW			(DW),
		.DEPTH			(DEPTH))
   top (/*AUTOINST*/
	// Outputs
	.X_dat_o_0			(X_dat_o_0[DW-1:0]),
	.X_dat_o_1			(X_dat_o_1[DW-1:0]),
	.X_dat_o_2			(X_dat_o_2[DW-1:0]),
	.X_dat_o_3			(X_dat_o_3[DW-1:0]),
	.X_validrx_0			(X_validrx_0),
	.X_validrx_1			(X_validrx_1),
	.X_validrx_2			(X_validrx_2),
	.X_validrx_3			(X_validrx_3),
	.Y_acktx_0			(Y_acktx_0),
	.Y_acktx_1			(Y_acktx_1),
	.Y_acktx_2			(Y_acktx_2),
	.Y_acktx_3			(Y_acktx_3),
	.LED				(LED[3:0]),
	.valids				(valids[3:0]),
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
	.Y_validtx_0			(Y_validtx_0),
	.Y_validtx_1			(Y_validtx_1),
	.Y_validtx_2			(Y_validtx_2),
	.Y_validtx_3			(Y_validtx_3),
	.clk_i				(clk_i),
	.clk_i2				(clk_i2),
	.rst_i				(rst_i),
	.push_button			(push_button),
	.switch				(switch[1:0]));





   // Clock Generation
   always #7 clk_i <= ~clk_i;
   always #5 clk_i2 <= ~clk_i2;

   
   initial begin
      $dumpfile("top_TB.vcd");
      $dumpvars(0,top_TB);

      clk_i <= $random;
      clk_i2 <= $random;
      rst_i <= 0;
      push_button <= 0;
      switch <= 2'b00;
      
      
      #20 rst_i <= 1;
      #20 rst_i <= 0;

      #300 
	switch <= 2'b01;
      #10
	switch <= 2'b10;
      #10
	switch <= 2'b11;
      #10 
	switch <= 2'b00;
      #10
	push_button <= 1;
      #30
	push_button <= 0;
      #10
	switch <= 2'b01;
      #10
	switch <= 2'b10;
      #10 
	switch <= 2'b11;
      #10
	switch <= 2'b00;
      #10
	push_button <= 1;
      #30
	push_button <= 0;
      #10
	switch <= 2'b01;
      #10
	switch <= 2'b10;
      #10 
	switch <= 2'b11;
      #10
	switch <= 2'b00;
      #10
	push_button <= 1;
      #30
	push_button <= 0;
      #10
	switch <= 2'b01;
      #10
	switch <= 2'b10;
      #10 
	switch <= 2'b11;
      #10
	switch <= 2'b00;
      #10
	push_button <= 1;
      #30
	push_button <= 0;

      

      
$finish;
      
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
