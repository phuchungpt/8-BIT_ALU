module alu
(
  input wire [7:0] a   ,
  input wire [7:0] b   ,
  input wire [2:0] ctrl,
  output reg [7:0] y   ,
  output reg zero      ,
  output reg negative  ,
  output reg carry
);
  
wire       cout;
wire [7:0] sum ;
  
assign {count, sum} = (ctrl == 3'b010)? a + b:
                      (ctrl == 3'b110)? a - b: 9'h0;
  
assign y = (ctrl == 3'b000)? a & b:
           (ctrl == 3'b001)? a | b:
           (ctrl == 3'b010)? sum  :
           (ctrl == 3'b110)? sum  : 8'h1F;
  
assign carry = (ctrl == 3'b010 || ctrl == 3'b110)? count : 1'b0;
assign zero  = &(~y);
assign negative = (ctrl == 3'b110)? a<b: y[7];
  
endmodule
