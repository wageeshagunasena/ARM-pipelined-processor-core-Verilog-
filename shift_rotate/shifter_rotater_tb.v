module shifter_rotater_tb();
  wire [31:0] out_data;
  wire carry_out_flag;
  reg [31:0] in_data,shift_amt_reg;
  reg [2:0] shift_control;
  reg [4:0] shift_amt_imm;
  reg enable,carry_flag;
  
shifter_rotater shifter_rotater1(in_data,shift_amt_reg,shift_control,shift_amt_imm,enable,carry_flag,out_data,carry_out_flag);

  initial
  begin
    enable=0;
    in_data=32'h88888888;
    shift_amt_reg=32'h00000004;
    shift_amt_imm=5'b10000;
    
    shift_control=3'b001;
    
    #1 enable=1;
    #1 enable=0;
       shift_amt_imm=5'b01000;
       shift_control=3'b010;
    #1 enable=1;
    
  end
  
endmodule
