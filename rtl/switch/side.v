/*
 switch side
 Wraps the ports and creates mux for data to be delivered to the other side
*/ 

module side(/*AUTOARG*/
   // Outputs
   validrx_3, validrx_2, validrx_1, validrx_0, full_o, dat_o_3,
   dat_o_2, dat_o_1, dat_o_0, acktx_3, acktx_2, acktx_1, acktx_0,
   int_wen_o, int_dat_o,
   // Inputs
   validtx_3, validtx_2, validtx_1, validtx_0, rst_i, int_wen_i,
   int_dat_i, full_i, dat_i_3, dat_i_2, dat_i_1, dat_i_0, clk_i,
   adr_i_3, adr_i_2, adr_i_1, adr_i_0, ackrx_3, ackrx_2, ackrx_1,
   ackrx_0
   );


   output [N_DEV-1:0] int_wen_o;
   output [DW-1:0]    int_dat_o;
   
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		ackrx_0;		// To P0 of port.v
   input		ackrx_1;		// To P1 of port.v
   input		ackrx_2;		// To P2 of port.v
   input		ackrx_3;		// To P3 of port.v
   input [1:0]		adr_i_0;		// To P0 of port.v
   input [1:0]		adr_i_1;		// To P1 of port.v
   input [1:0]		adr_i_2;		// To P2 of port.v
   input [1:0]		adr_i_3;		// To P3 of port.v
   input		clk_i;			// To P0 of port.v, ...
   input [DW-1:0]	dat_i_0;		// To P0 of port.v
   input [DW-1:0]	dat_i_1;		// To P1 of port.v
   input [DW-1:0]	dat_i_2;		// To P2 of port.v
   input [DW-1:0]	dat_i_3;		// To P3 of port.v
   input [N_DEV-1:0]	full_i;			// To P0 of port.v, ...
   input [DW-1:0]	int_dat_i;		// To P0 of port.v, ...
   input [3:0]		int_wen_i;		// To P0 of port.v, ...
   input		rst_i;			// To P0 of port.v, ...
   input		validtx_0;		// To P0 of port.v
   input		validtx_1;		// To P1 of port.v
   input		validtx_2;		// To P2 of port.v
   input		validtx_3;		// To P3 of port.v
   // End of automatics
   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output		acktx_0;		// From P0 of port.v
   output		acktx_1;		// From P1 of port.v
   output		acktx_2;		// From P2 of port.v
   output		acktx_3;		// From P3 of port.v
   output [DW-1:0]	dat_o_0;		// From P0 of port.v
   output [DW-1:0]	dat_o_1;		// From P1 of port.v
   output [DW-1:0]	dat_o_2;		// From P2 of port.v
   output [DW-1:0]	dat_o_3;		// From P3 of port.v
   output [3:0]		full_o;			// From P0 of port.v, ...
   output		validrx_0;		// From P0 of port.v
   output		validrx_1;		// From P1 of port.v
   output		validrx_2;		// From P2 of port.v
   output		validrx_3;		// From P3 of port.v
   // End of automatics
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [N-1:0]		gnt;			// From A of arbiter.v
   wire [3:0]		rqt;			// From P0 of port.v, ...
   // End of automatics

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg [DW-1:0]		int_dat_o;
   reg [N_DEV-1:0]	int_wen_o;
   // End of automatics
   parameter AW_DEV = 2; // Address width for target devices 
   parameter DW = 4;// Data Width
   parameter DEPTH = 2;// Defining Fifo Width to be 4
   parameter N_DEV = (1<<AW_DEV);
   localparam N = N_DEV;
   
   port #(/*AUTOINSTPARAM*/
	  // Parameters
	  .AW_DEV			(AW_DEV),
	  .DW				(DW),
	  .DEPTH			(DEPTH),
	  .N_DEV			(N_DEV))
   P0 (/*AUTOINST*/
       // Outputs
       .acktx				(acktx_0),		 // Templated
       .dat_o				(dat_o_0[DW-1:0]),	 // Templated
       .validrx				(validrx_0),		 // Templated
       .full				(full_o[0]),		 // Templated
       .rqt				(rqt[0]),		 // Templated
       // Inputs
       .dat_i				(dat_i_0[DW-1:0]),	 // Templated
       .adr_i				(adr_i_0[1:0]),		 // Templated
       .validtx				(validtx_0),		 // Templated
       .ackrx				(ackrx_0),		 // Templated
       .rst_i				(rst_i),		 // Templated
       .clk_i				(clk_i),		 // Templated
       .fifo_i				(int_dat_i[DW-1:0]),	 // Templated
       .wen				(int_wen_i[0]),		 // Templated
       .gnt				(gnt[0]),		 // Templated
       .full_i				(full_i[N_DEV-1:0]));

   port #(/*AUTOINSTPARAM*/
	  // Parameters
	  .AW_DEV			(AW_DEV),
	  .DW				(DW),
	  .DEPTH			(DEPTH),
	  .N_DEV			(N_DEV))
   P1 (/*AUTOINST*/
       // Outputs
       .acktx				(acktx_1),		 // Templated
       .dat_o				(dat_o_1[DW-1:0]),	 // Templated
       .validrx				(validrx_1),		 // Templated
       .full				(full_o[1]),		 // Templated
       .rqt				(rqt[1]),		 // Templated
       // Inputs
       .dat_i				(dat_i_1[DW-1:0]),	 // Templated
       .adr_i				(adr_i_1[1:0]),		 // Templated
       .validtx				(validtx_1),		 // Templated
       .ackrx				(ackrx_1),		 // Templated
       .rst_i				(rst_i),		 // Templated
       .clk_i				(clk_i),		 // Templated
       .fifo_i				(int_dat_i[DW-1:0]),	 // Templated
       .wen				(int_wen_i[1]),		 // Templated
       .gnt				(gnt[1]),		 // Templated
       .full_i				(full_i[N_DEV-1:0]));

   port #(/*AUTOINSTPARAM*/
	  // Parameters
	  .AW_DEV			(AW_DEV),
	  .DW				(DW),
	  .DEPTH			(DEPTH),
	  .N_DEV			(N_DEV))
   P2 (/*AUTOINST*/
       // Outputs
       .acktx				(acktx_2),		 // Templated
       .dat_o				(dat_o_2[DW-1:0]),	 // Templated
       .validrx				(validrx_2),		 // Templated
       .full				(full_o[2]),		 // Templated
       .rqt				(rqt[2]),		 // Templated
       // Inputs
       .dat_i				(dat_i_2[DW-1:0]),	 // Templated
       .adr_i				(adr_i_2[1:0]),		 // Templated
       .validtx				(validtx_2),		 // Templated
       .ackrx				(ackrx_2),		 // Templated
       .rst_i				(rst_i),		 // Templated
       .clk_i				(clk_i),		 // Templated
       .fifo_i				(int_dat_i[DW-1:0]),	 // Templated
       .wen				(int_wen_i[2]),		 // Templated
       .gnt				(gnt[2]),		 // Templated
       .full_i				(full_i[N_DEV-1:0]));

   port #(/*AUTOINSTPARAM*/
	  // Parameters
	  .AW_DEV			(AW_DEV),
	  .DW				(DW),
	  .DEPTH			(DEPTH),
	  .N_DEV			(N_DEV))
   P3 (/*AUTOINST*/
       // Outputs
       .acktx				(acktx_3),		 // Templated
       .dat_o				(dat_o_3[DW-1:0]),	 // Templated
       .validrx				(validrx_3),		 // Templated
       .full				(full_o[3]),		 // Templated
       .rqt				(rqt[3]),		 // Templated
       // Inputs
       .dat_i				(dat_i_3[DW-1:0]),	 // Templated
       .adr_i				(adr_i_3[1:0]),		 // Templated
       .validtx				(validtx_3),		 // Templated
       .ackrx				(ackrx_3),		 // Templated
       .rst_i				(rst_i),		 // Templated
       .clk_i				(clk_i),		 // Templated
       .fifo_i				(int_dat_i[DW-1:0]),	 // Templated
       .wen				(int_wen_i[3]),		 // Templated
       .gnt				(gnt[3]),		 // Templated
       .full_i				(full_i[N_DEV-1:0]));


   arbiter#(/*AUTOINSTPARAM*/
	    // Parameters
	    .N				(N))
   A (/*AUTOINST*/
      // Outputs
      .GNT				(gnt[N-1:0]),		 // Templated
      // Inputs
      .RQT				(rqt[N-1:0]),		 // Templated
      .clk_i				(clk_i),		 // Templated
      .rst_i				(rst_i));		 // Templated

   
   wire [1:0] 		gnt_bin;
   assign gnt_bin = {(gnt[3]|gnt[2]) , (gnt[3]|gnt[1])};

   reg [N-1:0] 		gnt1;
   
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     gnt1 <= {N{1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     gnt1 <= gnt;
	  end
     end


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
	else if(|gnt)
	  begin
	     case (gnt_bin)
	       2'b00 : dat_buf <= dat_i_0;
	       2'b01 : dat_buf <= dat_i_1;
	       2'b10 : dat_buf <= dat_i_2;
	       2'b11 : dat_buf <= dat_i_3;
	     endcase // case (gnt_bin)
	  end
     end // always @ (posedge clk_i)


   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     int_dat_o <= {DW{1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     int_dat_o <= dat_buf;
	  end
     end

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
	else if(|gnt)
	  begin
	     case (gnt_bin)
	       2'b00 : adr_buf <= adr_i_0;
	       2'b01 : adr_buf <= adr_i_1;
	       2'b10 : adr_buf <= adr_i_2;
	       2'b11 : adr_buf <= adr_i_3;
	     endcase // case (gnt_bin)
	  end
     end // always @ (posedge clk_i)


   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     int_wen_o <= {N_DEV{1'b0}};
	     // End of automatics
	  end
	else if(|gnt1)
	  begin
	     case(adr_buf)
	       2'b00 : int_wen_o <= 4'h1;
	       2'b01 : int_wen_o <= 4'h2;
	       2'b10 : int_wen_o <= 4'h4;
	       2'b11 : int_wen_o <= 4'h8;
	     endcase // case (adr_buf)
	  end
	else
	  int_wen_o <= 4'h0;
     end


   

endmodule // top


// Local Variables:
// verilog-library-directories:("." "../../rtl/arbiter/"  "../../rtl/lab/"   "../../rtl/debouncer/")
// verilog-library-files:("")
// End:


   /*    port AUTO_TEMPLATE (
	  .acktx			(acktx_@),
	  .dat_o			(dat_o_@[DW-1:0]),
	  .validrx			(validrx_@),
	  .adr_i			(adr_i_@[1:0]),
	  .dat_i			(dat_i_@[DW-1:0]),
	  .validtx			(validtx_@),
	  .ackrx			(ackrx_@),
	  .rst_i			(rst_i),
	  .clk_i			(clk_i),
	  .full				(full_o[@]),
	  .rqt				(rqt[@]),
	  .fifo_i			(int_dat_i[DW-1:0]),
	  .wen				(int_wen_i[@]),
	  .gnt				(gnt[@]),
	  .full_array			(full_array_i[N_DEV:0]));


    );
*/
/*    

    arbiter AUTO_TEMPLATE (
	 .GNT				(gnt[N-1:0]),
	 .RQT				(rqt[N-1:0]),
	 .clk_i				(clk_i),
	 .rst_i				(rst_i),
    );
    */

