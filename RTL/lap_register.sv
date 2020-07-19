`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2018 06:28:48 PM
// Design Name: 
// Module Name: lap_register
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


module lap_register( input logic clk, rst, lap, 
					input logic [3:0] lap_time,
					output logic [3:0] lap_out ); 

// This register will be in charge of holding the laptimes passed from the 
// dec_counters 

always_ff @(posedge clk)
// If the reset button is pressed we want to set the value of d to 0 
	if (rst) lap_out <= 4'd0; 

//Otherwise if the enable button is pressed, we want to set the output 
// d to its input value
	else if (lap) lap_out <= lap_time;

  endmodule

