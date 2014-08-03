/*
 -Round Robin Arbiter. 
 - N-Arbiter
*/ 

module arbiter(/*AUTOARG*/
   // Outputs
   GNT,
   // Inputs
   RQT, clk_i, rst_i
   );

   parameter N = 4;

   
   output [N-1:0] GNT; // Grant Output Vector
  
   input [N-1:0]  RQT; // Request Input Vector
   input 	  clk_i;
   input 	  rst_i;
   
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg [N-1:0]		GNT;
   // End of automatics

   // Latch on Requests & Synchronizer
   reg [N-1:0] 		rRQT;
   always @(/*AUTOSENSE*/RQT or rst_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     rRQT <= {N{1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     rRQT <= RQT;
	  end
     end

   // Unmasked Priority encoder
   wire [N-1:0]   xpmask; // Priority mask
   wire [N-1:0]   xmGNT;
   assign xpmask[N-1:1] = xpmask[N-2:0] | rRQT[N-2:0];
   assign xpmask[0] = 1'b0;
   assign xmGNT = rRQT & ~xpmask;


   // Masking Logic
   wire [N-1:0]   mask;
   assign mask[N-1:1] = mask [N-2:0] | GNT[N-2:0];
   assign mask[0] = 1'b0;
   

   wire [N-1:0]   mRQT;
   assign mRQT = mask & rRQT;
      

   // masked Priority encoder
   wire [N-1:0]   pmask; // Priority mask
   wire [N-1:0]   mGNT;
   assign pmask[N-1:1] = pmask[N-2:0] | mRQT[N-2:0];
   assign pmask[0] = 1'b0;
   assign mGNT = mRQT & ~pmask;

   // GRANT

   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     GNT <= {N{1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     GNT <= (~|mRQT)? xmGNT : mGNT;
	  end
     end

   
endmodule // arbiter

// Local Variables:
// verilog-library-directories:("." "../../rtl/bin2gry/")
// verilog-library-files:("")
// End:


   /* bin2gry AUTO_TEMPLATE (
    .DW			(AW+1),
    .gry		(@"(substring vl-cell-name 2)"_gry[AW:0]),
    .bin		(@"(substring vl-cell-name 2)"[AW:0]),
    );
    */

   /* gry2bin AUTO_TEMPLATE (
    .DW			(AW+1),
    .gry		(@"(substring vl-cell-name 2)"[AW:0]),
    .bin		(@"(substring vl-cell-name 2)"_bin[AW:0]),
    );
    */
