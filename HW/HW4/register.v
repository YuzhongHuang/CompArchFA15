`define NOT not #50 

// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule 

// 32-bit D Flip-Flop with enable
//   Positive edge triggered
module register32
(
	output [31:0] q,
	input [31:0] d,
	input wrenable,
	input clk
);

	always @(posedge clk) begin
		if(wrenable) begin
			q = d;
		end
	end
endmodule

// 32-bit zero register 
//   ignore the input
module register32zero
(
	output [31:0] q,
	input [31:0] d,
	input wrenable,
	input clk
);
	always @(posedge clk) begin
		if(wrenable) begin
			q = 32'b0;
		end
	end
endmodule

// module testZero;
// 	reg [31:0]	in;
// 	wire[31:0]	out;
	
// 	register32zero test (out, in);

// 	initial begin
// 		in = 32'b10011101010; #3000
// 		$display("input: %b, output: %b", in[31:0], out[31:0]);	
// 	end
// endmodule

// module test32;
// 	reg clk = 0, wrenable;
// 	reg [31:0]	in;
// 	wire[31:0]	out;
	
// 	register32 test (out, in, wrenable, clk);
// 	always
// 	begin
// 		#5 clk = 1;
// 		#5 clk = 0;
// 	end
// 	initial begin
// 		wrenable = 1;

// 		in = 32'b11111111111111;  #1000
// 		$display("input: %b, output: %b", in[31:0], out[31:0]);	
// 	end
// endmodule