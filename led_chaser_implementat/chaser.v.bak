module chaser #(
    parameter LED   = 10,
    parameter WIDTH = 25)
(
    input                  clk_i,
    input                  rst_ni,
    output reg [LED-1:0]   led_o
);

reg[WIDTH-1:0] cnt_o;

always @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni)    cnt_o <= 0;
    else            cnt_o <= cnt_o + 1; 
end

always @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni)
        led_o <= 1; 
    else 
        begin if (&cnt_o[WIDTH-2:0] && cnt_o[0])
            begin
            led_o <= led_o << 1;  
            if (led_o[LED-1]) 
            led_o <= 1;
            end
        end  
end
endmodule
