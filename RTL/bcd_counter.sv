`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 09:43:46 AM
// Design Name: 
// Module Name: bcd_counter
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


module bcd_counter(  input logic clk,rst, enb, 
                    output logic [3:0] d0,d1,d2,d3 ); 
 
  logic c0,c1,c2,c3,c4 ; // Used for the carry of  our counters
  logic [3:0] d; // The output of the millisecond conunter which is not used 
                    
 dec_counter milisecond(.clk(clk),.rst(rst),.enb(enb),.q(d), .carry(c0)) ; 
 dec_counter hundreths(.clk(clk), .rst(rst),.enb(c0) ,.q(d0), .carry(c1)) ; 
 dec_counter tenths(.clk(clk), .rst(rst), .enb(c1),.q(d1), .carry(c2)) ; 
 dec_counter ones(.clk(clk), .rst(rst), .enb(c2),.q(d2), .carry(c3)) ; 
 dec_counter tens(.clk(clk),.rst(rst), .enb(c3),.q(d3), .carry(c4)) ; 
            

endmodule
