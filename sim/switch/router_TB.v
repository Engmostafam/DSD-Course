module router_TB (/*AUTOARG*/);

   parameter DW = 4;// Data Width
   parameter DEPTH = 2;// Defining Fifo Width to be 4
   parameter A_sw_adr = 1'b0;
   parameter B_sw_adr = 1'b1;

   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg			clk_i;			// To router0 of router.v
   reg			ex_clk;			// To D0BY of r_device.v, ...
   reg			rst_i;			// To router0 of router.v, ...
   // End of automatics
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			AX_ackrx_0;		// From D0AX of r_device.v
   wire			AX_ackrx_1;		// From D1AX of r_device.v
   wire			AX_ackrx_2;		// From D2AX of r_device.v
   wire			AX_acktx_0;		// From router0 of router.v
   wire			AX_acktx_1;		// From router0 of router.v
   wire			AX_acktx_2;		// From router0 of router.v
   wire [2:0]		AX_adr_i_0;		// From D0AX of r_device.v
   wire [2:0]		AX_adr_i_1;		// From D1AX of r_device.v
   wire [2:0]		AX_adr_i_2;		// From D2AX of r_device.v
   wire [DW-1:0]	AX_dat_i_0;		// From D0AX of r_device.v
   wire [DW-1:0]	AX_dat_i_1;		// From D1AX of r_device.v
   wire [DW-1:0]	AX_dat_i_2;		// From D2AX of r_device.v
   wire [DW+2:0]	AX_dat_o_0;		// From router0 of router.v
   wire [DW+2:0]	AX_dat_o_1;		// From router0 of router.v
   wire [DW+2:0]	AX_dat_o_2;		// From router0 of router.v
   wire			AX_validrx_0;		// From router0 of router.v
   wire			AX_validrx_1;		// From router0 of router.v
   wire			AX_validrx_2;		// From router0 of router.v
   wire			AX_validtx_0;		// From D0AX of r_device.v
   wire			AX_validtx_1;		// From D1AX of r_device.v
   wire			AX_validtx_2;		// From D2AX of r_device.v
   wire			AY_ackrx_0;		// From D0AY of r_device.v
   wire			AY_ackrx_1;		// From D1AY of r_device.v
   wire			AY_ackrx_2;		// From D2AY of r_device.v
   wire			AY_acktx_0;		// From router0 of router.v
   wire			AY_acktx_1;		// From router0 of router.v
   wire			AY_acktx_2;		// From router0 of router.v
   wire [2:0]		AY_adr_i_0;		// From D0AY of r_device.v
   wire [2:0]		AY_adr_i_1;		// From D1AY of r_device.v
   wire [2:0]		AY_adr_i_2;		// From D2AY of r_device.v
   wire [DW-1:0]	AY_dat_i_0;		// From D0AY of r_device.v
   wire [DW-1:0]	AY_dat_i_1;		// From D1AY of r_device.v
   wire [DW-1:0]	AY_dat_i_2;		// From D2AY of r_device.v
   wire [DW+2:0]	AY_dat_o_0;		// From router0 of router.v
   wire [DW+2:0]	AY_dat_o_1;		// From router0 of router.v
   wire [DW+2:0]	AY_dat_o_2;		// From router0 of router.v
   wire			AY_validrx_0;		// From router0 of router.v
   wire			AY_validrx_1;		// From router0 of router.v
   wire			AY_validrx_2;		// From router0 of router.v
   wire			AY_validtx_0;		// From D0AY of r_device.v
   wire			AY_validtx_1;		// From D1AY of r_device.v
   wire			AY_validtx_2;		// From D2AY of r_device.v
   wire			BX_ackrx_0;		// From D0BX of r_device.v
   wire			BX_ackrx_1;		// From D1BX of r_device.v
   wire			BX_ackrx_2;		// From D2BX of r_device.v
   wire			BX_acktx_0;		// From router0 of router.v
   wire			BX_acktx_1;		// From router0 of router.v
   wire			BX_acktx_2;		// From router0 of router.v
   wire [2:0]		BX_adr_i_0;		// From D0BX of r_device.v
   wire [2:0]		BX_adr_i_1;		// From D1BX of r_device.v
   wire [2:0]		BX_adr_i_2;		// From D2BX of r_device.v
   wire [DW-1:0]	BX_dat_i_0;		// From D0BX of r_device.v
   wire [DW-1:0]	BX_dat_i_1;		// From D1BX of r_device.v
   wire [DW-1:0]	BX_dat_i_2;		// From D2BX of r_device.v
   wire [DW+2:0]	BX_dat_o_0;		// From router0 of router.v
   wire [DW+2:0]	BX_dat_o_1;		// From router0 of router.v
   wire [DW+2:0]	BX_dat_o_2;		// From router0 of router.v
   wire			BX_validrx_0;		// From router0 of router.v
   wire			BX_validrx_1;		// From router0 of router.v
   wire			BX_validrx_2;		// From router0 of router.v
   wire			BX_validtx_0;		// From D0BX of r_device.v
   wire			BX_validtx_1;		// From D1BX of r_device.v
   wire			BX_validtx_2;		// From D2BX of r_device.v
   wire			BY_ackrx_0;		// From D0BY of r_device.v
   wire			BY_ackrx_1;		// From D1BY of r_device.v
   wire			BY_ackrx_2;		// From D2BY of r_device.v
   wire			BY_acktx_0;		// From router0 of router.v
   wire			BY_acktx_1;		// From router0 of router.v
   wire			BY_acktx_2;		// From router0 of router.v
   wire [2:0]		BY_adr_i_0;		// From D0BY of r_device.v
   wire [2:0]		BY_adr_i_1;		// From D1BY of r_device.v
   wire [2:0]		BY_adr_i_2;		// From D2BY of r_device.v
   wire [DW-1:0]	BY_dat_i_0;		// From D0BY of r_device.v
   wire [DW-1:0]	BY_dat_i_1;		// From D1BY of r_device.v
   wire [DW-1:0]	BY_dat_i_2;		// From D2BY of r_device.v
   wire [DW+2:0]	BY_dat_o_0;		// From router0 of router.v
   wire [DW+2:0]	BY_dat_o_1;		// From router0 of router.v
   wire [DW+2:0]	BY_dat_o_2;		// From router0 of router.v
   wire			BY_validrx_0;		// From router0 of router.v
   wire			BY_validrx_1;		// From router0 of router.v
   wire			BY_validrx_2;		// From router0 of router.v
   wire			BY_validtx_0;		// From D0BY of r_device.v
   wire			BY_validtx_1;		// From D1BY of r_device.v
   wire			BY_validtx_2;		// From D2BY of r_device.v
   // End of automatics
   
   router #(/*AUTOINSTPARAM*/
	    // Parameters
	    .DW				(DW),
	    .DEPTH			(DEPTH),
	    .A_sw_adr			(A_sw_adr),
	    .B_sw_adr			(B_sw_adr))
   router0 (/*AUTOINST*/
	    // Outputs
	    .AX_acktx_0			(AX_acktx_0),
	    .AX_acktx_1			(AX_acktx_1),
	    .AX_acktx_2			(AX_acktx_2),
	    .AX_dat_o_0			(AX_dat_o_0[DW+2:0]),
	    .AX_dat_o_1			(AX_dat_o_1[DW+2:0]),
	    .AX_dat_o_2			(AX_dat_o_2[DW+2:0]),
	    .AX_validrx_0		(AX_validrx_0),
	    .AX_validrx_1		(AX_validrx_1),
	    .AX_validrx_2		(AX_validrx_2),
	    .AY_acktx_0			(AY_acktx_0),
	    .AY_acktx_1			(AY_acktx_1),
	    .AY_acktx_2			(AY_acktx_2),
	    .AY_dat_o_0			(AY_dat_o_0[DW+2:0]),
	    .AY_dat_o_1			(AY_dat_o_1[DW+2:0]),
	    .AY_dat_o_2			(AY_dat_o_2[DW+2:0]),
	    .AY_validrx_0		(AY_validrx_0),
	    .AY_validrx_1		(AY_validrx_1),
	    .AY_validrx_2		(AY_validrx_2),
	    .BX_acktx_0			(BX_acktx_0),
	    .BX_acktx_1			(BX_acktx_1),
	    .BX_acktx_2			(BX_acktx_2),
	    .BX_dat_o_0			(BX_dat_o_0[DW+2:0]),
	    .BX_dat_o_1			(BX_dat_o_1[DW+2:0]),
	    .BX_dat_o_2			(BX_dat_o_2[DW+2:0]),
	    .BX_validrx_0		(BX_validrx_0),
	    .BX_validrx_1		(BX_validrx_1),
	    .BX_validrx_2		(BX_validrx_2),
	    .BY_acktx_0			(BY_acktx_0),
	    .BY_acktx_1			(BY_acktx_1),
	    .BY_acktx_2			(BY_acktx_2),
	    .BY_dat_o_0			(BY_dat_o_0[DW+2:0]),
	    .BY_dat_o_1			(BY_dat_o_1[DW+2:0]),
	    .BY_dat_o_2			(BY_dat_o_2[DW+2:0]),
	    .BY_validrx_0		(BY_validrx_0),
	    .BY_validrx_1		(BY_validrx_1),
	    .BY_validrx_2		(BY_validrx_2),
	    // Inputs
	    .AX_ackrx_0			(AX_ackrx_0),
	    .AX_ackrx_1			(AX_ackrx_1),
	    .AX_ackrx_2			(AX_ackrx_2),
	    .AX_adr_i_0			(AX_adr_i_0[2:0]),
	    .AX_adr_i_1			(AX_adr_i_1[2:0]),
	    .AX_adr_i_2			(AX_adr_i_2[2:0]),
	    .AX_dat_i_0			(AX_dat_i_0[DW-1:0]),
	    .AX_dat_i_1			(AX_dat_i_1[DW-1:0]),
	    .AX_dat_i_2			(AX_dat_i_2[DW-1:0]),
	    .AX_validtx_0		(AX_validtx_0),
	    .AX_validtx_1		(AX_validtx_1),
	    .AX_validtx_2		(AX_validtx_2),
	    .AY_ackrx_0			(AY_ackrx_0),
	    .AY_ackrx_1			(AY_ackrx_1),
	    .AY_ackrx_2			(AY_ackrx_2),
	    .AY_adr_i_0			(AY_adr_i_0[2:0]),
	    .AY_adr_i_1			(AY_adr_i_1[2:0]),
	    .AY_adr_i_2			(AY_adr_i_2[2:0]),
	    .AY_dat_i_0			(AY_dat_i_0[DW-1:0]),
	    .AY_dat_i_1			(AY_dat_i_1[DW-1:0]),
	    .AY_dat_i_2			(AY_dat_i_2[DW-1:0]),
	    .AY_validtx_0		(AY_validtx_0),
	    .AY_validtx_1		(AY_validtx_1),
	    .AY_validtx_2		(AY_validtx_2),
	    .BX_ackrx_0			(BX_ackrx_0),
	    .BX_ackrx_1			(BX_ackrx_1),
	    .BX_ackrx_2			(BX_ackrx_2),
	    .BX_adr_i_0			(BX_adr_i_0[2:0]),
	    .BX_adr_i_1			(BX_adr_i_1[2:0]),
	    .BX_adr_i_2			(BX_adr_i_2[2:0]),
	    .BX_dat_i_0			(BX_dat_i_0[DW-1:0]),
	    .BX_dat_i_1			(BX_dat_i_1[DW-1:0]),
	    .BX_dat_i_2			(BX_dat_i_2[DW-1:0]),
	    .BX_validtx_0		(BX_validtx_0),
	    .BX_validtx_1		(BX_validtx_1),
	    .BX_validtx_2		(BX_validtx_2),
	    .BY_ackrx_0			(BY_ackrx_0),
	    .BY_ackrx_1			(BY_ackrx_1),
	    .BY_ackrx_2			(BY_ackrx_2),
	    .BY_adr_i_0			(BY_adr_i_0[2:0]),
	    .BY_adr_i_1			(BY_adr_i_1[2:0]),
	    .BY_adr_i_2			(BY_adr_i_2[2:0]),
	    .BY_dat_i_0			(BY_dat_i_0[DW-1:0]),
	    .BY_dat_i_1			(BY_dat_i_1[DW-1:0]),
	    .BY_dat_i_2			(BY_dat_i_2[DW-1:0]),
	    .BY_validtx_0		(BY_validtx_0),
	    .BY_validtx_1		(BY_validtx_1),
	    .BY_validtx_2		(BY_validtx_2),
	    .clk_i			(clk_i),
	    .rst_i			(rst_i));

   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D0BY (/*AUTOINST*/
	 // Outputs
	 .adr_i				(BY_adr_i_0[2:0]),	 // Templated
	 .dat_i				(BY_dat_i_0[DW-1:0]),	 // Templated
	 .validtx			(BY_validtx_0),		 // Templated
	 .ackrx				(BY_ackrx_0),		 // Templated
	 // Inputs
	 .acktx				(BY_acktx_0),		 // Templated
	 .validrx			(BY_validrx_0),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated

   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D0AY (/*AUTOINST*/
	 // Outputs
	 .adr_i				(AY_adr_i_0[2:0]),	 // Templated
	 .dat_i				(AY_dat_i_0[DW-1:0]),	 // Templated
	 .validtx			(AY_validtx_0),		 // Templated
	 .ackrx				(AY_ackrx_0),		 // Templated
	 // Inputs
	 .acktx				(AY_acktx_0),		 // Templated
	 .validrx			(AY_validrx_0),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated

   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D1BY (/*AUTOINST*/
	 // Outputs
	 .adr_i				(BY_adr_i_1[2:0]),	 // Templated
	 .dat_i				(BY_dat_i_1[DW-1:0]),	 // Templated
	 .validtx			(BY_validtx_1),		 // Templated
	 .ackrx				(BY_ackrx_1),		 // Templated
	 // Inputs
	 .acktx				(BY_acktx_1),		 // Templated
	 .validrx			(BY_validrx_1),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated


   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D1AY (/*AUTOINST*/
	 // Outputs
	 .adr_i				(AY_adr_i_1[2:0]),	 // Templated
	 .dat_i				(AY_dat_i_1[DW-1:0]),	 // Templated
	 .validtx			(AY_validtx_1),		 // Templated
	 .ackrx				(AY_ackrx_1),		 // Templated
	 // Inputs
	 .acktx				(AY_acktx_1),		 // Templated
	 .validrx			(AY_validrx_1),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated

   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D2BY (/*AUTOINST*/
	 // Outputs
	 .adr_i				(BY_adr_i_2[2:0]),	 // Templated
	 .dat_i				(BY_dat_i_2[DW-1:0]),	 // Templated
	 .validtx			(BY_validtx_2),		 // Templated
	 .ackrx				(BY_ackrx_2),		 // Templated
	 // Inputs
	 .acktx				(BY_acktx_2),		 // Templated
	 .validrx			(BY_validrx_2),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated

   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D2AY (/*AUTOINST*/
	 // Outputs
	 .adr_i				(AY_adr_i_2[2:0]),	 // Templated
	 .dat_i				(AY_dat_i_2[DW-1:0]),	 // Templated
	 .validtx			(AY_validtx_2),		 // Templated
	 .ackrx				(AY_ackrx_2),		 // Templated
	 // Inputs
	 .acktx				(AY_acktx_2),		 // Templated
	 .validrx			(AY_validrx_2),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated

   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D0BX (/*AUTOINST*/
	 // Outputs
	 .adr_i				(BX_adr_i_0[2:0]),	 // Templated
	 .dat_i				(BX_dat_i_0[DW-1:0]),	 // Templated
	 .validtx			(BX_validtx_0),		 // Templated
	 .ackrx				(BX_ackrx_0),		 // Templated
	 // Inputs
	 .acktx				(BX_acktx_0),		 // Templated
	 .validrx			(BX_validrx_0),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated

   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D0AX (/*AUTOINST*/
	 // Outputs
	 .adr_i				(AX_adr_i_0[2:0]),	 // Templated
	 .dat_i				(AX_dat_i_0[DW-1:0]),	 // Templated
	 .validtx			(AX_validtx_0),		 // Templated
	 .ackrx				(AX_ackrx_0),		 // Templated
	 // Inputs
	 .acktx				(AX_acktx_0),		 // Templated
	 .validrx			(AX_validrx_0),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated

   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D1BX (/*AUTOINST*/
	 // Outputs
	 .adr_i				(BX_adr_i_1[2:0]),	 // Templated
	 .dat_i				(BX_dat_i_1[DW-1:0]),	 // Templated
	 .validtx			(BX_validtx_1),		 // Templated
	 .ackrx				(BX_ackrx_1),		 // Templated
	 // Inputs
	 .acktx				(BX_acktx_1),		 // Templated
	 .validrx			(BX_validrx_1),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated


   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D1AX (/*AUTOINST*/
	 // Outputs
	 .adr_i				(AX_adr_i_1[2:0]),	 // Templated
	 .dat_i				(AX_dat_i_1[DW-1:0]),	 // Templated
	 .validtx			(AX_validtx_1),		 // Templated
	 .ackrx				(AX_ackrx_1),		 // Templated
	 // Inputs
	 .acktx				(AX_acktx_1),		 // Templated
	 .validrx			(AX_validrx_1),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated

  r_device #(/*AUTOINSTPARAM*/
	     // Parameters
	     .DW			(DW))
   D2BX (/*AUTOINST*/
	 // Outputs
	 .adr_i				(BX_adr_i_2[2:0]),	 // Templated
	 .dat_i				(BX_dat_i_2[DW-1:0]),	 // Templated
	 .validtx			(BX_validtx_2),		 // Templated
	 .ackrx				(BX_ackrx_2),		 // Templated
	 // Inputs
	 .acktx				(BX_acktx_2),		 // Templated
	 .validrx			(BX_validrx_2),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated

   r_device #(/*AUTOINSTPARAM*/
	      // Parameters
	      .DW			(DW))
   D2AX (/*AUTOINST*/
	 // Outputs
	 .adr_i				(AX_adr_i_2[2:0]),	 // Templated
	 .dat_i				(AX_dat_i_2[DW-1:0]),	 // Templated
	 .validtx			(AX_validtx_2),		 // Templated
	 .ackrx				(AX_ackrx_2),		 // Templated
	 // Inputs
	 .acktx				(AX_acktx_2),		 // Templated
	 .validrx			(AX_validrx_2),		 // Templated
	 .clk_i				(ex_clk),		 // Templated
	 .rst_i				(rst_i));		 // Templated



   // Clock Generation
   always #5 clk_i <= ~clk_i;
   always #7 ex_clk <= ~ex_clk;

   
   initial begin
      $dumpfile("router_TB.vcd");
      $dumpvars(0,router_TB);

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


   /*    r_device AUTO_TEMPLATE (
	  .acktx			(@"(substring vl-cell-name 2)"_acktx_@),
	  .validrx			(@"(substring vl-cell-name 2)"_validrx_@),
	  .adr_i			(@"(substring vl-cell-name 2)"_adr_i_@[2:0]),
	  .dat_i			(@"(substring vl-cell-name 2)"_dat_i_@[DW-1:0]),
	  .validtx			(@"(substring vl-cell-name 2)"_validtx_@),
	  .ackrx			(@"(substring vl-cell-name 2)"_ackrx_@),
	  .rst_i			(rst_i),
	  .clk_i			(ex_clk),
    );
*/
/*    
