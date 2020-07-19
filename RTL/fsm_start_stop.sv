`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 10:53:39 AM
// Design Name: 
// Module Name: fsm_start_stop
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


module fsm_start_stop(input logic clk,rst, start_stop,
                      output logic en ); 
                      
 
            
  always_ff @(posedge clk) 
  // When the start button is pressed en is 1
      if(start_stop) en <= ~en;
      // If Reset is pressed en's value is set to zero 
         else if(rst) en <= 1'b0;  
      
   endmodule 
   
             
  
                              
                      


