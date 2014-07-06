/*
  Parameterized Gray 2 Binary converter. 
*/ 

module gry2bin(/*AUTOARG*/
   // Outputs
   bin,
   // Inputs
   gry
   );

   parameter DW = 4; // Data Width

   output [DW-1:0]    bin; // Binary Input
   input [DW-1:0]   gry; // Gray Output

   assign bin = {gry[DW-1] , (gry[DW-1] ^ gry[DW-2]) , (bin[DW-2:1] ^ gry[DW-3:0])};

endmodule // gry2bin



