module forwarding_logic(in_add1,in_add2,in_add3,in_add4,rd1,rd2,rd3,rd4,wr1,wr2,wr3,load,match_add1,
                        match_add2,match_add3,mux_sel1,mux_sel2,mux_sel3,mux_sel4,freeze);
                        
  input wire [3:0] in_add1,in_add2,in_add3,in_add4,match_add1,match_add2,match_add3;
  input wire rd1,rd2,rd3,rd4,load,wr1,wr2,wr3;
  
  output wire [1:0] mux_sel1,mux_sel2,mux_sel3,mux_sel4;
  output wire freeze;
  
  wire stall1,stall2,stall3,stall4;
  
  forwarding_check_logic fw1(.in_add(in_add1),.wr1(wr1),.match_add1(match_add1),.wr2(wr2),.match_add2(match_add2),
                             .wr3(wr3),.match_add3(match_add3),.load(load),.rd(rd1),.mux_sel(mux_sel1),.stall(stall1));
  forwarding_check_logic fw2(.in_add(in_add2),.wr1(wr1),.match_add1(match_add1),.wr2(wr2),.match_add2(match_add2),
                             .wr3(wr3),.match_add3(match_add3),.load(load),.rd(rd2),.mux_sel(mux_sel2),.stall(stall2));
  forwarding_check_logic fw3(.in_add(in_add3),.wr1(wr1),.match_add1(match_add1),.wr2(wr2),.match_add2(match_add2),
                             .wr3(wr3),.match_add3(match_add3),.load(load),.rd(rd3),.mux_sel(mux_sel3),.stall(stall3));
  forwarding_check_logic fw4(.in_add(in_add4),.wr1(wr1),.match_add1(match_add1),.wr2(wr2),.match_add2(match_add2),
                             .wr3(wr3),.match_add3(match_add3),.load(load),.rd(rd4),.mux_sel(mux_sel4),.stall(stall4));
  
  or o1(freeze,stall1,stall2,stall3,stall4);
  
endmodule
  
  
  
  
  
