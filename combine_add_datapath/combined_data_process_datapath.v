module combine_data_process_datapath_tb();
  
  reg rd_1,rd_2,rd_3,rd_pc,wr_reg_file,wr_pc,rd_inst,wr_inst,shft_en,carry_flag,alu_en;
  reg [31:0] pc_next,inst_wr_data;
  wire [31:0] reg_out1,operand2_shftd;//,alu_result;
  wire carry_out,ovrflw,negative_f,zero_f;
  
  //following used as intermediates
  wire [31:0] pc_data,inst,reg_out2,reg_out3;
  wire [31:0] data_wr_reg_file;
  
  
  instruction_memory inst_mem_1(.inst_address(pc_data),.inst_read(rd_inst),.inst_write(wr_inst),.inst_write_data(inst_wr_data),.inst_out(inst));
  
  register_32 reg_file(.read_1(rd_1),.read_2(rd_2),.read_3(rd_3),.read_pc(rd_pc),.write(wr_reg_file)
  ,.write_pc(wr_pc),.src1_add(inst[19:16]),.src2_add(inst[3:0]),.src3_add(inst[11:8])
  ,.dest_add(inst[15:12]),.data_write(data_wr_reg_file),.pc_next(pc_next),.pc_data(pc_data)
  ,.out_src1(reg_out1),.out_src2(reg_out2),.out_src3(reg_out3));
  
  shifter_rotater shift_device(.in_data(reg_out2),.shift_amt_reg(reg_out3),.shift_control(inst[6:4])
  ,.shift_amt_imm(inst[11:7]),.enable(shft_en),.carry_flag(carry_flag),
  .out_data(operand2_shftd),.carry_out_flag(carry_out));
  
  ALU alu1(.enable(alu_en),.control(inst[24:21]),.operand1(reg_out1),.operand2(operand2_shftd),.in_carry(carry_flag),
  .out_data(data_wr_reg_file),.zero_flag(zero_f),.overflow_flag(ovrflw),.negative_flag(negative_f));
  
  
  //^^ out_data sent to write_reg_file
  initial
  begin
    rd_1=0;
    rd_2=0;
    rd_3=0;
    rd_pc=0;
    wr_reg_file=0;
    wr_pc=0;
    alu_en=0;
    rd_inst=0;
    wr_inst=0;
    shft_en=0
    carry_flag=0;
    
    #2rd_pc=1;
    #2rd_pc=0;
      rd_inst=1;
      
    #2rd_inst=0;
      rd_1=1;
      rd_2=1;
      
    #2rd_1=0;
      rd_2=0;
      shft_en=1;
    //  pc_next=32'h00000004;
    //  wr_pc=1;
    #2 alu_en=1; 
    #2
    rd_1=0;
    rd_2=0;
    rd_3=0;
   // rd_pc=1;
    wr_reg_file=1;
    wr_pc=0;
    rd_inst=0;
    wr_inst=0;
    shft_en=0;
    carry_flag=0;
    
    //#2
    //rd_pc=1;
    //#2rd_pc=0;
    //  rd_inst=1;
      
    //#2rd_inst=0;
    //  rd_1=1;
    //  rd_2=1;
      
    //#2rd_1=0;
    //  rd_2=0;
    //  shft_en=1;
  end
      
  
  
endmodule
