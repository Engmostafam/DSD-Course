/*
 Bi-directional Port interface
 Data in is directed to the central switch without buffering
 Data out is buffered in a fifo and the interfacing device can read it at it's own pace. 
*/

module port (/*AUTOARG*/
   // Outputs
   acktx, dat_o, validrx1, full,
   // Inputs
   dat_i, adr_i, validtx, ackrx, rst_i, clk_i, fifo_i, wen
   );

   parameter  DW = 4;// Data Width
   parameter  AW = 2;// Defining Fifo Width to be 4
//   localparam DEV = 2; // Number of target devices 
   

   // External Interface
   // DATA IN
   input [DW-1:0]  dat_i; // Input data
   input [1:0] 	   adr_i;
   input 	   validtx; // The device has valid data to write to the switch
   output 	   acktx; // The switch received the data
   // DATA OUT
   output [DW-1:0] dat_o; // Output data
   input 	   ackrx; // The device read the data
   output 	   validrx1; // The switch has valid data for the device to read. 

   // Internal signals
   input 	   rst_i;
   input 	   clk_i;

   input [DW-1:0]  fifo_i;
   input 	   wen;
   output 	   full;
   

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			acktx;
   // End of automatics

   fifo #(/*AUTOINSTPARAM*/
	  // Parameters
	  .DW				(DW),
	  .AW				(AW))
   fifo0 (/*AUTOINST*/
	  // Outputs
	  .full				(full),			 // Templated
	  .dat_o			(dat_o[DW-1:0]),	 // Templated
	  .empty			(empty),		 // Templated
	  // Inputs
	  .dat_i			(fifo_i),		 // Templated
	  .wclk				(clk_i),		 // Templated
	  .wen				(wen),			 // Templated
	  .rclk				(clk_i),		 // Templated
	  .ren				(ren),			 // Templated
	  .rst_i			(rst_i));		 // Templated

   
   // Pulse Generator for REN of the FIFO
   reg [1:0] 		sample;
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
	     sample <= {sample[0] , ackrx};
	  end
     end // always @ (posedge clk_i)

   wire p_ackrx;
   assign p_ackrx = ~sample[1] & sample[0];
   
   wire n_ackrx;
   assign n_ackrx = sample[1] & ~sample[0];

   wire ren;
   assign ren = p_ackrx;

   wire 		empty;
   reg 			validrx;
   
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     validrx <= 1'h0;
	     // End of automatics
	  end
	else if(ackrx)
	  validrx <= 1'b0;
	else 
	  validrx <= ~empty;
     end

   reg validrx1;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     validrx1 <= 1'h0;
	     // End of automatics
	  end
	else
	  begin
	     validrx1 <= validrx;
	     
	  end
     end

endmodule // port


// Local Variables:
// verilog-library-directories:("." "../../rtl/fifo/")
// verilog-library-files:("")
// End:


   /*    fifo AUTO_TEMPLATE (
	  .full				(full),
	  .dat_o			(dat_o[DW-1:0]),
	  .empty			(empty),
	  .dat_i			(fifo_i),
	  .wclk				(clk_i),
	  .wen				(wen),
	  .rclk				(clk_i),
	  .ren				(ren),
	  .rst_i			(rst_i),
    );

    */
