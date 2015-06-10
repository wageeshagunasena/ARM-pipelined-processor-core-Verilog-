module tr_concat(in_data,out_data);
  
  input wire [25:0] in_data;
  output wire [31:0] out_data;
  
  assign out_data={{6{in_data[25]}},in_data};
  
endmodule
