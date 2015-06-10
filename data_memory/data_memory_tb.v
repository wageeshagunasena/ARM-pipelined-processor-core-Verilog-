module data_memory_tb();
  reg [31:0] in_data_write,data_address;
  reg data_read,data_write;
  wire [31:0] out_data;
  
  data_memory data_mem1(data_address,in_data_write,data_read,data_write,out_data);
  
  initial
  begin
  data_read=0;
  data_address=32'h00000000;
  #2  data_read=1;
  
  in_data_write=32'h19283746;
  #2data_read=0;
  data_write=1;
  
  #2data_write=0;
  data_read=1;
  
  end

endmodule   
