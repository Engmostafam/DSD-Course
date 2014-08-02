
/*
*/ 

module top(/*AUTOARG*/
   // Outputs
   X_validrx_3, X_validrx_2, X_validrx_1, X_validrx_0, X_full_array_o,
   X_dat_o_3, X_dat_o_2, X_dat_o_1, X_dat_o_0, X_acktx_3, X_acktx_2,
   X_acktx_1, X_acktx_0,
   // Inputs
   rst_i, clk_i, X_validtx_3, X_validtx_2, X_validtx_1, X_validtx_0,
   X_full_array_i, X_dat_i_3, X_dat_i_2, X_dat_i_1, X_dat_i_0,
   X_adr_i_3, X_adr_i_2, X_adr_i_1, X_adr_i_0, X_ackrx_3, X_ackrx_2,
   X_ackrx_1, X_ackrx_0
   );

   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		X_ackrx_0;		// To P0X of port.v
   input		X_ackrx_1;		// To P1X of port.v
   input		X_ackrx_2;		// To P2X of port.v
   input		X_ackrx_3;		// To P3X of port.v
   input [1:0]		X_adr_i_0;		// To P0X of port.v
   input [1:0]		X_adr_i_1;		// To P1X of port.v
   input [1:0]		X_adr_i_2;		// To P2X of port.v
   input [1:0]		X_adr_i_3;		// To P3X of port.v
   input [DW-1:0]	X_dat_i_0;		// To P0X of port.v
   input [DW-1:0]	X_dat_i_1;		// To P1X of port.v
   input [DW-1:0]	X_dat_i_2;		// To P2X of port.v
   input [DW-1:0]	X_dat_i_3;		// To P3X of port.v
   input [N_DEV:0]	X_full_array_i;		// To P0X of port.v, ...
   input		X_validtx_0;		// To P0X of port.v
   input		X_validtx_1;		// To P1X of port.v
   input		X_validtx_2;		// To P2X of port.v
   input		X_validtx_3;		// To P3X of port.v
   input		clk_i;			// To P0X of port.v, ...
   input		rst_i;			// To P0X of port.v, ...
   // End of automatics
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output		X_acktx_0;		// From P0X of port.v
   output		X_acktx_1;		// From P1X of port.v
   output		X_acktx_2;		// From P2X of port.v
   output		X_acktx_3;		// From P3X of port.v
   output [DW-1:0]	X_dat_o_0;		// From P0X of port.v
   output [DW-1:0]	X_dat_o_1;		// From P1X of port.v
   output [DW-1:0]	X_dat_o_2;		// From P2X of port.v
   output [DW-1:0]	X_dat_o_3;		// From P3X of port.v
   output [3:0]		X_full_array_o;		// From P0X of port.v, ...
   output		X_validrx_0;		// From P0X of port.v
   output		X_validrx_1;		// From P1X of port.v
   output		X_validrx_2;		// From P2X of port.v
   output		X_validrx_3;		// From P3X of port.v
   // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [N-1:0]		X_gnt;			// From A_X of arbiter.v
   wire [3:0]		X_rqt;			// From P0X of port.v, ...
   // End of automatics

   /*AUTOREG*/

   parameter DW = 4;// Data Width 
   parameter N  = 4;// Number of ports

   port #(/*AUTOINSTPARAM*/
	  // Parameters
	  .AW_DEV			(AW_DEV),
	  .DW				(DW),
	  .DEPTH			(DEPTH))
   P0X (/*AUTOINST*/
	// Outputs
	.acktx				(X_acktx_0),		 // Templated
	.dat_o				(X_dat_o_0[DW-1:0]),	 // Templated
	.validrx			(X_validrx_0),		 // Templated
	.full				(X_full_array_o[0]),	 // Templated
	.rqt				(X_rqt[0]),		 // Templated
	// Inputs
	.dat_i				(X_dat_i_0[DW-1:0]),	 // Templated
	.adr_i				(X_adr_i_0[1:0]),	 // Templated
	.validtx			(X_validtx_0),		 // Templated
	.ackrx				(X_ackrx_0),		 // Templated
	.rst_i				(rst_i),		 // Templated
	.clk_i				(clk_i),		 // Templated
	.fifo_i				(dat_buf),		 // Templated
	.wen				(wen[0]),		 // Templated
	.gnt				(X_gnt[0]),		 // Templated
	.full_array			(X_full_array_i[N_DEV:0])); // Templated

   port #(/*AUTOINSTPARAM*/
	  // Parameters
	  .AW_DEV			(AW_DEV),
	  .DW				(DW),
	  .DEPTH			(DEPTH))
   P1X (/*AUTOINST*/
	// Outputs
	.acktx				(X_acktx_1),		 // Templated
	.dat_o				(X_dat_o_1[DW-1:0]),	 // Templated
	.validrx			(X_validrx_1),		 // Templated
	.full				(X_full_array_o[1]),	 // Templated
	.rqt				(X_rqt[1]),		 // Templated
	// Inputs
	.dat_i				(X_dat_i_1[DW-1:0]),	 // Templated
	.adr_i				(X_adr_i_1[1:0]),	 // Templated
	.validtx			(X_validtx_1),		 // Templated
	.ackrx				(X_ackrx_1),		 // Templated
	.rst_i				(rst_i),		 // Templated
	.clk_i				(clk_i),		 // Templated
	.fifo_i				(dat_buf),		 // Templated
	.wen				(wen[1]),		 // Templated
	.gnt				(X_gnt[1]),		 // Templated
	.full_array			(X_full_array_i[N_DEV:0])); // Templated

   port #(/*AUTOINSTPARAM*/
	  // Parameters
	  .AW_DEV			(AW_DEV),
	  .DW				(DW),
	  .DEPTH			(DEPTH))
   P2X (/*AUTOINST*/
	// Outputs
	.acktx				(X_acktx_2),		 // Templated
	.dat_o				(X_dat_o_2[DW-1:0]),	 // Templated
	.validrx			(X_validrx_2),		 // Templated
	.full				(X_full_array_o[2]),	 // Templated
	.rqt				(X_rqt[2]),		 // Templated
	// Inputs
	.dat_i				(X_dat_i_2[DW-1:0]),	 // Templated
	.adr_i				(X_adr_i_2[1:0]),	 // Templated
	.validtx			(X_validtx_2),		 // Templated
	.ackrx				(X_ackrx_2),		 // Templated
	.rst_i				(rst_i),		 // Templated
	.clk_i				(clk_i),		 // Templated
	.fifo_i				(dat_buf),		 // Templated
	.wen				(wen[2]),		 // Templated
	.gnt				(X_gnt[2]),		 // Templated
	.full_array			(X_full_array_i[N_DEV:0])); // Templated

   port #(/*AUTOINSTPARAM*/
	  // Parameters
	  .AW_DEV			(AW_DEV),
	  .DW				(DW),
	  .DEPTH			(DEPTH))
   P3X (/*AUTOINST*/
	// Outputs
	.acktx				(X_acktx_3),		 // Templated
	.dat_o				(X_dat_o_3[DW-1:0]),	 // Templated
	.validrx			(X_validrx_3),		 // Templated
	.full				(X_full_array_o[3]),	 // Templated
	.rqt				(X_rqt[3]),		 // Templated
	// Inputs
	.dat_i				(X_dat_i_3[DW-1:0]),	 // Templated
	.adr_i				(X_adr_i_3[1:0]),	 // Templated
	.validtx			(X_validtx_3),		 // Templated
	.ackrx				(X_ackrx_3),		 // Templated
	.rst_i				(rst_i),		 // Templated
	.clk_i				(clk_i),		 // Templated
	.fifo_i				(dat_buf),		 // Templated
	.wen				(wen[3]),		 // Templated
	.gnt				(X_gnt[3]),		 // Templated
	.full_array			(X_full_array_i[N_DEV:0])); // Templated


   arbiter#(/*AUTOINSTPARAM*/
	    // Parameters
	    .N				(N))
   A_X (/*AUTOINST*/
	// Outputs
	.GNT				(X_gnt[N-1:0]),		 // Templated
	// Inputs
	.RQT				(X_rqt[N-1:0]),		 // Templated
	.clk_i				(clk_i),		 // Templated
	.rst_i				(rst_i));		 // Templated

   
   wire [1:0] 		GNT_bin;
   assign GNT_bin = {(GNT[3]|GNT[2]) , (GNT[3]|GNT[1])};

   reg [DW-1:0] 	dat_buf;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     dat_buf <= {DW{1'b0}};
	     // End of automatics
	  end
	else if(|GNT)
	  begin
	     case (GNT_bin)
	       2'b00 : dat_buf <= dat_i_0;
	       2'b01 : dat_buf <= dat_i_1;
	       2'b10 : dat_buf <= dat_i_2;
	       2'b11 : dat_buf <= dat_i_3;
	     endcase // case (GNT_bin)
	  end
     end // always @ (posedge clk_i)

   reg [1:0] 	adr_buf;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     adr_buf <= 2'h0;
	     // End of automatics
	  end
	else if(|GNT)
	  begin
	     case (GNT_bin)
	       2'b00 : adr_buf <= adr_i_0;
	       2'b01 : adr_buf <= adr_i_1;
	       2'b10 : adr_buf <= adr_i_2;
	       2'b11 : adr_buf <= adr_i_3;
	     endcase // case (GNT_bin)
	  end
     end // always @ (posedge clk_i)

   reg [3:0] wen;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     wen <= 4'h0;
	     // End of automatics
	  end
	else if(|GNT)
	  begin
	     case(adr_buf)
	       2'b00 : wen <= 4'h1;
	       2'b01 : wen <= 4'h2;
	       2'b10 : wen <= 4'h4;
	       2'b11 : wen <= 4'h8;
	     endcase // case (adr_buf)
	  end
	else
	  wen <= 4'h0;
     end


   

endmodule // top


// Local Variables:
// verilog-library-directories:("." "../../rtl/arbiter/"  "../../rtl/lab/"   "../../rtl/debouncer/")
// verilog-library-files:("")
// End:


   /*    port AUTO_TEMPLATE (
	  .acktx			(@"(substring vl-cell-name 2)"_acktx_@),
	  .dat_o			(@"(substring vl-cell-name 2)"_dat_o_@[DW-1:0]),
	  .validrx			(@"(substring vl-cell-name 2)"_validrx_@),
	  .adr_i			(@"(substring vl-cell-name 2)"_adr_i_@[1:0]),
	  .dat_i			(@"(substring vl-cell-name 2)"_dat_i_@[DW-1:0]),
	  .validtx			(@"(substring vl-cell-name 2)"_validtx_@),
	  .ackrx			(@"(substring vl-cell-name 2)"_ackrx_@),
	  .rst_i			(rst_i),
	  .clk_i			(clk_i),
	  .full				(@"(substring vl-cell-name 2)"_full_array_o[@]),
	  .rqt				(@"(substring vl-cell-name 2)"_rqt[@]),
	  .fifo_i			(dat_buf),
	  .wen				(wen[@]),
	  .gnt				(@"(substring vl-cell-name 2)"_gnt[@]),
	  .full_array			(@"(substring vl-cell-name 2)"_full_array_i[N_DEV:0]));


    );
*/
/*    

    arbiter AUTO_TEMPLATE (
	 .GNT				(@"(substring vl-cell-name 2)"_gnt[N-1:0]),
	 .RQT				(@"(substring vl-cell-name 2)"_rqt[N-1:0]),
	 .clk_i				(clk_i),
	 .rst_i				(rst_i),
    );
    */

