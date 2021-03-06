module combinational_shifter_4bit(in_data,shft_amt,shft_rotate,out_data);
  
  input wire [3:0] in_data;
  output wire [3:0] out_data;
  input wire [1:0] shft_amt;
  input wire shft_rotate;
  
  wire [3:0] m1_in,m2_in,m3_in,m4_in;
  wire m1_in_2;
  
  /*
  mux_2x1_bit m1_2bit_1();
  mux_2x1_bit m1_2bit_2();
  mux_2x1_bit m1_2bit_3();
  mux_2x1_bit m1_2bit_4();
  */
  
  mux_2x1_1bit m2_in_2bits(1'b0,in_data[3],shft_rotate,m2_in_2);
    
  assign m1_in[0]=in_data[3];
  assign m1_in[1]=in_data[2];
  assign m1_in[2]=in_data[1];
  assign m1_in[3]=in_data[0];
  
  assign m2_in[0]=in_data[2];
  assign m2_in[1]=in_data[1];
  assign m2_in[2]=in_data[0];
  assign m2_in[3]=m2_in_2;
  
  assign m3_in[0]=in_data[1];
  assign m3_in[1]=in_data[0];
  assign m3_in[2]=0;
  assign m3_in[3]=0;
  
  assign m4_in[0]=in_data[0];
  assign m4_in[1]=0;
  assign m4_in[2]=0;
  assign m4_in[3]=0;
    
  
  mux_4x1_1bit m1(m1_in[0],m1_in[1],m1_in[2],m1_in[3],shft_amt,out_data[3]);
  mux_4x1_1bit m2(m2_in[0],m2_in[1],m2_in[2],m2_in[3],shft_amt,out_data[2]);
  mux_4x1_1bit m3(m3_in[0],m3_in[1],m3_in[2],m3_in[3],shft_amt,out_data[1]);
  mux_4x1_1bit m4(m4_in[0],m4_in[1],m4_in[2],m4_in[3],shft_amt,out_data[0]);
  
  
endmodule
