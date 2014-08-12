module xdevice (/*AUTOARG*/
   // Outputs
   adr_i, dat_i, validtx,
   // Inputs
   acktx, clk_i2, rst_i
   );

   parameter DW = 4;// Data Width
   parameter init = 4'd0;
   

   output [1:0] 		adr_i;
   output [DW-1:0] 		dat_i;			
   output			validtx;		
   input			acktx;			

   input			clk_i2;			
   input			rst_i;
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg [1:0]		adr_i;
   reg [DW-1:0]		dat_i;
   reg			validtx;
   // End of automatics
   
   wire 		write;
   

   
   always @(posedge clk_i2)
     begin
	if(rst_i)
	  /*AUTORESET*/
	  // Beginning of autoreset for uninitialized flops
	  validtx <= 1'h0;
	  // End of automatics
	else if(acktx)
	  validtx <= 1'b0;
	else if( (write&diff) | validtx)
	  validtx <= 1'b1;
	else 
	  validtx <= 1'b0;
     end // always @ (posedge clk_i)

   reg [1:0] sample;
   always @(posedge clk_i2)
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
	     sample <= {sample[0], acktx};
	  end
     end // always @ (posedge clk_i)

   reg [2:0] count, count1;
   
   always @(posedge clk_i2)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     count <= 3'h0;
	     // End of automatics
	  end
	else if(sample==2'b10)
	  begin
	     count <= count + 1'b1;
	  end
     end // always @ (posedge clk_i2)

   always @(posedge clk_i2)
     begin
	if(rst_i)
	  begin
	     count1 <= 3'h1;
	     /*AUTORESET*/
	  end
	else
	  begin
	     count1 <= count;
	  end
     end

   wire diff;
   assign diff = |(count1 ^ count) ;
   

   always @(posedge clk_i2)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     dat_i <= {DW{1'b0}};
	     // End of automatics
	  end
	else
	  begin
	     case(count)
	       3'h0 : dat_i <= init + 4'h1;
	       3'h1 : dat_i <= init + 4'h5;
	       3'h2 : dat_i <= init + 4'h9;
	       3'h3 : dat_i <= init + 4'hD;
	       default : dat_i <= 4'h0;
	     endcase
	  end
     end // always @ (posedge clk_i2)

      always @(posedge clk_i2)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     adr_i <= 2'h0;
	     // End of automatics
	  end
	else
	  begin
	     case(count)
	       3'h0 : adr_i <= (init==4'd0)? 2'b00:
			       (init==4'd1)? 2'b00:
			       (init==4'd2)? 2'b01:
			       2'b01;
	       3'h1 : adr_i <= (init==4'd0)? 2'b00:
			       (init==4'd1)? 2'b00:
			       (init==4'd2)? 2'b01:
			       2'b01;
	       3'h2 : adr_i <= 2'b10;
	       3'h3 : adr_i <= 2'b11;
	       default : adr_i <= 2'b00;
	     endcase
	  end
     end

   assign write = (count<3'h4);
   
   
endmodule // device


// Local Variables:
// verilog-library-directories:("." "../../rtl/switch/")
// verilog-library-files:("")
// End:
