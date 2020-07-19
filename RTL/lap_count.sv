`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 09:59:00 AM
// Design Name: 
// Module Name: lap_count
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lap_count( input logic clk,rst,lap,  
                  input logic [3:0] d0,d1,d2,d3,
                  output logic [3:0] d4,d5,d6,d7 );
                  
 always_ff @(posedge clk)
  begin
      if (lap) 
       begin
           d4 <= d0;
           d5 <= d1;
           d6 <= d2;
           d7 <= d3;
       end
     else if (rst)
       begin 
           d4 <= 0;
           d5 <= 0;
           d6 <= 0;
           d7 <= 0;
       end
   end


endmodule

