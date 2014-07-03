module fifo_TB (/*AUTOARG*/);


   parameter WIDTH = 4;
   parameter DEPTH = 2; // Power of 2
   
  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg [WIDTH-1:0]	dat_i;			// To fifo0 of fifo.v
  reg			rclk;			// To fifo0 of fifo.v
  reg			rst_i;			// To fifo0 of fifo.v
  reg			wclk;			// To fifo0 of fifo.v
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [WIDTH-1:0]	dat_o;			// From fifo0 of fifo.v
   wire			empty;			// From fifo0 of fifo.v
   wire			full;			// From fifo0 of fifo.v
   // End of automatics

   fifo #(/*AUTOINSTPARAM*/
	  // Parameters
	  .WIDTH			(WIDTH),
	  .DEPTH			(DEPTH))
   fifo0 (/*AUTOINST*/
	  // Outputs
	  .full				(full),
	  .dat_o			(dat_o[WIDTH-1:0]),
	  .empty			(empty),
	  // Inputs
	  .dat_i			(dat_i[WIDTH-1:0]),
	  .wclk				(wclk),
	  .rclk				(rclk),
	  .rst_i			(rst_i));
   
 


   // Clock Generation
   
   always @(/*AUTOSENSE*/full or wclk_i)
     if(full)
       wclk <= 1'b0;
     else
       wclk <= wclk_i;

   always @(/*AUTOSENSE*/empty or rclk_i)
     if(empty)
       rclk <= 1'b0;
     else
       rclk <= rclk_i;

   reg 			rclk_i, wclk_i;
   
   initial begin
      $dumpfile("output.vcd");
      $dumpvars(0,fifo_TB);

      rst_i <= 0;
      wclk_i <= 0;
      rclk_i <= 0;
      
      #10 rst_i <= 1;
      #10 rst_i <= 0;

      #20
	dat_i <= 4'hA;
      #5
	wclk_i <= 1;
      #5
	dat_i <=4'h7;
	wclk_i <= 0;
      #5
	wclk_i <= 1;
      #5
	dat_i <=4'hB;
	wclk_i <= 0;
      #5
	wclk_i <= 1;

      #20
	rclk_i <=1;
      #5
	rclk_i <=0;
      #20 $finish;
      
   end
 
endmodule // fifo_TB



// Local Variables:
// verilog-library-directories:("." "../../rtl/fifo/")
// verilog-library-files:("")
// End:
