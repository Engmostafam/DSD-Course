/*
 Parameterized Binary 2 Gray converter. 
*/ 

module bin2gry(/*AUTOARG*/
   // Outputs
   gry,
   // Inputs
   bin
   );

   parameter DW = 4; // Data Width

   input [DW-1:0]    bin; // Binary Input
   output [DW-1:0]   gry; // Gray Output
   
   assign gry = {bin[DW-1] , (bin[DW-1:1] ^ bin[DW-2:0]) };
		 
endmodule // bin2gry



