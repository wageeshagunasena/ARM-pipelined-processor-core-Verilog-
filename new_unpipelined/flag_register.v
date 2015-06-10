module flag_register(carry_update,update_flags,negative_in,zero_in,carry_in,overflow_in,negative_out,zero_out,carry_out,overflow_out);
  
  input carry_update,update_flags,negative_in,zero_in,carry_in,overflow_in;
  output negative_out,zero_out,carry_out,overflow_out;
  
  reg [31:0] flag_reg;
  
  wire carry_update,update_flags,negative_in,zero_in,carry_in,overflow_in;
  wire negative_out,zero_out,carry_out,overflow_out;
  
  assign negative_out=flag_reg[31];
  assign zero_out=flag_reg[30];
  assign carry_out=flag_reg[29];
  assign overflow_out=flag_reg[28];
  
  initial
  begin
    flag_reg[31:28]=4'b0000;
  end
  
  always@(update_flags)
  begin
    if(update_flags)
      begin
      flag_reg[31]=negative_in;
      flag_reg[30]=zero_in;
      flag_reg[29]=carry_in;
      flag_reg[28]=overflow_in;
      end
  end
  
  always@(carry_update)
  begin
    if(carry_update)
      flag_reg[29]=carry_in;
  end
  
endmodule
