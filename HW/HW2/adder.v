module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(out, carryout, a, b, carryin);
output out, carryout;
input a, b, carryin;
  
wire not_a, not_b, not_c;
wire a_b_c, n_a_b_n_c, n_a_n_b_c, a_n_b_n_c, b_c, a_b_n_c, a_n_b_c;

not notA(not_a, a);
not notB(not_b, b);
not notC(not_c, carryin);

or or0(a_b_c, a, b, carryin);
or or1(n_a_b_n_c, not_a, b, not_c);
or or2(n_a_n_b_c, not_a, not_b, carryin);
or or3(a_n_b_n_c, a, not_b, not_c);
or or4(b_c, b, carryin);
or or5(a_b_n_c, a, b, not_c);
or or6(a_n_b_c, a, not_b, carryin);

and andSum(out, a_b_c, n_a_b_n_c, n_a_n_b_c, a_n_b_n_c);
and andCarryout(carryout, b_c, a_b_n_c, a_n_b_c);

endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
structuralFullAdder adder (sum, carryout, a, b, carryin);
//behavioralFullAdder adder (sum, carryout, a, b, carryin);

initial begin
$display("a  b| Cin Cout | Sum | Expected Output");
a=0;b=0;carryin=0; #1000 
$display("%b  %b | %b     %b |   %b |  0", a, b, carryin, carryout, sum);
a=0;b=0;carryin=1; #1000 
$display("%b  %b | %b     %b |   %b |  1", a, b, carryin, carryout, sum);
a=0;b=1;carryin=0; #1000 
$display("%b  %b | %b     %b |   %b |  1", a, b, carryin, carryout, sum);
a=0;b=1;carryin=1; #1000 
$display("%b  %b | %b     %b |   %b |  0", a, b, carryin, carryout, sum);
a=1;b=0;carryin=0; #1000 
$display("%b  %b | %b     %b |   %b |  1", a, b, carryin, carryout, sum);
a=1;b=0;carryin=1; #1000 
$display("%b  %b | %b     %b |   %b |  0", a, b, carryin, carryout, sum);
a=1;b=1;carryin=0; #1000 
$display("%b  %b | %b     %b |   %b |  0", a, b, carryin, carryout, sum);
a=1;b=1;carryin=1; #1000 
$display("%b  %b | %b     %b |   %b |  1", a, b, carryin, carryout, sum);
end
endmodule
