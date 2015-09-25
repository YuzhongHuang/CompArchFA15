

**Yuzhong's Homework 2**
-----------



**Decoder**

A 2-bit decoder with enable (2+1 inputs, 4 outputs)
The following picture (pic 1) shows the output truth table from the decoder:
"En" represents "enable"; "A0", "A1" represents the two addresses input;  "O1" to "O3" points to the four outputs respectively 

![pic 1: decoder_output](https://lh3.googleusercontent.com/--H4qaRrZLBE/VgLlwPXV2NI/AAAAAAAAABo/MR7Ld6qN_CM/s0/decoder_output.png "decoder_output.png")

The wave graph (pic 2) generates by the decoder shows how does the outputs correspond to the inputs. 

As we can see, the four outputs is not connected at the very beginning. I think that is resulted from the fact that I assign 50ns delay to each gate, therefore the signal takes a little time to go to the output.

There is also a noise(a small bump in the middle of output 3) in the graph. My guess would be that when enable suddenly change from 0 to 1, while the two address bits also turns from high to low, the signal arrived at the final enable gate was (1, 1), which will make output high, experienced a delay from the previous gates. So if I choose to measure the signal after about 50 ns would be a safe choice. Also, I can use a clock to filter out that small noise.

![pic 2: decoder_wave.png](https://lh3.googleusercontent.com/4W-UbWnIIku4Hg5KuBoaf-v_8zgvNqM5WqDR9F2DdA=s0 "decoder_wave.png")

**Adder**

A 1-bit Full Adder
The following picture (pic 3) shows the output truth table of the Multiplexor:
"a", "b" represents two inputs; "Cin", "Cout" represents the carry-in value and carry-out value;  "Sum" shows the sum of the inputs in this digit.
And "Expected Output" just shows the expected value for "Sum"

![pic 3: testFullAdder.png](https://lh3.googleusercontent.com/-laLBjYwJHXU/VgMHL_DUpKI/AAAAAAAAADo/7Im4zlC29uk/s0/testFullAdder.png "testFullAdder.png")

The wave graph (pic 4) generates by the adder shows how do the "Sum" and "Cout" correspond to the inputs. 

![pic 4: testFullAdder_wave.png](https://lh3.googleusercontent.com/-kpdyUI3ci1w/VgMHUPCADmI/AAAAAAAAAD0/O29x8nrXTJo/s0/testFullAdder_wave.png "testFullAdder_wave.png")

The pic 5 shows a piece of code used to explain the noises in the above wave graph:

The outputs are not connected at the very beginning, and the length is longer than the decoder. I think that's because the adder has more gates than the decoder, therefore takes longer for the signal to arrive at the outputs.
 
The first bump of the carryout rises when carryin changes from 0 to 1. So the signal first changes the or4 gates from 0 to 1(or6 is originally 1 so it won't affect), however, or5 gate takes three inputs and go through another not gate before and therefore takes slightly longer than the or4. So there is a point when all of or4, or5 and or6 are high before or5 receives the signal and changes to one.

The remaining bumps goes the same way.

![pic 5 code part 1](https://lh3.googleusercontent.com/-SIMm5Jr1RhM/VgSHISgutgI/AAAAAAAAAEQ/RFWpnJkrlMM/s0/Untitled.png "CodePart1.png")

**Selector**

A selector which takes one address bit and two inputs and choose only the value of one input to the output. The selector is not a separate file, but rather is only a module that I wrote to simplify the structure of code
The following picture (pic 6) shows the output truth table of the selector:
"A0" represents the address bit; "I0" to "I1" represents the two inputs value;  "O" shows the output

![pic 6: testSelector.png](https://lh3.googleusercontent.com/-cZuqxnJpiR8/VgLl_Q0HJsI/AAAAAAAAACM/jPSA3TdJwyQ/s0/testSelector.png "testSelector.png")

The wave graph (pic 7) generates by the multiplexor shows how do the change of output correspond to that of the inputs. 

The selector also experienced a small period of disconnection at the beginning and don't have any noises, which is good! 

![pic 7: testSelector_wave.png](https://lh3.googleusercontent.com/-noyDSZOjylo/VgLmDjbHdVI/AAAAAAAAACY/bXRhD0cKlC8/s0/testSelector_wave.png "testSelector_wave.png")

**Multiplexor**

A 4:1 (four input Multiplexor)
The following picture (pic 8) shows only **part the output truth table** of the Multiplexor. 

There are two reasons to only show the 8 situations (out of 64 cases):  First, showing the all 64 cases is a really expensive move and will generates a very large graph; second, since we have already proved the function of selector and demonstrated how does address bit affect outputs, so we only need to show that the outputs goes as the addresses change is enough. 

The 8 cases I show in the following demonstrates the when address bits are "0, 0", "0, 1", "1, 1", "1, 0", which input will they choose to send to the output by making exactly one input unique(e.x. making the first input to be "1" and all others to be "0"s)

"A0", "A1" represents two addresses; "I0" to "I3" represents the four inputs value;  "O" shows the output

![pic 8: testMultiplexer.png](https://lh3.googleusercontent.com/-2onP4mYX_jM/VgLl2fpdOgI/AAAAAAAAAB0/c6HRp5Uywmc/s0/testMultiplexer.png "testMultiplexer.png")

The wave graph (pic 9) generates by the multiplexor shows how do the change of output correspond to that of the inputs. The noises in the Multipelxor comes with the same reason of the cases I analyzed before

![pic 9: testMultiplexer_wave.png](https://lh3.googleusercontent.com/-cwDCJVSWAwk/VgLl66amFPI/AAAAAAAAACA/E8YdF1F90pA/s0/testMultiplexer_wave.png "testMultiplexer_wave.png")

