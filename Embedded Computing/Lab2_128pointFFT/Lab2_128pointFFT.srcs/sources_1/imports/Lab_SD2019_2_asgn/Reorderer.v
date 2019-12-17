module Reorder #(
    parameter BW = 16,
    parameter N = 256,
    parameter START_NUMBER = 134,
    parameter START_NUMBER_128 = 262,
    parameter FINISH_NUMBER = 390,
    parameter REORDER_NUMBER = 518

)(
    input nrst,clk,valid,
    input [BW-1:0] inData,
    output [BW-1:0] outData
);

//Re-order start
reg [7:0]cnt;
integer start ;
always@(posedge clk)
    if(!nrst )
        start <= 0;
    else if(valid)
        start <= start + 1;

//sel signal
always@(posedge clk)
begin
    if((!nrst)) begin
      cnt <= 8'b11111111;
   end
   else if(start > REORDER_NUMBER)
      cnt <= 8'b11111111;   
   else if(start>=START_NUMBER_128 && start<REORDER_NUMBER )
      cnt <= cnt + 2;
end

//data save
reg [BW-1:0] sr[N:0];
integer i;
integer Number;
always@(posedge clk)
    if(!nrst)begin
      Number <= 0;
      for(i=0;i<N;i=i+1)
         sr[i] <= 0;
   end
   else if (start > REORDER_NUMBER-2)
      for(i=0;i<N;i=i+1)
         sr[i] <= 0;
    else if ((start>=START_NUMBER )&&(start<=FINISH_NUMBER)) begin
      sr[Number] <= inData;
      Number <= Number+1;
   end

//stage1
wire [BW-1:0] stage1out0 = !cnt[7] ? sr[0] : sr[1];
wire [BW-1:0] stage1out1 = !cnt[7] ? sr[2] : sr[3];
wire [BW-1:0] stage1out2 = !cnt[7] ? sr[4] : sr[5];
wire [BW-1:0] stage1out3 = !cnt[7] ? sr[6] : sr[7];
wire [BW-1:0] stage1out4 = !cnt[7] ? sr[8] : sr[9];
wire [BW-1:0] stage1out5 = !cnt[7] ? sr[10] : sr[11];
wire [BW-1:0] stage1out6 = !cnt[7] ? sr[12] : sr[13];
wire [BW-1:0] stage1out7 = !cnt[7] ? sr[14] : sr[15];
wire [BW-1:0] stage1out8 = !cnt[7] ? sr[16] : sr[17];
wire [BW-1:0] stage1out9 = !cnt[7] ? sr[18] : sr[19];
wire [BW-1:0] stage1out10 = !cnt[7] ? sr[20] : sr[21];
wire [BW-1:0] stage1out11 = !cnt[7] ? sr[22] : sr[23];
wire [BW-1:0] stage1out12 = !cnt[7] ? sr[24] : sr[25];
wire [BW-1:0] stage1out13 = !cnt[7] ? sr[26] : sr[27];
wire [BW-1:0] stage1out14 = !cnt[7] ? sr[28] : sr[29];
wire [BW-1:0] stage1out15 = !cnt[7] ? sr[30] : sr[31];
wire [BW-1:0] stage1out16 = !cnt[7] ? sr[32] : sr[33];
wire [BW-1:0] stage1out17 = !cnt[7] ? sr[34] : sr[35];
wire [BW-1:0] stage1out18 = !cnt[7] ? sr[36] : sr[37];
wire [BW-1:0] stage1out19 = !cnt[7] ? sr[38] : sr[39];
wire [BW-1:0] stage1out20 = !cnt[7] ? sr[40] : sr[41];
wire [BW-1:0] stage1out21 = !cnt[7] ? sr[42] : sr[43];
wire [BW-1:0] stage1out22 = !cnt[7] ? sr[44] : sr[45];
wire [BW-1:0] stage1out23 = !cnt[7] ? sr[46] : sr[47];
wire [BW-1:0] stage1out24 = !cnt[7] ? sr[48] : sr[49];
wire [BW-1:0] stage1out25 = !cnt[7] ? sr[50] : sr[51];
wire [BW-1:0] stage1out26 = !cnt[7] ? sr[52] : sr[53];
wire [BW-1:0] stage1out27 = !cnt[7] ? sr[54] : sr[55];
wire [BW-1:0] stage1out28 = !cnt[7] ? sr[56] : sr[57];
wire [BW-1:0] stage1out29 = !cnt[7] ? sr[58] : sr[59];
wire [BW-1:0] stage1out30 = !cnt[7] ? sr[60] : sr[61];
wire [BW-1:0] stage1out31 = !cnt[7] ? sr[62] : sr[63];
wire [BW-1:0] stage1out32 = !cnt[7] ? sr[64] : sr[65];
wire [BW-1:0] stage1out33 = !cnt[7] ? sr[66] : sr[67];
wire [BW-1:0] stage1out34 = !cnt[7] ? sr[68] : sr[69];
wire [BW-1:0] stage1out35 = !cnt[7] ? sr[70] : sr[71];
wire [BW-1:0] stage1out36 = !cnt[7] ? sr[72] : sr[73];
wire [BW-1:0] stage1out37 = !cnt[7] ? sr[74] : sr[75];
wire [BW-1:0] stage1out38 = !cnt[7] ? sr[76] : sr[77];
wire [BW-1:0] stage1out39 = !cnt[7] ? sr[78] : sr[79];
wire [BW-1:0] stage1out40 = !cnt[7] ? sr[80] : sr[81];
wire [BW-1:0] stage1out41 = !cnt[7] ? sr[82] : sr[83];
wire [BW-1:0] stage1out42 = !cnt[7] ? sr[84] : sr[85];
wire [BW-1:0] stage1out43 = !cnt[7] ? sr[86] : sr[87];
wire [BW-1:0] stage1out44 = !cnt[7] ? sr[88] : sr[89];
wire [BW-1:0] stage1out45 = !cnt[7] ? sr[90] : sr[91];
wire [BW-1:0] stage1out46 = !cnt[7] ? sr[92] : sr[93];
wire [BW-1:0] stage1out47 = !cnt[7] ? sr[94] : sr[95];
wire [BW-1:0] stage1out48 = !cnt[7] ? sr[96] : sr[97];
wire [BW-1:0] stage1out49 = !cnt[7] ? sr[98] : sr[99];
wire [BW-1:0] stage1out50 = !cnt[7] ? sr[100] : sr[101];
wire [BW-1:0] stage1out51 = !cnt[7] ? sr[102] : sr[103];
wire [BW-1:0] stage1out52 = !cnt[7] ? sr[104] : sr[105];
wire [BW-1:0] stage1out53 = !cnt[7] ? sr[106] : sr[107];
wire [BW-1:0] stage1out54 = !cnt[7] ? sr[108] : sr[109];
wire [BW-1:0] stage1out55 = !cnt[7] ? sr[110] : sr[111];
wire [BW-1:0] stage1out56 = !cnt[7] ? sr[112] : sr[113];
wire [BW-1:0] stage1out57 = !cnt[7] ? sr[114] : sr[115];
wire [BW-1:0] stage1out58 = !cnt[7] ? sr[116] : sr[117];
wire [BW-1:0] stage1out59 = !cnt[7] ? sr[118] : sr[119];
wire [BW-1:0] stage1out60 = !cnt[7] ? sr[120] : sr[121];
wire [BW-1:0] stage1out61 = !cnt[7] ? sr[122] : sr[123];
wire [BW-1:0] stage1out62 = !cnt[7] ? sr[124] : sr[125];
wire [BW-1:0] stage1out63 = !cnt[7] ? sr[126] : sr[127];
wire [BW-1:0] stage1out64 = !cnt[7] ? sr[128] : sr[129];
wire [BW-1:0] stage1out65 = !cnt[7] ? sr[130] : sr[131];
wire [BW-1:0] stage1out66 = !cnt[7] ? sr[132] : sr[133];
wire [BW-1:0] stage1out67 = !cnt[7] ? sr[134] : sr[135];
wire [BW-1:0] stage1out68 = !cnt[7] ? sr[136] : sr[137];
wire [BW-1:0] stage1out69 = !cnt[7] ? sr[138] : sr[139];
wire [BW-1:0] stage1out70 = !cnt[7] ? sr[140] : sr[141];
wire [BW-1:0] stage1out71 = !cnt[7] ? sr[142] : sr[143];
wire [BW-1:0] stage1out72 = !cnt[7] ? sr[144] : sr[145];
wire [BW-1:0] stage1out73 = !cnt[7] ? sr[146] : sr[147];
wire [BW-1:0] stage1out74 = !cnt[7] ? sr[148] : sr[149];
wire [BW-1:0] stage1out75 = !cnt[7] ? sr[150] : sr[151];
wire [BW-1:0] stage1out76 = !cnt[7] ? sr[152] : sr[153];
wire [BW-1:0] stage1out77 = !cnt[7] ? sr[154] : sr[155];
wire [BW-1:0] stage1out78 = !cnt[7] ? sr[156] : sr[157];
wire [BW-1:0] stage1out79 = !cnt[7] ? sr[158] : sr[159];
wire [BW-1:0] stage1out80 = !cnt[7] ? sr[160] : sr[161];
wire [BW-1:0] stage1out81 = !cnt[7] ? sr[162] : sr[163];
wire [BW-1:0] stage1out82 = !cnt[7] ? sr[164] : sr[165];
wire [BW-1:0] stage1out83 = !cnt[7] ? sr[166] : sr[167];
wire [BW-1:0] stage1out84 = !cnt[7] ? sr[168] : sr[169];
wire [BW-1:0] stage1out85 = !cnt[7] ? sr[170] : sr[171];
wire [BW-1:0] stage1out86 = !cnt[7] ? sr[172] : sr[173];
wire [BW-1:0] stage1out87 = !cnt[7] ? sr[174] : sr[175];
wire [BW-1:0] stage1out88 = !cnt[7] ? sr[176] : sr[177];
wire [BW-1:0] stage1out89 = !cnt[7] ? sr[178] : sr[179];
wire [BW-1:0] stage1out90 = !cnt[7] ? sr[180] : sr[181];
wire [BW-1:0] stage1out91 = !cnt[7] ? sr[182] : sr[183];
wire [BW-1:0] stage1out92 = !cnt[7] ? sr[184] : sr[185];
wire [BW-1:0] stage1out93 = !cnt[7] ? sr[186] : sr[187];
wire [BW-1:0] stage1out94 = !cnt[7] ? sr[188] : sr[189];
wire [BW-1:0] stage1out95 = !cnt[7] ? sr[190] : sr[191];
wire [BW-1:0] stage1out96 = !cnt[7] ? sr[192] : sr[193];
wire [BW-1:0] stage1out97 = !cnt[7] ? sr[194] : sr[195];
wire [BW-1:0] stage1out98 = !cnt[7] ? sr[196] : sr[197];
wire [BW-1:0] stage1out99 = !cnt[7] ? sr[198] : sr[199];
wire [BW-1:0] stage1out100 = !cnt[7] ? sr[200] : sr[201];
wire [BW-1:0] stage1out101 = !cnt[7] ? sr[202] : sr[203];
wire [BW-1:0] stage1out102 = !cnt[7] ? sr[204] : sr[205];
wire [BW-1:0] stage1out103 = !cnt[7] ? sr[206] : sr[207];
wire [BW-1:0] stage1out104 = !cnt[7] ? sr[208] : sr[209];
wire [BW-1:0] stage1out105 = !cnt[7] ? sr[210] : sr[211];
wire [BW-1:0] stage1out106 = !cnt[7] ? sr[212] : sr[213];
wire [BW-1:0] stage1out107 = !cnt[7] ? sr[214] : sr[215];
wire [BW-1:0] stage1out108 = !cnt[7] ? sr[216] : sr[217];
wire [BW-1:0] stage1out109 = !cnt[7] ? sr[218] : sr[219];
wire [BW-1:0] stage1out110 = !cnt[7] ? sr[220] : sr[221];
wire [BW-1:0] stage1out111 = !cnt[7] ? sr[222] : sr[223];
wire [BW-1:0] stage1out112 = !cnt[7] ? sr[224] : sr[225];
wire [BW-1:0] stage1out113 = !cnt[7] ? sr[226] : sr[227];
wire [BW-1:0] stage1out114 = !cnt[7] ? sr[228] : sr[229];
wire [BW-1:0] stage1out115 = !cnt[7] ? sr[230] : sr[231];
wire [BW-1:0] stage1out116 = !cnt[7] ? sr[232] : sr[233];
wire [BW-1:0] stage1out117 = !cnt[7] ? sr[234] : sr[235];
wire [BW-1:0] stage1out118 = !cnt[7] ? sr[236] : sr[237];
wire [BW-1:0] stage1out119 = !cnt[7] ? sr[238] : sr[239];
wire [BW-1:0] stage1out120 = !cnt[7] ? sr[240] : sr[241];
wire [BW-1:0] stage1out121 = !cnt[7] ? sr[242] : sr[243];
wire [BW-1:0] stage1out122 = !cnt[7] ? sr[244] : sr[245];
wire [BW-1:0] stage1out123 = !cnt[7] ? sr[246] : sr[247];
wire [BW-1:0] stage1out124 = !cnt[7] ? sr[248] : sr[249];
wire [BW-1:0] stage1out125 = !cnt[7] ? sr[250] : sr[251];
wire [BW-1:0] stage1out126 = !cnt[7] ? sr[252] : sr[253];
wire [BW-1:0] stage1out127 = !cnt[7] ? sr[254] : sr[255];


//stage2
wire [BW-1:0] stage2out0 = !cnt[6] ? stage1out0 : stage1out1;
wire [BW-1:0] stage2out1 = !cnt[6] ? stage1out2 : stage1out3;
wire [BW-1:0] stage2out2 = !cnt[6] ? stage1out4 : stage1out5;
wire [BW-1:0] stage2out3 = !cnt[6] ? stage1out6 : stage1out7;
wire [BW-1:0] stage2out4 = !cnt[6] ? stage1out8 : stage1out9;
wire [BW-1:0] stage2out5 = !cnt[6] ? stage1out10 : stage1out11;
wire [BW-1:0] stage2out6 = !cnt[6] ? stage1out12 : stage1out13;
wire [BW-1:0] stage2out7 = !cnt[6] ? stage1out14 : stage1out15;
wire [BW-1:0] stage2out8 = !cnt[6] ? stage1out16 : stage1out17;
wire [BW-1:0] stage2out9 = !cnt[6] ? stage1out18 : stage1out19;
wire [BW-1:0] stage2out10 = !cnt[6] ? stage1out20 : stage1out21;
wire [BW-1:0] stage2out11 = !cnt[6] ? stage1out22 : stage1out23;
wire [BW-1:0] stage2out12 = !cnt[6] ? stage1out24 : stage1out25;
wire [BW-1:0] stage2out13 = !cnt[6] ? stage1out26 : stage1out27;
wire [BW-1:0] stage2out14 = !cnt[6] ? stage1out28 : stage1out29;
wire [BW-1:0] stage2out15 = !cnt[6] ? stage1out30 : stage1out31;
wire [BW-1:0] stage2out16 = !cnt[6] ? stage1out32 : stage1out33;
wire [BW-1:0] stage2out17 = !cnt[6] ? stage1out34 : stage1out35;
wire [BW-1:0] stage2out18 = !cnt[6] ? stage1out36 : stage1out37;
wire [BW-1:0] stage2out19 = !cnt[6] ? stage1out38 : stage1out39;
wire [BW-1:0] stage2out20 = !cnt[6] ? stage1out40 : stage1out41;
wire [BW-1:0] stage2out21 = !cnt[6] ? stage1out42 : stage1out43;
wire [BW-1:0] stage2out22 = !cnt[6] ? stage1out44 : stage1out45;
wire [BW-1:0] stage2out23 = !cnt[6] ? stage1out46 : stage1out47;
wire [BW-1:0] stage2out24 = !cnt[6] ? stage1out48 : stage1out49;
wire [BW-1:0] stage2out25 = !cnt[6] ? stage1out50 : stage1out51;
wire [BW-1:0] stage2out26 = !cnt[6] ? stage1out52 : stage1out53;
wire [BW-1:0] stage2out27 = !cnt[6] ? stage1out54 : stage1out55;
wire [BW-1:0] stage2out28 = !cnt[6] ? stage1out56 : stage1out57;
wire [BW-1:0] stage2out29 = !cnt[6] ? stage1out58 : stage1out59;
wire [BW-1:0] stage2out30 = !cnt[6] ? stage1out60 : stage1out61;
wire [BW-1:0] stage2out31 = !cnt[6] ? stage1out62 : stage1out63;
wire [BW-1:0] stage2out32 = !cnt[6] ? stage1out64 : stage1out65;
wire [BW-1:0] stage2out33 = !cnt[6] ? stage1out66 : stage1out67;
wire [BW-1:0] stage2out34 = !cnt[6] ? stage1out68 : stage1out69;
wire [BW-1:0] stage2out35 = !cnt[6] ? stage1out70 : stage1out71;
wire [BW-1:0] stage2out36 = !cnt[6] ? stage1out72 : stage1out73;
wire [BW-1:0] stage2out37 = !cnt[6] ? stage1out74 : stage1out75;
wire [BW-1:0] stage2out38 = !cnt[6] ? stage1out76 : stage1out77;
wire [BW-1:0] stage2out39 = !cnt[6] ? stage1out78 : stage1out79;
wire [BW-1:0] stage2out40 = !cnt[6] ? stage1out80 : stage1out81;
wire [BW-1:0] stage2out41 = !cnt[6] ? stage1out82 : stage1out83;
wire [BW-1:0] stage2out42 = !cnt[6] ? stage1out84 : stage1out85;
wire [BW-1:0] stage2out43 = !cnt[6] ? stage1out86 : stage1out87;
wire [BW-1:0] stage2out44 = !cnt[6] ? stage1out88 : stage1out89;
wire [BW-1:0] stage2out45 = !cnt[6] ? stage1out90 : stage1out91;
wire [BW-1:0] stage2out46 = !cnt[6] ? stage1out92 : stage1out93;
wire [BW-1:0] stage2out47 = !cnt[6] ? stage1out94 : stage1out95;
wire [BW-1:0] stage2out48 = !cnt[6] ? stage1out96 : stage1out97;
wire [BW-1:0] stage2out49 = !cnt[6] ? stage1out98 : stage1out99;
wire [BW-1:0] stage2out50 = !cnt[6] ? stage1out100 : stage1out101;
wire [BW-1:0] stage2out51 = !cnt[6] ? stage1out102 : stage1out103;
wire [BW-1:0] stage2out52 = !cnt[6] ? stage1out104 : stage1out105;
wire [BW-1:0] stage2out53 = !cnt[6] ? stage1out106 : stage1out107;
wire [BW-1:0] stage2out54 = !cnt[6] ? stage1out108 : stage1out109;
wire [BW-1:0] stage2out55 = !cnt[6] ? stage1out110 : stage1out111;
wire [BW-1:0] stage2out56 = !cnt[6] ? stage1out112 : stage1out113;
wire [BW-1:0] stage2out57 = !cnt[6] ? stage1out114 : stage1out115;
wire [BW-1:0] stage2out58 = !cnt[6] ? stage1out116 : stage1out117;
wire [BW-1:0] stage2out59 = !cnt[6] ? stage1out118 : stage1out119;
wire [BW-1:0] stage2out60 = !cnt[6] ? stage1out120 : stage1out121;
wire [BW-1:0] stage2out61 = !cnt[6] ? stage1out122 : stage1out123;
wire [BW-1:0] stage2out62 = !cnt[6] ? stage1out124 : stage1out125;
wire [BW-1:0] stage2out63 = !cnt[6] ? stage1out126 : stage1out127;

//stage3
wire [BW-1:0] stage3out0 = !cnt[5] ? stage2out0 : stage2out1;
wire [BW-1:0] stage3out1 = !cnt[5] ? stage2out2 : stage2out3;
wire [BW-1:0] stage3out2 = !cnt[5] ? stage2out4 : stage2out5;
wire [BW-1:0] stage3out3 = !cnt[5] ? stage2out6 : stage2out7;
wire [BW-1:0] stage3out4 = !cnt[5] ? stage2out8 : stage2out9;
wire [BW-1:0] stage3out5 = !cnt[5] ? stage2out10 : stage2out11;
wire [BW-1:0] stage3out6 = !cnt[5] ? stage2out12 : stage2out13;
wire [BW-1:0] stage3out7 = !cnt[5] ? stage2out14 : stage2out15;
wire [BW-1:0] stage3out8 = !cnt[5] ? stage2out16 : stage2out17;
wire [BW-1:0] stage3out9 = !cnt[5] ? stage2out18 : stage2out19;
wire [BW-1:0] stage3out10 = !cnt[5] ? stage2out20 : stage2out21;
wire [BW-1:0] stage3out11 = !cnt[5] ? stage2out22 : stage2out23;
wire [BW-1:0] stage3out12 = !cnt[5] ? stage2out24 : stage2out25;
wire [BW-1:0] stage3out13 = !cnt[5] ? stage2out26 : stage2out27;
wire [BW-1:0] stage3out14 = !cnt[5] ? stage2out28 : stage2out29;
wire [BW-1:0] stage3out15 = !cnt[5] ? stage2out30 : stage2out31;
wire [BW-1:0] stage3out16 = !cnt[5] ? stage2out32 : stage2out33;
wire [BW-1:0] stage3out17 = !cnt[5] ? stage2out34 : stage2out35;
wire [BW-1:0] stage3out18 = !cnt[5] ? stage2out36 : stage2out37;
wire [BW-1:0] stage3out19 = !cnt[5] ? stage2out38 : stage2out39;
wire [BW-1:0] stage3out20 = !cnt[5] ? stage2out40 : stage2out41;
wire [BW-1:0] stage3out21 = !cnt[5] ? stage2out42 : stage2out43;
wire [BW-1:0] stage3out22 = !cnt[5] ? stage2out44 : stage2out45;
wire [BW-1:0] stage3out23 = !cnt[5] ? stage2out46 : stage2out47;
wire [BW-1:0] stage3out24 = !cnt[5] ? stage2out48 : stage2out49;
wire [BW-1:0] stage3out25 = !cnt[5] ? stage2out50 : stage2out51;
wire [BW-1:0] stage3out26 = !cnt[5] ? stage2out52 : stage2out53;
wire [BW-1:0] stage3out27 = !cnt[5] ? stage2out54 : stage2out55;
wire [BW-1:0] stage3out28 = !cnt[5] ? stage2out56 : stage2out57;
wire [BW-1:0] stage3out29 = !cnt[5] ? stage2out58 : stage2out59;
wire [BW-1:0] stage3out30 = !cnt[5] ? stage2out60 : stage2out61;
wire [BW-1:0] stage3out31 = !cnt[5] ? stage2out62 : stage2out63;

//stage4
wire [BW-1:0] stage4out0 = !cnt[4] ? stage3out0 : stage3out1;
wire [BW-1:0] stage4out1 = !cnt[4] ? stage3out2 : stage3out3;
wire [BW-1:0] stage4out2 = !cnt[4] ? stage3out4 : stage3out5;
wire [BW-1:0] stage4out3 = !cnt[4] ? stage3out6 : stage3out7;
wire [BW-1:0] stage4out4 = !cnt[4] ? stage3out8 : stage3out9;
wire [BW-1:0] stage4out5 = !cnt[4] ? stage3out10 : stage3out11;
wire [BW-1:0] stage4out6 = !cnt[4] ? stage3out12 : stage3out13;
wire [BW-1:0] stage4out7 = !cnt[4] ? stage3out14 : stage3out15;
wire [BW-1:0] stage4out8 = !cnt[4] ? stage3out16 : stage3out17;
wire [BW-1:0] stage4out9 = !cnt[4] ? stage3out18 : stage3out19;
wire [BW-1:0] stage4out10 = !cnt[4] ? stage3out20 : stage3out21;
wire [BW-1:0] stage4out11 = !cnt[4] ? stage3out22 : stage3out23;
wire [BW-1:0] stage4out12 = !cnt[4] ? stage3out24 : stage3out25;
wire [BW-1:0] stage4out13 = !cnt[4] ? stage3out26 : stage3out27;
wire [BW-1:0] stage4out14 = !cnt[4] ? stage3out28 : stage3out29;
wire [BW-1:0] stage4out15 = !cnt[4] ? stage3out30 : stage3out31;

//stage5
wire [BW-1:0] stage5out0 = !cnt[3] ? stage4out0 : stage4out1;
wire [BW-1:0] stage5out1 = !cnt[3] ? stage4out2 : stage4out3;
wire [BW-1:0] stage5out2 = !cnt[3] ? stage4out4 : stage4out5;
wire [BW-1:0] stage5out3 = !cnt[3] ? stage4out6 : stage4out7;
wire [BW-1:0] stage5out4 = !cnt[3] ? stage4out8 : stage4out9;
wire [BW-1:0] stage5out5 = !cnt[3] ? stage4out10 : stage4out11;
wire [BW-1:0] stage5out6 = !cnt[3] ? stage4out12 : stage4out13;
wire [BW-1:0] stage5out7 = !cnt[3] ? stage4out14 : stage4out15;

//stage6
wire [BW-1:0] stage6out0 = !cnt[2] ? stage5out0 : stage5out1;
wire [BW-1:0] stage6out1 = !cnt[2] ? stage5out2 : stage5out3;
wire [BW-1:0] stage6out2 = !cnt[2] ? stage5out4 : stage5out5;
wire [BW-1:0] stage6out3 = !cnt[2] ? stage5out6 : stage5out7;

//stage7
wire [BW-1:0] stage7out0 = !cnt[1] ? stage6out0 : stage6out1;
wire [BW-1:0] stage7out1 = !cnt[1] ? stage6out2 : stage6out3;

//stage 8
//wire [BW-1:0] stage8out = !cnt[0] ? stage7out0 : stage7out1;
wire [BW-1:0] stage8out = start < FINISH_NUMBER ? stage7out0 : stage7out1;

assign outData = start > START_NUMBER_128 ?  stage8out : 0;
//assign outData = start > FINISH_NUMBER ?  stage8out : 0;
//assign outData = start >=134 ? inData : 0;

endmodule