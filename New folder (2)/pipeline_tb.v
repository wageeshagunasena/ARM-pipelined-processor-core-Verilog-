module pipeline_tb(data1,data2,address_wb,address_reg_update,control_wb);
  
  output wire [31:0] data1,data2;
  output wire [3:0] address_wb,address_reg_update,control_wb;
  
  reg [31:0] alu_result,base_reg_content_load_post,mem_data_write;
  reg [3:0] wb_address,base_register_address;
  reg [3:0] mem_control,wb_control;
  reg clock;
  wire [31:0] alu_result_out,base_reg_content_out,mem_data_write_out;
  wire [3:0] wb_address_out,base_register_address_out,mem_control_out,wb_control_out;
  
  reg [31:0] wb_content;
  wire [75:0] out_data;
  
  alu_mem_pipeline_reg pipeline_reg_stage3(alu_result,base_reg_content_load_post,mem_data_write,wb_address,base_register_address,
  mem_control,wb_control,clock,alu_result_out,base_reg_content_out,mem_data_write_out,wb_address_out,
  base_register_address_out,mem_control_out,wb_control_out);
  
  mem_wb_pipeline_reg pipeline_reg_stage4({wb_control_out,wb_address_out,base_register_address_out,
  base_reg_content_out,wb_content},out_data,clock);
  
  assign control_wb=out_data[75:72],
         address_wb=out_data[71:68],
         address_reg_update=out_data[67:64],
         data1=out_data[63:32],
         data2=out_data[31:0];
         
         
  
  initial
  begin
    clock=0;
    alu_result=32'h98765432;
    base_reg_content_load_post=32'h10293847;
    mem_data_write=32'h01928374;
    wb_address=4'd4;
    base_register_address=4'd9;
    mem_control=4'b0110;
    wb_control=4'b1010;
    wb_content=32'h000001111;
  end
  
  always
  #5 clock=~clock;
  
 
  
endmodule