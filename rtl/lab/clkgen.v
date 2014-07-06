module clkgen (/*AUTOARG*/
   // Outputs
   clk_o,
   // Inputs
   clk_i, rst_i
   );
   
   // Random Number generator interface
   input clk_i;
   input rst_i;
   output clk_o;

   parameter CLKIN = 50;
   parameter CLKOUT = 25;
   parameter DIVIDE = 0.5*(1/CLKOUT)*CLKIN - 1;
   

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			clk_o;
   // End of automatics

   // Counter
   reg [24:0] 		count;
   
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     count <= 25'h0;
	     // End of automatics
	  end
	else if (~|count)
	     count <= DIVIDE;
	else
	  count <= count - 1;
     end

   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     clk_o <= 1'h0;
	     // End of automatics
	  end
	else if (~|count)
	  begin
	     clk_o <= ~clk_o;
	  end
     end

 
endmodule // clkgen


