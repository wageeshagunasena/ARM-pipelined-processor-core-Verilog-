module subtractor(in_data,out_data);
  
  input wire [31:0] in_data;
  output wire [31:0] out_data;
  
  assign out_data=in_data-8;
  
endmodule
