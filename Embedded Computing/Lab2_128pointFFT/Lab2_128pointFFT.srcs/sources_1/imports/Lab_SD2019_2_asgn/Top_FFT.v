/******************************************************************************
Copyright (c) 2018 SoC Design Laboratory, Konkuk University, South Korea
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met: redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer;
redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution;
neither the name of the copyright holders nor the names of its
contributors may be used to endorse or promote products derived from
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Authors: Sunwoo Kim (sunwkim@konkuk.ac.kr)

Revision History
2017.02.15: Started by Sunwoo Kim
*******************************************************************************/

module Top_FFT #(	
	parameter in_BW = 16,
	parameter out_BW= 23,
	parameter cut_BW= 7
) (
	input                      nrst,clk,start,
	input                      valid,
	input [in_BW-1:0]          inReal,inImag,
	output[out_BW-cut_BW-1:0]  outReal,outImag	//reviced
);

wire [6:0] cnt;
wire [6:0] rcnt;

wire [in_BW :0] sig0[1:0];
wire [in_BW+1:0] sig1[1:0];
wire [in_BW+2:0] sig2[1:0];
wire [in_BW+3:0] sig3[1:0];
wire [in_BW+4:0] sig4[1:0];
wire [in_BW+5:0] sig5[1:0];
wire [in_BW+6:0] sig6[1:0];

wire	en_s0, en_s6;
wire [15:0]   bufferReal;
wire [15:0]    bufferImag;
reg	en_s1;
reg [4:0]en_s5; 
reg [3:0] en_s4;
reg [2:0] en_s3;
reg	[1:0] en_s2;



Counter cnt0(nrst,clk,start, valid,cnt);
//Reorderer cnt0(nrst, clk, start, valid, cnt, rcnt);

//Stage #(in_BW+1,64) stage0(nrst,clk,en_s0,rcnt,inReal,inImag, valid, sig0[0],sig0[1]);
//Stage #(in_BW+2,32) stage1(nrst,clk,en_s1,rcnt,sig0[0],sig0[1], valid, sig1[0],sig1[1]);
//Stage #(in_BW+3,16) stage2(nrst,clk,en_s2[1],rcnt,sig1[0],sig1[1], valid, sig2[0],sig2[1]);
//Stage #(in_BW+4,8 ) stage3(nrst,clk,en_s3[2],rcnt,sig2[0],sig2[1], valid, sig3[0],sig3[1]);
//Stage #(in_BW+5,4 ) stage4(nrst,clk,en_s4[3],rcnt,sig3[0],sig3[1], valid, sig4[0],sig4[1]);
//Stage #(in_BW+6,2 ) stage5(nrst,clk,en_s5,rcnt,sig4[0],sig4[1], valid, sig5[0],sig5[1]);
///Stage6 #(in_BW+7,1 ) stage6(nrst,clk,en_s6   ,sig5[0],sig5[1], valid, sig6[0],sig6[1]);

Stage #(in_BW+1,64) stage0(nrst,clk,en_s0,cnt,inReal,inImag, valid, sig0[0],sig0[1]);
Stage #(in_BW+2,32) stage1(nrst,clk,en_s1,cnt,sig0[0],sig0[1], valid, sig1[0],sig1[1]);
Stage #(in_BW+3,16) stage2(nrst,clk,en_s2[1],cnt,sig1[0],sig1[1], valid, sig2[0],sig2[1]);
Stage #(in_BW+4,8 ) stage3(nrst,clk,en_s3[2],cnt,sig2[0],sig2[1], valid, sig3[0],sig3[1]);
Stage #(in_BW+5,4 ) stage4(nrst,clk,en_s4[3],cnt,sig3[0],sig3[1], valid, sig4[0],sig4[1]);
Stage #(in_BW+6,2 ) stage5(nrst,clk,en_s5[4],cnt,sig4[0],sig4[1], valid, sig5[0],sig5[1]);
Stage6 #(in_BW+7,1 ) stage6(nrst,clk,en_s6   ,sig5[0],sig5[1], valid, sig6[0],sig6[1]);
Reorderer reorderReal(nrst, clk, valid, sig6[0][in_BW+5 : cut_BW], bufferReal);
Reorderer reorderImag(nrst, clk, valid, sig6[1][in_BW+5 : cut_BW], bufferImag);

assign outReal = bufferReal;
assign outImag = bufferImag;

assign en_s0 = cnt[6];

always@(posedge clk)
  if(!nrst)
    en_s1 <= 0;
  else if(valid)
    en_s1 <= cnt[5];

always@(posedge clk)
  if(!nrst)
    en_s2 <= 0;
  else if(valid) begin
    en_s2[0]   <= cnt[4];
    en_s2[1] <= en_s2[0];
  end

always@(posedge clk)
  if(!nrst)
    en_s3 <= 0;
  else if(valid) begin
    en_s3[0] <= cnt[3];
	en_s3[2:1]<=en_s3[1:0];
  end

always@(posedge clk)
  if(!nrst)
    en_s4 <= 0;
  else if(valid) begin
    en_s4[0] <= cnt[2];
    en_s4[3:1]<=en_s4[2:0];
  end
  
 always@(posedge clk)
    if(!nrst)
        en_s5 <= 0;
    else if(valid) begin
        en_s5[0] <= cnt[1];
        en_s5[4:1] <= en_s5[3:0];
    end

assign en_s6 = cnt[0];


endmodule