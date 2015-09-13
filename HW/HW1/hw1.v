module hw1test;
reg A; // The input A
reg B; // The input B
wire nA;
wire nB;
wire AorB;
wire AandB;
wire nAandB;
wire nAornB;
wire nAorB;
wire nAandnB;

not Ainv(nA, A); // top inverter produces signal nA and takes
// signal A, and is named Ainv

not Binv(nB, B); // inverter produces signal nB and takes
// signal B, and is named Binv

or AorBgate(AorB, A, B); // or gate produces AorB from A and B

and AandBgate(AandB, A, B); // and gate produces AandB from A and B

not nAandBgate(nAandB, AandB); // inverter produces nAandB from AandB

or nAornBgate(nAornB, nA, nB); // or gate produce nAornB from nA and nB

not nAorBgate(nAorB, AorB); // inverter produce nAorB from A and B

and nAandnBgate(nAandnB, nA, nB); // and gate produces nAandnB from nA and nB


initial begin
$display("A B | ~A ~B | ~(AB) ~A+~B | ~(A+B) ~A~B "); // Prints header for truth table
A=0;B=0; #1 // Set A and B, wait for update (#1)
$display("%b %b |  %b  %b |    %b     %b  |   %b      %b ", A,B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
A=0;B=1; #1 // Set A and B, wait for new update
$display("%b %b |  %b  %b |    %b     %b  |   %b      %b ", A,B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
A=1;B=0; #1
$display("%b %b |  %b  %b |    %b     %b  |   %b      %b ", A,B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
A=1;B=1; #1
$display("%b %b |  %b  %b |    %b     %b  |   %b      %b ", A,B, nA, nB, nAandB, nAornB, nAorB, nAandnB);
end

endmodule