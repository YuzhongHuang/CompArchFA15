module behavioralDecoder(out0,out1,out2,out3, address0, address1, enable);
output out0, out1, out2, out3;
input address0, address1;
input enable;
assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule

module structuralDecoder(out0,out1,out2,out3, address0, address1, enable);
output out0, out1, out2, out3;
input address0, address1;
input enable;
  
//local variables
wire not_address0, not_address1;
wire pre_o0, pre_o1, pre_o2, pre_o3;

//assignment
not #50 n0(not_address0, address0);
not #50 n1(not_address1, address1);

and #50 AndGate0(pre_o0, not_address0, not_address1);
and #50 AndGate1(pre_o1, address0, not_address1);
and #50 AndGate2(pre_o2, not_address0, address1);
and #50 AndGate3(pre_o3, address0, address1);

and #50 O0(out0, enable, pre_o0);
and #50 O1(out1, enable, pre_o1);
and #50 O2(out2, enable, pre_o2);
and #50 O3(out3, enable, pre_o3);

endmodule

module testDecoder; 
reg addr0, addr1;
reg enable;
wire out0,out1,out2,out3;
structuralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable);
//structuralDecoder decoder (out0,out1,out2,out3,addr0,addr1,enable); // Swap after testing

initial begin
$display("En A0 A1| O0 O1 O2 O3 | Expected Output");
enable=0;addr0=0;addr1=0; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=0;addr0=1;addr1=0; #1000
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=0;addr0=0;addr1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=0;addr0=1;addr1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | All false", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=0;addr1=0; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O0 Only", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=1;addr1=0; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O1 Only", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=0;addr1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O2 Only", enable, addr0, addr1, out0, out1, out2, out3);
enable=1;addr0=1;addr1=1; #1000 
$display("%b  %b  %b |  %b  %b  %b  %b | O3 Only", enable, addr0, addr1, out0, out1, out2, out3);
end
endmodule
