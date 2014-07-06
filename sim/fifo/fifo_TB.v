module fifo_TB (/*AUTOARG*/);


   parameter DW = 4;
   parameter AW = 2; 
   
  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg [DW-1:0]		dat_i;			// To fifo0 of fifo.v
  reg			rclk;			// To fifo0 of fifo.v
  reg			ren;			// To fifo0 of fifo.v
  reg			rst_i;			// To fifo0 of fifo.v
  reg			wclk;			// To fifo0 of fifo.v
  reg			wen;			// To fifo0 of fifo.v
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [DW-1:0]	dat_o;			// From fifo0 of fifo.v
   wire			empty;			// From fifo0 of fifo.v
   wire			full;			// From fifo0 of fifo.v
   // End of automatics

   fifo #(/*AUTOINSTPARAM*/
	  // Parameters
	  .DW				(DW),
	  .AW				(AW))
   fifo0 (/*AUTOINST*/
	  // Outputs
	  .full				(full),
	  .dat_o			(dat_o[DW-1:0]),
	  .empty			(empty),
	  // Inputs
	  .dat_i			(dat_i[DW-1:0]),
	  .wclk				(wclk),
	  .wen				(wen),
	  .rclk				(rclk),
	  .ren				(ren),
	  .rst_i			(rst_i));
   
 


   // Clock Generation
   always #5 wclk <= ~wclk;
   always #10 rclk <= ~rclk;
   always #9 dat_i <= $random;
   
   
   
   always @(/*AUTOSENSE*/full or rst_i or wdis)
     if(full | rst_i | wdis)
       wen <= 1'b0;
     else
       wen <= 1'b1;

   always @(/*AUTOSENSE*/empty or rdis or rst_i)
     if(empty | rst_i | rdis)
       ren <= 1'b0;
     else
       ren <= 1'b1;

   reg 			wdis, rdis;
   
   
   initial begin
      $dumpfile("output.vcd");
      $dumpvars(0,fifo_TB);

      rst_i <= 0;
      wen <=0;
      ren <=1;
      wdis <= 0;
      rdis <= 0;
      
      wclk <= $random;
      rclk <= $random;
      
      #8 rst_i <= 1;
      #8 rst_i <= 0;

      #100
	wdis <= 1;
      #100
	wdis <= 0;
      
      #200 $finish;
      
   end
 
endmodule // fifo_TB



// Local Variables:
// verilog-library-directories:("." "../../rtl/fifo/")
// verilog-library-files:("")
// End:
