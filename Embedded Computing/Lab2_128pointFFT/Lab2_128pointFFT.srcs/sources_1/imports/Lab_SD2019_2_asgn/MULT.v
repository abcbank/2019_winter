
//128 points interpolation FFT
//Module: MULT
module MULT(data_in_re,data_in_im,cnt,data_out_re,data_out_im);
parameter BW=16;
parameter N =64;

//Real & Imaginary part each 64 twiddle factors
//12 bits width
wire signed [11:0] W_re[63:0];
wire signed [11:0] W_im[63:0];
                                           
input signed [BW-1:0] data_in_re;//(9:4)
input signed [BW-1:0] data_in_im;
input [5:0] cnt;
output signed[BW-1:0] data_out_re;//(9:4)
output signed[BW-1:0] data_out_im;

//For each stages's input parameter'N', temp_XX: storage of twiddle factor
// 12 bits width
reg signed [11:0] temp_re; //[10:0]
reg signed [11:0] temp_im; //[10:0]
    
wire signed [BW+12:0] buf_re0;
wire signed [BW+12:0] buf_im0;
wire signed [BW+12:0] buf_im1;
wire signed [BW+12:0] buf_re1;
    
wire signed [BW+12:0] buf_re; //[23:0]
wire signed [BW+12:0] buf_im; //[23:0]
    
        

assign buf_re0 = temp_re*data_in_re; // [24:0]
assign buf_im0 = temp_im*data_in_re; // [24:0]
assign buf_re1 = temp_im*data_in_im; // [24:0]
assign buf_im1 = temp_re*data_in_im; // [24:0]

//buf_re = (temp_re*data_in_re)-(temp_im*data_in_im);
assign buf_re = buf_re0-buf_re1; // [24:0]

//buf_im = (temp_im*data_in_re)+(temp_re*data_in_im);
assign buf_im = buf_im0+buf_im1; // [24:0]

assign data_out_re = {buf_re[BW+12],buf_re[BW+8:10]};
assign data_out_im = {buf_im[BW+12],buf_im[BW+8:10]};


//Twiddle factor
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

always@(*) begin
    if(N==64) begin  //stage1 MULT
        case(cnt)
        6'd0 : begin
                temp_re <= W_re[0];
                temp_im <= W_im[0];
                end
        6'd1 : begin
                temp_re <= W_re[1];
                temp_im <= W_im[1];
                end
        6'd2 : begin
                temp_re <= W_re[2];
                temp_im <= W_im[2];
                end
        6'd3 : begin
                temp_re <= W_re[3];
                temp_im <= W_im[3];
                end
        6'd4 : begin
                temp_re <= W_re[4];
                temp_im <= W_im[4];
                end
        6'd5 : begin
                temp_re <= W_re[5];
                temp_im <= W_im[5];
                end                                         
        6'd6 : begin
                temp_re <= W_re[6];
                temp_im <= W_im[6];
                end                                         
        6'd7 : begin
                temp_re <= W_re[7];
                temp_im <= W_im[7];
                end                                         
        6'd8 : begin
                temp_re <= W_re[8];
                temp_im <= W_im[8];
                end                                         
        6'd9 : begin
                temp_re <= W_re[9];
                temp_im <= W_im[9];
                end                                         
        6'd10 : begin
                temp_re <= W_re[10];
                temp_im <= W_im[10];
                end                                         
        6'd11 : begin
                temp_re <= W_re[11];
                temp_im <= W_im[11];
                end                                         
        6'd12 : begin
                temp_re <= W_re[12];
                temp_im <= W_im[12];
                end                                         
        6'd13 : begin
                temp_re <= W_re[13];
                temp_im <= W_im[13];
                end                                         
        6'd14 : begin
                temp_re <= W_re[14];
                temp_im <= W_im[14];
                end                                         
        6'd15 : begin
                temp_re <= W_re[15];
                temp_im <= W_im[15];
                end                                         
        6'd16 : begin
                temp_re <= W_re[16];
                temp_im <= W_im[16];
                end                                         
        6'd17 : begin
                temp_re <= W_re[17];
                temp_im <= W_im[17];
                end                                         
        6'd18 : begin
                temp_re <= W_re[18];
                temp_im <= W_im[18];
                end                                         
        6'd19 : begin
                temp_re <= W_re[19];
                temp_im <= W_im[19];
                end                                         
        6'd20 : begin
                temp_re <= W_re[20];
                temp_im <= W_im[20];
                end                                         
        6'd21 : begin
                temp_re <= W_re[21];
                temp_im <= W_im[21];
                end                                         
        6'd22 : begin
                temp_re <= W_re[22];
                temp_im <= W_im[22];
                end                                         
        6'd23 : begin
                temp_re <= W_re[23];
                temp_im <= W_im[23];
                end                                         
        6'd24 : begin
                temp_re <= W_re[24];
                temp_im <= W_im[24];
                end                                         
        6'd25 : begin
                temp_re <= W_re[25];
                temp_im <= W_im[25];
                end                                         
        6'd26 : begin
                temp_re <= W_re[26];
                temp_im <= W_im[26];
                end                                         
        6'd27 : begin
                temp_re <= W_re[27];
                temp_im <= W_im[27];
                end                                         
        6'd28 : begin
                temp_re <= W_re[28];
                temp_im <= W_im[28];
                end                                         
        6'd29 : begin
                temp_re <= W_re[29];
                temp_im <= W_im[29];
                end                                         
        6'd30 : begin
                temp_re <= W_re[30];
                temp_im <= W_im[30];
                end                                         
        6'd31 : begin
                temp_re <= W_re[31];
                temp_im <= W_im[31];
                end                                         
        6'd32 : begin
                temp_re <= W_re[32];
                temp_im <= W_im[32];
                end                                         
        6'd33 : begin
                temp_re <= W_re[33];
                temp_im <= W_im[33];
                end                                         
        6'd34 : begin
                temp_re <= W_re[34];
                temp_im <= W_im[34];
                end                                         
        6'd35 : begin
                temp_re <= W_re[35];
                temp_im <= W_im[35];
                end                                         
        6'd36 : begin
                temp_re <= W_re[36];
                temp_im <= W_im[36];
                end                                         
        6'd37 : begin
                temp_re <= W_re[37];
                temp_im <= W_im[37];
                end                                         
        6'd38 : begin
                temp_re <= W_re[38];
                temp_im <= W_im[38];
                end                                         
        6'd39 : begin
                temp_re <= W_re[39];
                temp_im <= W_im[39];
                end                                         
        6'd40 : begin
                temp_re <= W_re[40];
                temp_im <= W_im[40];
                end                                         
        6'd41 : begin
                temp_re <= W_re[41];
                temp_im <= W_im[41];
                end                                         
        6'd42 : begin
                temp_re <= W_re[42];
                temp_im <= W_im[42];
                end                                         
        6'd43 : begin
                temp_re <= W_re[43];
                temp_im <= W_im[43];
                end                                         
        6'd44 : begin
                temp_re <= W_re[44];
                temp_im <= W_im[44];
                end                                         
        6'd45 : begin
                temp_re <= W_re[45];
                temp_im <= W_im[45];
                end                                         
        6'd46 : begin
                temp_re <= W_re[46];
                temp_im <= W_im[46];
                end                                         
        6'd47 : begin
                temp_re <= W_re[47];
                temp_im <= W_im[47];
                end                                         
        6'd48 : begin
                temp_re <= W_re[48];
                temp_im <= W_im[48];
                end                                         
        6'd49 : begin
                temp_re <= W_re[49];
                temp_im <= W_im[49];
                end                                         
        6'd50 : begin
                temp_re <= W_re[50];
                temp_im <= W_im[50];
                end                                         
        6'd51 : begin
                temp_re <= W_re[51];
                temp_im <= W_im[51];
                end                                         
        6'd52 : begin
                temp_re <= W_re[52];
                temp_im <= W_im[52];
                end                                         
        6'd53 : begin
                temp_re <= W_re[53];
                temp_im <= W_im[53];
                end                                         
        6'd54 : begin
                temp_re <= W_re[54];
                temp_im <= W_im[54];
                end                                         
        6'd55 : begin
                temp_re <= W_re[55];
                temp_im <= W_im[55];
                end                                         
        6'd56 : begin
                temp_re <= W_re[56];
                temp_im <= W_im[56];
                end                                         
        6'd57 : begin
                temp_re <= W_re[57];
                temp_im <= W_im[57];
                end                                         
        6'd58 : begin
                temp_re <= W_re[58];
                temp_im <= W_im[58];
                end                                         
        6'd59 : begin
                temp_re <= W_re[59];
                temp_im <= W_im[59];
                end                                         
        6'd60 : begin
                temp_re <= W_re[60];
                temp_im <= W_im[60];
                end                                         
        6'd61 : begin
                temp_re <= W_re[61];
                temp_im <= W_im[61];
                end                                         
        6'd62 : begin
                temp_re <= W_re[62];
                temp_im <= W_im[62];
                end                                         
        6'd63 : begin
                temp_re <= W_re[63];
                temp_im <= W_im[63];
                end                                         
            endcase
    end
            else if (N==32)begin //stage2 MULT
                case(cnt[4:0])
                5'd1 : begin
                       temp_re <= W_re[0];
                       temp_im <= W_im[0];
                       end
                5'd2 : begin
                       temp_re <= W_re[2];
                       temp_im <= W_im[2];
                       end            
                5'd3 : begin
                       temp_re <= W_re[4];
                       temp_im <= W_im[4];
                       end                        
                5'd4 : begin
                       temp_re <= W_re[6];
                       temp_im <= W_im[6];
                       end
                5'd5 : begin
                       temp_re <= W_re[8];
                       temp_im <= W_im[8];
                       end
                5'd6 : begin
                       temp_re <= W_re[10];
                       temp_im <= W_im[10];
                       end       
                5'd7 : begin
                       temp_re <= W_re[12];
                       temp_im <= W_im[12];
                       end
                5'd8 : begin
                       temp_re <= W_re[14];
                       temp_im <= W_im[14];
                       end
                5'd9 : begin
                       temp_re <= W_re[16];
                       temp_im <= W_im[16];
                       end
                5'd10 : begin
                       temp_re <= W_re[18];
                       temp_im <= W_im[18];
                       end
                5'd11 : begin
                       temp_re <= W_re[20];
                       temp_im <= W_im[20];
                       end
                5'd12 : begin
                       temp_re <= W_re[22];
                       temp_im <= W_im[22];
                       end
                5'd13 : begin
                       temp_re <= W_re[24];
                       temp_im <= W_im[24];
                       end
                5'd14 : begin
                       temp_re <= W_re[26];
                       temp_im <= W_im[26];
                       end       
                5'd15 : begin
                       temp_re <= W_re[28];
                       temp_im <= W_im[28];
                       end
                5'd16 : begin
                       temp_re <= W_re[30];
                       temp_im <= W_im[30];
                       end
                5'd17 : begin
                       temp_re <= W_re[32];
                       temp_im <= W_im[32];
                       end
                5'd18 : begin
                       temp_re <= W_re[34];
                       temp_im <= W_im[34];
                       end
                5'd19 : begin
                       temp_re <= W_re[36];
                       temp_im <= W_im[36];
                       end
                5'd20 : begin
                       temp_re <= W_re[38];
                       temp_im <= W_im[38];
                       end
                5'd21 : begin
                       temp_re <= W_re[40];
                       temp_im <= W_im[40];
                       end
                5'd22 : begin
                       temp_re <= W_re[42];
                       temp_im <= W_im[42];
                       end
                5'd23 : begin
                       temp_re <= W_re[44];
                       temp_im <= W_im[44];
                       end
                5'd24 : begin
                       temp_re <= W_re[46];
                       temp_im <= W_im[46];
                       end
                5'd25 : begin
                       temp_re <= W_re[48];
                       temp_im <= W_im[48];
                       end
                5'd26 : begin
                       temp_re <= W_re[50];
                       temp_im <= W_im[50];
                       end
                5'd27 : begin
                       temp_re <= W_re[52];
                       temp_im <= W_im[52];
                       end
                5'd28 : begin
                       temp_re <= W_re[54];
                       temp_im <= W_im[54];
                       end
                5'd29 : begin
                       temp_re <= W_re[56];
                       temp_im <= W_im[56];
                       end
                5'd30 : begin
                       temp_re <= W_re[58];
                       temp_im <= W_im[58];
                       end
                5'd31 : begin
                       temp_re <= W_re[60];
                       temp_im <= W_im[60];
                       end
                5'd0 : begin
                       temp_re <= W_re[62];
                       temp_im <= W_im[62];
                       end              
              endcase
           end     
        else if (N==16) begin   //stage3 MULT
                case(cnt[3:0])
                4'd2 : begin
                       temp_re <= W_re[0];
                       temp_im <= W_im[0];
                       end
                4'd3 : begin
                       temp_re <= W_re[4];
                       temp_im <= W_im[4];
                       end            
                4'd4 : begin
                       temp_re <= W_re[8];
                       temp_im <= W_im[8];
                       end                        
                4'd5 : begin
                       temp_re <= W_re[12];
                       temp_im <= W_im[12];
                       end
                4'd6 : begin
                       temp_re <= W_re[16];
                       temp_im <= W_im[16];
                       end
                4'd7 : begin
                       temp_re <= W_re[20];
                       temp_im <= W_im[20];
                       end       
                4'd8 : begin
                       temp_re <= W_re[24];
                       temp_im <= W_im[24];
                       end
                4'd9 : begin
                       temp_re <= W_re[28];
                       temp_im <= W_im[28];
                       end
                4'd10: begin
                       temp_re <= W_re[32];
                       temp_im <= W_im[32];
                       end
                4'd11: begin
                       temp_re <= W_re[36];
                       temp_im <= W_im[36];
                       end
                4'd12: begin
                       temp_re <= W_re[40];
                       temp_im <= W_im[40];
                       end
                4'd13: begin
                       temp_re <= W_re[44];
                       temp_im <= W_im[44];
                       end
                4'd14: begin
                       temp_re <= W_re[48];
                       temp_im <= W_im[48];
                       end
                4'd15: begin
                       temp_re <= W_re[52];
                       temp_im <= W_im[52];
                       end       
                4'd0 : begin
                       temp_re <= W_re[56];
                       temp_im <= W_im[56];
                       end
                4'd1 : begin
                       temp_re <= W_re[60];
                       temp_im <= W_im[60];
                       end
              endcase
           end
        else if (N==8) begin    //stage4 MULT
                case(cnt[2:0])
                3'd3 : begin
                       temp_re <= W_re[0];
                       temp_im <= W_im[0];
                       end
                3'd4 : begin
                       temp_re <= W_re[8];
                       temp_im <= W_im[8];
                       end            
                3'd5 : begin
                       temp_re <= W_re[16];
                       temp_im <= W_im[16];
                       end                        
                3'd6 : begin
                       temp_re <= W_re[24];
                       temp_im <= W_im[24];
                       end
                3'd7 : begin
                       temp_re <= W_re[32];
                       temp_im <= W_im[32];
                       end
                3'd0 : begin
                       temp_re <= W_re[40];
                       temp_im <= W_im[40];
                       end       
                3'd1 : begin
                       temp_re <= W_re[48];
                       temp_im <= W_im[48];
                       end
                3'd2 : begin
                       temp_re <= W_re[56];
                       temp_im <= W_im[56];
                       end
              endcase
       end
        else if (N==4) begin    //stage5 MULT
            case(cnt[1:0])
                2'd0 : begin
                       temp_re <= W_re[0];
                       temp_im <= W_im[0];
                       end
                2'd1 : begin
                       temp_re <= W_re[16];
                       temp_im <= W_im[16];
                       end            
                2'd2 : begin
                       temp_re <= W_re[32];
                       temp_im <= W_im[32];
                       end
                2'd3 : begin
                       temp_re <= W_re[48];
                       temp_im <= W_im[48];
                       end            
              endcase
       end
        else begin   //if (N==2)  //stage6 MULT
            case(cnt[0])
                2'd1 : begin
                       temp_re <= W_re[0];
                       temp_im <= W_im[0];
                       end
                2'd0 : begin
                       temp_re <= W_re[32];
                       temp_im <= W_im[32];
                       end
            endcase
        end
    end

endmodule                                                                                        