
module deserial_TB (/*AUTOARG*/);

  /*AUTOREGINPUT*/
  // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
  reg			clk_i;			// To stpmtr0 of deserial.v
  reg			rst_i;			// To stpmtr0 of deserial.v
  reg			serial_clk;		// To stpmtr0 of deserial.v
  reg			serial_i;		// To stpmtr0 of deserial.v
  // End of automatics

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]		dat_o;			// From stpmtr0 of deserial.v
   wire [4:0]		length;			// From stpmtr0 of deserial.v
   wire			valid;			// From stpmtr0 of deserial.v
   // End of automatics

   deserial #(/*AUTOINSTPARAM*/)
   stpmtr0 (/*AUTOINST*/
	    // Outputs
	    .dat_o			(dat_o[31:0]),
	    .length			(length[4:0]),
	    .valid			(valid),
	    // Inputs
	    .clk_i			(clk_i),
	    .rst_i			(rst_i),
	    .serial_clk			(serial_clk),
	    .serial_i			(serial_i));
   
 


   // Clock Generation

   reg 			serial_clk_o;
   reg 			shift1;
   reg 			shift2;
   
   always #1 clk_i <= !clk_i;
   
   always #5 serial_clk_o <= !serial_clk_o;


   reg [12:0] 		serial1;
   always @(posedge serial_clk_o)
     begin
	if(rst_i)
	  begin
	     serial1 <= {4'b1010, 5'b11001, 4'b0111};
	     /*AUTORESET*/
	  end
	else if (shift1)
	  begin
	     serial1 <= {serial1 [11:0] , 1'b0};
	  end
	
     end // always @ (posedge clk_i)

   reg [11:0] 		serial2;
   always @(posedge serial_clk_o)
     begin
	if(rst_i)
	  begin
	     serial2 <= {4'b1010, 4'hD, 4'b0111};
	     /*AUTORESET*/
	  end
	else if (shift2)
	  begin
	     serial2 <= {serial2 [10:0] , 1'b0};
	  end
	
     end // always @ (posedge clk_i)


     always @(/*AUTOSENSE*/serial1 or serial2 or shift1 or shift2)
       begin
	  serial_i <= (shift1) ? serial1[12] :
		      (shift2) ? serial2[11] :
		      1'b1;
       end

   always @(/*AUTOSENSE*/serial_clk_o or shift1 or shift2)
     begin
	serial_clk <= serial_clk_o ;
     end

   
   initial begin
      $dumpfile("output.vcd");
      $dumpvars(0,deserial_TB);

      clk_i <= $random;
      serial_clk_o <= $random;
      serial_clk <= $random;
      shift1 <= 0;
      shift2 <= 0;
      
      #10 rst_i <= 1;
      #20 rst_i <= 0;


      #10
      shift1 <= 1;
      
      #200
      shift1 <= 0;
      shift2 <= 1;
      
      #200 $finish;
      
   end
 
endmodule // deserial_TB


// Local Variables:
// verilog-library-directories:("." "../../rtl/test1/")
// verilog-library-files:("")
// End:
