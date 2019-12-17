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

module MULT(data_in_re,data_in_im,cnt,data_out_re,data_out_im);
parameter BW=16;
parameter N =64;

wire signed [11:0] W_re[63:0];
wire signed [11:0] W_im[63:0];
                                           
input signed [BW-1:0] data_in_re;//(9:4)
input signed [BW-1:0] data_in_im;
input [5:0] cnt;
output signed[BW-1:0] data_out_re;//(9:4)
output signed[BW-1:0] data_out_im;
    
wire signed [11:0] temp_re; //[10:0]
wire signed [11:0] temp_im; //[10:0]
    
wire signed [BW+12:0] buf_re0;
wire signed [BW+12:0] buf_im0;
wire signed [BW+12:0] buf_im1;
wire signed [BW+12:0] buf_re1;
    
wire signed [BW+12:0] buf_re; //[23:0]
wire signed [BW+12:0] buf_im; //[23:0]
    
          
assign temp_re = W_re[cnt];
assign temp_im = W_im[cnt];

assign buf_re0 = temp_re*data_in_re; // [24:0]
assign buf_im0 = temp_im*data_in_re; // [24:0]
assign buf_re1 = temp_im*data_in_im; // [24:0]
assign buf_im1 = temp_re*data_in_im; // [24:0]

assign buf_re = buf_re0-buf_re1; // [24:0]
assign buf_im = buf_im0+buf_im1; // [24:0]

assign data_out_re = {buf_re[BW+12],buf_re[BW+8:10]};
assign data_out_im = {buf_im[BW+12],buf_im[BW+8:10]};



assign  W_re[ 0 ]=  'b010000000000;
assign  W_re[ 1 ]=  'b001111111110;
assign  W_re[ 2 ]=  'b001111111011;
assign  W_re[ 3 ]=  'b001111110100;
assign  W_re[ 4 ]=  'b001111101100;
assign  W_re[ 5 ]=  'b001111100001;
assign  W_re[ 6 ]=  'b001111010011;
assign  W_re[ 7 ]=  'b001111000100;
assign  W_re[ 8 ]=  'b001110110010;
assign  W_re[ 9 ]=  'b001110011101;
assign  W_re[10 ]=  'b001110000111;
assign  W_re[11 ]=  'b001101101110;
assign  W_re[12 ]=  'b001101010011;
assign  W_re[13 ]=  'b001100110110;
assign  W_re[14 ]=  'b001100010111;
assign  W_re[15 ]=  'b001011110110;
assign  W_re[16 ]=  'b001011010100;
assign  W_re[17 ]=  'b001010101111;
assign  W_re[18 ]=  'b001010001001;
assign  W_re[19 ]=  'b001001100001;
assign  W_re[20 ]=  'b001000111000;
assign  W_re[21 ]=  'b001000001110;
assign  W_re[22 ]=  'b000111100010;
assign  W_re[23 ]=  'b000110110101;
assign  W_re[24 ]=  'b000110000111;
assign  W_re[25 ]=  'b000101011000;
assign  W_re[26 ]=  'b000100101001;
assign  W_re[27 ]=  'b000011111000;
assign  W_re[28 ]=  'b000011000111;
assign  W_re[29 ]=  'b000010010110;
assign  W_re[30 ]=  'b000001100100;
assign  W_re[31 ]=  'b000000110010;
assign  W_re[32 ]=  'b000000000000;
assign  W_re[33 ]=  'b111111001101;
assign  W_re[34 ]=  'b111110011011;
assign  W_re[35 ]=  'b111101101001;
assign  W_re[36 ]=  'b111100111000;
assign  W_re[37 ]=  'b111100000111;
assign  W_re[38 ]=  'b111011010110;
assign  W_re[39 ]=  'b111010100111;
assign  W_re[40 ]=  'b111001111000;
assign  W_re[41 ]=  'b111001001010;
assign  W_re[42 ]=  'b111000011101;
assign  W_re[43 ]=  'b110111110001;
assign  W_re[44 ]=  'b110111000111;
assign  W_re[45 ]=  'b110110011110;
assign  W_re[46 ]=  'b110101110110;
assign  W_re[47 ]=  'b110101010000;
assign  W_re[48 ]=  'b110100101011;
assign  W_re[49 ]=  'b110100001001;
assign  W_re[50 ]=  'b110011101000;
assign  W_re[51 ]=  'b110011001001;
assign  W_re[52 ]=  'b110010101100;
assign  W_re[53 ]=  'b110010010001;
assign  W_re[54 ]=  'b110001111000;
assign  W_re[55 ]=  'b110001100010;
assign  W_re[56 ]=  'b110001001101;
assign  W_re[57 ]=  'b110000111011;
assign  W_re[58 ]=  'b110000101100;
assign  W_re[59 ]=  'b110000011110;
assign  W_re[60 ]=  'b110000010011;
assign  W_re[61 ]=  'b110000001011;
assign  W_re[62 ]=  'b110000000100;
assign  W_re[63 ]=  'b110000000001;

assign  W_im[ 0 ]=  'b000000000000;
assign  W_im[ 1 ]=  'b111111001101;
assign  W_im[ 2 ]=  'b111110011011;
assign  W_im[ 3 ]=  'b111101101001;
assign  W_im[ 4 ]=  'b111100111000;
assign  W_im[ 5 ]=  'b111100000111;
assign  W_im[ 6 ]=  'b111011010110;
assign  W_im[ 7 ]=  'b111010100111;
assign  W_im[ 8 ]=  'b111001111000;
assign  W_im[ 9 ]=  'b111001001010;
assign  W_im[10 ]=  'b111000011101;
assign  W_im[11 ]=  'b110111110001;
assign  W_im[12 ]=  'b110111000111;
assign  W_im[13 ]=  'b110110011110;
assign  W_im[14 ]=  'b110101110110;
assign  W_im[15 ]=  'b110101010000;
assign  W_im[16 ]=  'b110100101011;
assign  W_im[17 ]=  'b110100001001;
assign  W_im[18 ]=  'b110011101000;
assign  W_im[19 ]=  'b110011001001;
assign  W_im[20 ]=  'b110010101100;
assign  W_im[21 ]=  'b110010010001;
assign  W_im[22 ]=  'b110001111000;
assign  W_im[23 ]=  'b110001100010;
assign  W_im[24 ]=  'b110001001101;
assign  W_im[25 ]=  'b110000111011;
assign  W_im[26 ]=  'b110000101100;
assign  W_im[27 ]=  'b110000011110;
assign  W_im[28 ]=  'b110000010011;
assign  W_im[29 ]=  'b110000001011;
assign  W_im[30 ]=  'b110000000100;
assign  W_im[31 ]=  'b110000000001;
assign  W_im[32 ]=  'b110000000000;
assign  W_im[33 ]=  'b110000000001;
assign  W_im[34 ]=  'b110000000100;
assign  W_im[35 ]=  'b110000001011;
assign  W_im[36 ]=  'b110000010011;
assign  W_im[37 ]=  'b110000011110;
assign  W_im[38 ]=  'b110000101100;
assign  W_im[39 ]=  'b110000111011;
assign  W_im[40 ]=  'b110001001101;
assign  W_im[41 ]=  'b110001100010;
assign  W_im[42 ]=  'b110001111000;
assign  W_im[43 ]=  'b110010010001;
assign  W_im[44 ]=  'b110010101100;
assign  W_im[45 ]=  'b110011001001;
assign  W_im[46 ]=  'b110011101000;
assign  W_im[47 ]=  'b110100001001;
assign  W_im[48 ]=  'b110100101011;
assign  W_im[49 ]=  'b110101010000;
assign  W_im[50 ]=  'b110101110110;
assign  W_im[51 ]=  'b110110011110;
assign  W_im[52 ]=  'b110111000111;
assign  W_im[53 ]=  'b110111110001;
assign  W_im[54 ]=  'b111000011101;
assign  W_im[55 ]=  'b111001001010;
assign  W_im[56 ]=  'b111001111000;
assign  W_im[57 ]=  'b111010100111;
assign  W_im[58 ]=  'b111011010110;
assign  W_im[59 ]=  'b111100000111;
assign  W_im[60 ]=  'b111100111000;
assign  W_im[61 ]=  'b111101101001;
assign  W_im[62 ]=  'b111110011011;
assign  W_im[63 ]=  'b111111001101;

endmodule                                                                                        

