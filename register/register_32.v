module register_32(read_1,read_2,read_3,read_pc,write,write_pc,src1_add,src2_add,src3_add,dest_add,data_write,pc_next,pc_data,out_src1,out_src2,out_src3);
  input [31:0] data_write,pc_next;
  input [3:0] src1_add,src2_add,src3_add,dest_add;
  input read_1,read_2,read_3,read_pc,write,write_pc;
  output [31:0] out_src1,out_src2,out_src3,pc_data; // output src3 to be used in case of shift using register content
  
  wire read_1,read_2,read_3,read_pc,write,write_pc;
  wire [31:0] data_write,pc_next;                   
  wire [3:0] src1_add,src2_add,src3_add,dest_add;    //addresses of register src1,src2,src3
  reg [31:0]register_file[15:0];
  reg [31:0] out_src1,out_src2,out_src3,pc_data;
  
  initial
  begin
    register_file[4'd1]=32'h00000001;
    register_file[4'd2]=32'h00000002;
    register_file[4'd3]=32'h00000002;
    register_file[4'd4]=32'h00000011;
    register_file[4'd5]=32'h2736ad89;
    register_file[4'd6]=32'h98236bcd;
    register_file[4'd7]=32'h173256ab;
    register_file[4'd8]=32'habcdef12;
    register_file[4'd9]=32'hbdac1908;
    register_file[4'd10]=32'h63738209;
    register_file[4'd11]=32'h19191881;
    register_file[4'd12]=32'h28927364;
    register_file[4'd13]=32'h10355538;
    register_file[4'd14]=32'h12736783;
    register_file[4'd15]=32'h00000000;
  end
     
    
  
  
  always@(read_1)
  begin
    if(read_1)          // read signal for first register
      begin
        out_src1=register_file[src1_add];
      end
    else
      begin
        out_src1=out_src1;
        //or out_src1<=32'hxxxxxxxx;
      end
    
  end
  
  always@(read_2)
  begin
    if(read_2)          // read signal for second register read
      begin
        out_src2=register_file[src2_add];
      end
    else
      begin
        out_src2=out_src2;
      end
  end
  
  
  always@(read_3)
  begin
    if(read_3)          //read signal for third register read
      begin
        out_src3=register_file[src3_add];
      end
    else
      begin
        out_src3=out_src3;
      end
  end
  
  
    
    
  always@(write)
  begin
    // introduce an arbiter and use multiple driver resolution function
    if(write)
      begin
        register_file[dest_add]=data_write;
      end
  end
  
  always@(read_pc)
  begin
    if(read_pc)
      pc_data=register_file[4'd15];
    else
      pc_data=pc_data;
  end
  
  always@(write_pc)
  begin
    if(write_pc)
      register_file[4'd15]=pc_next;
  end
      
    
      
endmodule

    
    
    
    
    
    
  
  
  
