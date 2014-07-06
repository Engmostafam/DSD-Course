/*
 debouncer circuit 
 for a 50 MHZ
 waits around 20 ms to clear debounces 
*/ 

module debouncer(/*AUTOARG*/
   // Outputs
   pulse,
   // Inputs
   clk_i, rst_i, push
   );

   parameter n=19; // wait time = 2^n * 1/freq
   
   input  clk_i;
   input  rst_i;
   input  push;
   output pulse;
   
   
   /*AUTOREG*/

   localparam stat0 = 0;
   localparam stat1 = 1;
   localparam wt0_1 = 2;
   localparam wt0_2 = 3;
   localparam wt0_3 = 3;
   localparam wt1_1 = 3;
   localparam wt1_2 = 3;
   localparam wt1_3 = 3;
   

   reg [n-1:0] 		cnt;
   always @(posedge clk_i)
     if(rst_i)
	  /*AUTORESET*/
	  // Beginning of autoreset for uninitialized flops
	  cnt <= {n{1'b0}};
	  // End of automatics
       else
	 cnt <= cnt + 1'b1;

   reg [2:0] 		state;
   reg [2:0] 		next;

   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     state <= 3'h0;
	     // End of automatics
	  end
	else
	  begin
	     state <= next;
	  end
     end

   always @(/*AUTOSENSE*/cnt or push or state)
     begin
	case (state)
	  stat0 : next <= (push)? wt1_1 : stat0;
	  wt1_1 : next <= (~push)? stat0 : 
			  (~|cnt)? wt1_2 : wt1_1;
	  wt1_2 : next <= (~push)? stat0 : 
			  (~|cnt)? wt1_3 : wt1_2;
	  wt1_3 : next <= (~push)? stat0 : 
			  (~|cnt)? stat1 : wt1_3;
	  stat1 : next <= (~push)? wt0_1 : stat1;
	  wt0_1 : next <= (push)? stat1 : 
			  (~|cnt)? wt0_2 : wt0_1;
	  wt0_2 : next <= (push)? stat1 : 
			  (~|cnt)? wt0_3 : wt0_2;
	  wt0_3 : next <= (push)? stat1 : 
			  (~|cnt)? stat0 : wt0_3;
	endcase // case (state)
     end // always @ (...

   reg push_out;
   always @(/*AUTOSENSE*/rst_i or state)
     if(rst_i)
       /*AUTORESET*/
       // Beginning of autoreset for uninitialized flops
       push_out <= 1'h0;
       // End of automatics
       else if(state == stat1)
	 push_out <= 1'b1;
       else if(state == stat0)
	 push_out <= 1'b0;
       else
	 push_out <= push_out;

   reg [1:0] sample;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     sample <= 2'h0;
	     // End of automatics
	  end
	else
	  begin
	     sample <= {sample[0] , push_out};
	  end
     end // always @ (posedge clk_i)

   reg  pulse;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     pulse <= 1'h0;
	     // End of automatics
	  end
	else
	  begin
	     pulse <= (sample == 2'b01);
	  end
     end

endmodule // debouncer
