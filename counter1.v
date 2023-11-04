module counter1 (led,beep,CLK,rst);

  input wire rst;    // 异步清零信号
  output wire [3:0] led;   // LED灯输出
  output  reg beep;  // 蜂鸣器输出
  input wire CLK;
  //output reg out;

 	parameter N = 25000000;
   reg [3:0] count;    // 计数器寄存器
   reg clk_out;
   integer counter;
	always @(posedge CLK)
begin
 if (counter == N-1) 
  begin clk_out <= !clk_out;counter <= 0;end
 else 
  begin counter <= counter + 1;
		  clk_out <= clk_out;end
end 
      
  
  always @(posedge clk_out) begin
    if (!rst) begin
      count <= 0;      // 异步清零
   end 
	 else 
	 if(count == 9) begin
        count <= 0;    
        beep <= 1;   
      end else  begin //if (count == 0)
        count <= count + 1;   
        beep <= 0;   // 蜂鸣器报警
      end 

  end

  assign led = count;   // 将计数器的值输出到LED灯
  
endmodule




