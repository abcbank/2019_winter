module Reorderer(nrst,clk,start,valid,cnt);
  
input 			 nrst,clk,start;
input 			 valid;
reg [6:0]        c;
output reg [6:0] cnt;

always@(posedge clk)
  if(!nrst)
    c <= 7'b1111111;
  else if ((!start)&&valid)
    c <= 7'b1111111; 
  else if (valid)
    c <= c + 1;
  
//   cnt[6] <= c[0];
//   cnt[5] <= c[1];
//   cnt[4] <= c[2];
//   cnt[3] <= c[3];
//   cnt[2] <= c[4];
//   cnt[1] <= c[5];
//   cnt[0] <= c[6];

  cnt = {c[0], c[1], c[2], c[3], c[4], c[5], c[6]};

endmodule