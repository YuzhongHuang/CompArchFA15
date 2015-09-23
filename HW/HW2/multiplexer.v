module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module select(out, addr0, in0, in1);
output out;
input addr0;
input in0, in1;

wire not_addr0;
wire pro_in0, pro_in1;

not #50 n0(not_addr0, addr0);
and #50 andIn0(pro_in0, not_addr0, in0);
and #50 andIn1(pro_in1, addr0, in1);
or #50 orOut(out, pro_in0, pro_in1);

endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;

wire s0_1, s2_3;

select s0(s0_1, address0, in0, in1);
select s1(s2_3, address0, in2, in3);
select s2(out, address1, s0_1, s2_3);

endmodule

module testSelector;
reg addr0_s, in0_s, in1_s;
wire out_s;
select DUT(out_s, addr0_s, in0_s, in1_s);

initial begin
$display("Truth Table for Selector");
$display("A0| I0 I1 | O | Expected Output");
addr0_s=0;in0_s=0;in1_s=0; #1000
$display("%b|   %b  %b | %b | 0", addr0_s, in0_s, in1_s, out_s);
addr0_s=0;in0_s=1;in1_s=0; #1000
$display("%b|   %b  %b | %b | 1", addr0_s, in0_s, in1_s, out_s);
addr0_s=1;in0_s=0;in1_s=1; #1000
$display("%b|   %b  %b | %b | 1", addr0_s, in0_s, in1_s, out_s);
addr0_s=1;in0_s=0;in1_s=0; #1000
$display("%b|   %b  %b | %b | 0", addr0_s, in0_s, in1_s, out_s);
$display("\n");
end
endmodule


module testMultiplexer;
reg addr0,addr1;
reg in0,in1,in2,in3;
wire out;
structuralMultiplexer DUT(out, addr0,addr1, in0,in1,in2,in3);
//behavioralMultiplexer DUT(out, addr0, addr1, in0,in1,in2,in3);

initial begin
$display("\n");
$display("Truth Table for Multiplexer");
$display("A0 A1| I0 I1 I2 I3 | O  | Expected Output");
addr0=0;addr1=0;in0=1;in1=0;in2=0;in3=0; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=0;in0=0;in1=1;in2=0;in3=0; #1000
$display("%b  %b |  %b  %b  %b  %b | %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0=0;addr1=1;in0=0;in1=0;in2=1;in3=0; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b  |  1", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=1;in0=0;in1=0;in2=0;in3=1; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b  |  1", addr0, addr1, in0, in1, in2, in3, out);

addr0=0;addr1=0;in0=0;in1=1;in2=1;in3=1; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=0;in0=1;in1=0;in2=1;in3=1; #1000
$display("%b  %b |  %b  %b  %b  %b | %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0=0;addr1=1;in0=1;in1=1;in2=0;in3=1; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
addr0=1;addr1=1;in0=1;in1=1;in2=1;in3=0; #1000 
$display("%b  %b |  %b  %b  %b  %b | %b  |  0", addr0, addr1, in0, in1, in2, in3, out);
end
endmodule
