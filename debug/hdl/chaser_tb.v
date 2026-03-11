`timescale 1ns/1ps

module chaser_tb;


localparam LED_COUNT = 4;
localparam BITS      = 5; 
localparam CLK_PERIOD = 10; 

reg clk_i;
reg rst_ni;
wire [LED_COUNT-1:0] led_o;

counter #(
    .LED  (LED_COUNT),
    .WIDTH(BITS)
) dut (
    .clk_i  (clk_i),
    .rst_ni (rst_ni),
    .led_o  (led_o)
);


initial begin
    clk_i = 0;
    forever #(CLK_PERIOD/2.0) clk_i = ~clk_i;
end


initial begin
  
    rst_ni = 0;
    #(CLK_PERIOD * 2); 
    
    rst_ni = 1;
    
    #(CLK_PERIOD * 200);
    
    
end

endmodule
