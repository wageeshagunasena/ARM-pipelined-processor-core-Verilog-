module new_shifter_tb();
  
  //enable,in_data,in_data_imm,imm_or_reg,shift_control,
  //shift_amt_imm,shift_amt_reg,rotation_code,carry_in,carry_out,out_data
  
  reg [31:0] in_data,shift_amt_reg;
  reg enable,carry_in,imm_or_reg;
  reg [7:0] in_data_imm;
  reg [3:0] rotation_code;
  reg [4:0] shift_amt_imm;
  reg [2:0] shift_control;
  
  wire [31:0] out_data;
  wire carry_out;
  
  shifter shift1(enable,in_data,in_data_imm,imm_or_reg,shift_control,
  shift_amt_imm,shift_amt_reg,rotation_code,carry_in,carry_out,out_data);
  
  initial
  begin
    enable=0;
    carry_in=0;
    in_data_imm=8'b10111000;
    in_data=32'h80000009;
    imm_or_reg=1;
    shift_amt_imm=5'b00010;
    shift_amt_reg=32'd2;
    rotation_code=4'b0001;
    shift_control=100;
    
    #2
    enable=1;
    
    #2
    enable=0;
    carry_in=0;
    //in_data_imm=8'b01100001;
    //in_data=32'h80000009;
    imm_or_reg=0;
    shift_amt_imm=5'b00100;
    shift_amt_reg=32'd2;
    rotation_code=4'b0001;
    
    #2 enable=1;
    
    #2 enable=0;
    carry_in=0;
    //in_data_imm=8'b01100001;
    //in_data=32'h80000009;
    imm_or_reg=1;
    shift_amt_imm=5'b00100;
    shift_amt_reg=32'd2;
    rotation_code=4'b0001;
    shift_control=110;
    
    #2 enable=1;
    
    #2 enable=0;
     carry_in=1;
    //in_data_imm=8'b01100001;
    //in_data=32'h80000009;
    imm_or_reg=1;
    shift_amt_imm=5'b00000;
    shift_amt_reg=32'd2;
    rotation_code=4'b0001;
    shift_control=110;
    
    #2 enable=1;
    #2 enable=0;    
    
    
  end
    
    
  
endmodule
  
  
