module mux2b (/*AUTOARG*/
   // Outputs
   led,
   // Inputs
   select, switch
   );

   // Random Number generator interface
   input [1:0] select;
   input [3:0] switch;
   output      led;

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			led;
   // End of automatics

   always @(/*AUTOSENSE*/select or switch)
     begin
	case (select)
	  2'b00 : led <= switch[0];
	  2'b01 : led <= switch[1];
	  2'b10 : led <= switch[2];
	  2'b11 : led <= switch[3];
	endcase // case (state)
     end

   
 
endmodule // mux2b


