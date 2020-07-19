`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/25/2018 10:12:15 AM
// Design Name:
// Module Name: stopwatch_top_level
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


module stopwatch_top_level( input logic clk_100MHz,rst, start, lap,
                  output logic [7:0] an_l,
                  output logic [6:0] segs_l,
                  output logic dp_l );

                   // Logic Instantiations
                   logic start_debounce , start_go; // Debounce and Single Pulse of Start Button
                   logic lap_debounce,lap_go; // Debounce and Single Pulser of Lap Button
                   logic rst_debounce, rst_go ;
                    logic sw_en; // Wire for FSM to enable the stopwatch
                   logic clk;// Holds the clk div time

                   logic [3:0] d0,d1,d2,d3,d4,d5,d6,d7;


   // Clock Divider
    clkdiv #(.DIVFREQ(1000))U_CLKDIV(.clk(clk_100MHz) ,.rst(1'b0),.sclk(clk)) ;

    // Debouncer and Single Pulser  START
     debounce START_1(.clk(clk), .pb(start) , .pb_debounced(start_debounce));

     single_pulser START_2(.clk(clk), .din(start_debounce), .d_pulse(start_go));

    //Single Pulse and Debounce LAP
     debounce LAP_1(.clk(clk), .pb(lap) , .pb_debounced(lap_debounce));

    single_pulser LAP_2(.clk(clk), .din(lap_debounce), .d_pulse(lap_go));

   //Single Pulse and Debounce for Reset

   debounce RST_1(.clk(clk), .pb(rst) , .pb_debounced(rst_debounce));

   single_pulser RST_2(.clk(clk), .din(rst_debounce), .d_pulse(rst_go));


    fsm_start_stop ENABLE(.clk(clk),.rst(rst_go),.start_stop(start_go),.en(sw_en));

    //Creating an instance of bcd counter
    bcd_counter COUNTER(.clk(clk),.rst(rst_go),.enb(sw_en),.d0(d0), .d1(d1),.d2(d2),.d3(d3));

    //Creating an instance of lap count module
    lap_count LAP_COUNT(.clk(clk), .rst(rst_go),.lap(lap_go),.d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5) , .d6(d6) , .d7(d7) );

    // Seven seg control instantiation
    sevenseg_control U_C_5(.clk(clk), .rst(rst_go),.d0(d0), .d1(d1), .d2(d2), .d3(d3), .d4(d4), .d5(d5),.d6(d6), .d7(d7),.segs_l(segs_l), .an_l(an_l), .dp_l(dp_l));




endmodule
