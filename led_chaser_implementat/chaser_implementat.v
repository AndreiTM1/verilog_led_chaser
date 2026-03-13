module chaser_implementat #(
    parameter LED   = 10,
    parameter WIDTH = 25,
	 parameter SPEED = 25)
(
    input                  clk_i,
    input                  rst_ni,
    output reg [LED-1:0]   led_o
);

reg[WIDTH-1:0] cnt_o;
reg directie;

always @(posedge clk_i or negedge rst_ni) begin
	if(~rst_ni)
		directie <= 1'b1;
	else
		  if(led_o[LED-1])
					directie <= 1'b0;
		  else if (led_o[0])
					directie <= 1'b1;
end

always @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni)    
		cnt_o <= 0;
    else if(cnt_o == SPEED)	
				cnt_o <= 0;
			else cnt_o <= cnt_o + 1; 
end

always @(posedge clk_i or negedge rst_ni) begin
    if (~rst_ni)
        led_o <= 1; 
    else 
        begin if (cnt_o == SPEED)
            if (directie)
					led_o <= led_o << 1;
				else led_o <= led_o >> 1;
        end  
end
endmodule
