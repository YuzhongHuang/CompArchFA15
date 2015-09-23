**

Yuzhong's Homework 2
-----------

**

**Decoder**

A 2-bit decoder with enable (2+1 inputs, 4 outputs)
The following picture (pic 1) shows the output truth table from the decoder:
"En" represents "enable"; "A0", "A1" represents the two addresses input;  "O1" to "O3" points to the four outputs respectively 

![pic 1: decoder_output](https://lh3.googleusercontent.com/--H4qaRrZLBE/VgLlwPXV2NI/AAAAAAAAABo/MR7Ld6qN_CM/s0/decoder_output.png "decoder_output.png")

The wave graph (pic 2) generates by the decoder shows how does the outputs correspond to the inputs

![pic 2: decoder_wave.png](https://lh3.googleusercontent.com/4W-UbWnIIku4Hg5KuBoaf-v_8zgvNqM5WqDR9F2DdA=s0 "decoder_wave.png")

**Adder**

A 1-bit Full Adder
The following picture (pic 3) shows the output truth table of the Multiplexor:
"a", "b" represents two inputs; "Cin", "Cout" represents the carry-in value and carry-out value;  "Sum" shows the sum of the inputs in this digit.
And "Expected Output" just shows the expected value for "Sum"

![pic 3: testFullAdder.png](https://lh3.googleusercontent.com/-acIfoadhCjk/VgLle6uT27I/AAAAAAAAABM/Oo7YNppm3NQ/s0/testFullAdder.png "testFullAdder.png")

The wave graph (pic 4) generates by the adder shows how do the "Sum" and "Cout" correspond to the inputs. 

![pic 4: ](https://lh3.googleusercontent.com/-Bsj5-t3cLPQ/VgLlnToMZxI/AAAAAAAAABc/SoHDsdbTjJ8/s0/testFullAdder_wave.png "testFullAdder_wave.png")

**Selector**

A selector which takes one address bit and two inputs and choose only the value of one input to the output. The selector is not a separate file, but rather is only a module that I wrote to simplify the structure of code
The following picture (pic 5) shows the output truth table of the selector:
"A0" represents the address bit; "I0" to "I1" represents the two inputs value;  "O" shows the output

![pic 5: ](https://lh3.googleusercontent.com/-cZuqxnJpiR8/VgLl_Q0HJsI/AAAAAAAAACM/jPSA3TdJwyQ/s0/testSelector.png "testSelector.png")

The wave graph (pic 6) generates by the multiplexor shows how do the change of output correspond to that of the inputs. 

![pic 6: ](https://lh3.googleusercontent.com/-noyDSZOjylo/VgLmDjbHdVI/AAAAAAAAACY/bXRhD0cKlC8/s0/testSelector_wave.png "testSelector_wave.png")

**Multiplexor**

A 4:1 (four input Multiplexor)
The following picture (pic 7) shows only **part the output truth table** of the Multiplexor. 

There are two reasons to only show the 8 situations (out of 64 cases):  First, showing the all 64 cases is a really expensive move and will generates a very large graph; second, since we have already proved the function of selector and demonstrated how does address bit affect outputs, so we only need to show that the outputs goes as the addresses change is enough. 

The 8 cases I show in the following demonstrates the when address bits are "0, 0", "0, 1", "1, 1", "1, 0", which input will they choose to send to the output by making exactly one input unique(e.x. making the first input to be "1" and all others to be "0"s)

"A0", "A1" represents two addresses; "I0" to "I3" represents the four inputs value;  "O" shows the output

![pic 7: ](https://lh3.googleusercontent.com/-2onP4mYX_jM/VgLl2fpdOgI/AAAAAAAAAB0/c6HRp5Uywmc/s0/testMultiplexer.png "testMultiplexer.png")

The wave graph (pic 8) generates by the multiplexor shows how do the change of output correspond to that of the inputs. 

![pic 8: ](https://lh3.googleusercontent.com/-cwDCJVSWAwk/VgLl66amFPI/AAAAAAAAACA/E8YdF1F90pA/s0/testMultiplexer_wave.png "testMultiplexer_wave.png")

