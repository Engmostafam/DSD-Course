/*
 Bi-directional Port interface
 Data in is directed to the central switch without buffering 
 Checking for availablity of destination takes place in this buffer 
 Data out is buffered in a fifo and the interfacing device can read it at it's own pace. 
 4-Phase hand shake mechanism 
 
 TODO:  prevent the port from making a request when the target fifo is full
*/

module port (/*AUTOARG*/
   // Outputs
   acktx, dat_o, validrx, full, rqt,
   // Inputs
   dat_i, adr_i, validtx, ackrx, rst_i, clk_i, fifo_i, wen, gnt,
   full_i
   );

   parameter AW_DEV = 2; // Address width for target devices 
   parameter DW = 4;// Data Width
   parameter DEPTH = 2;// Defining Fifo DEPTH to be 4
   parameter N_DEV = (1<<AW_DEV); // Number of Target devices
   
   // External Interface
   // DATA IN
   input [DW-1:0]  dat_i; // Input data
   input [AW_DEV-1:0] adr_i;
   input 	   validtx; // The device has valid data to write to the switch
   output 	   acktx; // The switch received the data
   // DATA OUT
   output [DW-1:0] dat_o; // Output data
   input 	   ackrx; // The device read the data
   output 	   validrx; // The switch has valid data for the device to read. 

   // Internal signals
   input 	   rst_i;
   input 	   clk_i;

   input [DW-1:0]  fifo_i;
   input 	   wen;
   output 	   full;
   
   input 	   gnt; // Gnt signal for this device
   input [N_DEV -1:0] full_i; // This array contains the fifo status of all target devices
   output 	   rqt;
   
	   
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			empty;			// From fifo0 of fifo.v
   // End of automatics
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			acktx;
   reg			rqt;
   // End of automatics

   fifo #(/*AUTOINSTPARAM*/
	  // Parameters
	  .DW				(DW),
	  .AW				(DEPTH))		 // Templated
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

   // RX INTERFACE, The device reading data put by the switch in the fifo
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
   wire ren;
   
   assign p_ackrx = ~sample[1] & sample[0];
   assign ren = p_ackrx;

   reg 			validrx_0;
   always @(posedge clk_i)
     begin
	if(rst_i)
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     validrx_0 <= 1'h0;
	     // End of automatics
	else if(ackrx)
	  validrx_0 <= 1'b0;
	else 
	  validrx_0 <= ~empty;
     end

   // The delayed version is the one sent out to allow the device to check for the empty fifo condition
   reg validrx;
   always @(posedge clk_i)
     begin
	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     validrx <= 1'h0;
	     // End of automatics
	  end
	else
	     validrx <= validrx_0;
     end // always @ (posedge clk_i)


   // TX Interface, The device is writing data to the switch

   // Circuit to check that the target fifo is not full
   //   2-4 address deoder
   reg [3:0] 		adr_dec;
   always @(/*AUTOSENSE*/adr_i)
     case(adr_i)
       2'b00 : adr_dec <= 4'h1;
       2'b01 : adr_dec <= 4'h2;
       2'b10 : adr_dec <= 4'h4;
       2'b11 : adr_dec <= 4'h8;
     endcase // case (adr_i)
   
   wire dest_available;
   assign dest_available = ~|(adr_dec & full_i);

   always @(/*AUTOSENSE*/acktx or dest_available or rst_i or validtx)
     if(rst_i)
       /*AUTORESET*/
       // Beginning of autoreset for uninitialized flops
       rqt <= 1'h0;
       // End of automatics
       else
	 rqt <= validtx & dest_available & ~acktx;
   
   always @(posedge clk_i)
     begin
 	if(rst_i)
	  begin
	     /*AUTORESET*/
	     // Beginning of autoreset for uninitialized flops
	     acktx <= 1'h0;
	     // End of automatics
	  end
	else if(acktx)
	  acktx <= validtx;
	else
	  acktx <= validtx & gnt;
     end

endmodule // port


// Local Variables:
// verilog-library-directories:("." "../../rtl/fifo/")
// verilog-library-files:("")
// End:


   /*    fifo AUTO_TEMPLATE (
    .AW (DEPTH),
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
