module new_reg_file_tb();
  
  reg [31:0] data_write,pc_next,reg_update_data;
  reg [3:0] src1_add,src2_add,src3_add,dest_add,reg_update_address,write_back_address;
  reg read_1,read_2,read_3,read_4,read_pc,write,write_pc,reg_update,set_write_bit,set_reg_update;
  wire [31:0] out_src1,out_src2,out_src3,out_src4,pc_content; // output src3 to be used in case of shift using register content
  wire stall;
  
  reg_file reg_file1(read_1,read_2,read_3,read_4,read_pc,write,write_pc,reg_update,set_write_bit,
  set_reg_update,src1_add,src2_add,src3_add,dest_add,reg_update_data,data_write,pc_next,
  reg_update_address,write_back_address,pc_content,out_src1,out_src2,out_src3,out_src4,stall);

  initial
  begin
    src1_add=4'd4;
    src2_add=4'd7;
    src3_add=4'd6;
    dest_add=4'd12;
    read_1=0;
    read_2=0;
    read_3=0;
    read_4=0;
    read_pc=0;
    write=0;
    write_pc=0;
    reg_update=0;
    set_write_bit=0;
    set_reg_update=1;
    data_write=32'd5;
    pc_next=32'd4;
    reg_update_data=32'd11;
    write_back_address=4'd12;
    reg_update_address=4'd4;
    
    
    #2
    read_1=1;
    read_2=1;
    read_3=1;
    read_4=0;
    read_pc=1;
    write=0;
    write_pc=0;
    reg_update=0;
    set_write_bit=1;
    set_reg_update=1;
    
    
    #2
    read_1=1;
    read_2=0;
    read_3=0;
    read_4=0;
    read_pc=0;
    write=0;
    write_pc=1;
    reg_update=0;
    set_write_bit=0;
    set_reg_update=0;
    
    
    
    #2
    src2_add=4'd12;
    read_1=1;
    read_2=1;
    read_3=1;
    read_4=0;
    read_pc=1;
    write=0;
    write_pc=0;
    reg_update=0;
    set_write_bit=0;
    set_reg_update=0;
    
    #2
    read_1=0;
    read_2=0;
    read_3=0;
    read_4=0;
    read_pc=1;
    write=1;
    write_pc=0;
    set_write_bit=0;
    set_reg_update=0;
    reg_update_address=4'd4;

    
    
    #2
    read_1=1;
    read_2=1;
    read_3=1;
    read_4=0;
    read_pc=1;
    write=0;
    write_pc=0;
    reg_update=1;
    set_write_bit=0;
    set_reg_update=0;
    
    
  end
  
endmodule
    
    
    