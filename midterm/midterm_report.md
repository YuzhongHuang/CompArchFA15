# Bike Light Controller Specification Document

### Yuzhong Huang

## Specification 

### Overview

A bike light controller in the document controls one single LED in bike light. This bike light should have four modes:  Off, On, Blinking, and Dim (On at approximately 50% brightness). It cycles through the modes by pressing a single button.

### Inputs and Outputs

The input for the bike light is a single button. When the button is pressed(the system will react on the rising edge of the button input), the bike light will change to the next mode in order of Off, On, Blinking and Dim.

The output of the bike light is a single LED that produces light when power is applied. 

### Modes

 1. Off

	Off mode	simply cuts off the power and the LED should not produce any light. As shown in the following graph.

	![enter image description here](https://lh3.googleusercontent.com/C4PX3fGGcOauuMFMlRSqa882qeCtrUTb-qariMtJ-6E=s200 "off.png") 

 2. On

	On mode turns on the power and the LED light up. As shown in the following graph.

	![enter image description here](https://lh3.googleusercontent.com/-Ovo5VMT4EU0/VkVIQEFPdJI/AAAAAAAAAL0/bQd3o-mGDT4/s200/on.jpg "on.jpg")

 3. Blink

	When the bike light is in Blink mode, the system will produce a blinking light with a frequency of 8 HZ. As shown in the following graph.
	
  ![enter image description here](https://lh3.googleusercontent.com/C4PX3fGGcOauuMFMlRSqa882qeCtrUTb-qariMtJ-6E=s200 "off.png")      ![enter image description here](https://lh3.googleusercontent.com/-Ovo5VMT4EU0/VkVIQEFPdJI/AAAAAAAAAL0/bQd3o-mGDT4/s200/on.jpg "on.jpg")

The LED will alternate between the above states in a frequency of 8 HZ.
 
 4. Dim
 
	 In Dim mode, the LED will produce at approximately 50% brightness. As the graph shown in below.
	 ![enter image description here](https://lh3.googleusercontent.com/-jbIPjkMWOP4/VkVLKf3fMKI/AAAAAAAAAMI/UQZiqt21ADA/s200/dim.png "dim.png")
	Pulse width modulation is used to generate dimming. In this bike light controller, we will use 50% duty cycle with a frequency of 32768 HZ, which is faster than the eye can see.

### FSM

The finite state machine is shown below:
![enter image description here](https://lh3.googleusercontent.com/-zflZh5_kvGA/VkiUNn2s2EI/AAAAAAAAATg/VVpZwfTMu7o/s0/fsm.png "fsm.png")

As we can see, the FSM contains for states, which corresponding to the four modes. And on each state, when a button is pressed, the FSM will change to the next state.

## Block Diagram

![enter image description here](https://lh3.googleusercontent.com/HpmnIADoj0Py4st7r5XCef9PF-LZJQfu8Q_W5FdzXZM=s0 "block diagram.png")

The entire control diagram has five major blocks: input conditioner, 4-stage ring counter, 12-bit up counter, LED driver and a clock with D Flip Flop.

 - Input conditioner buffers the noisy button input with the help of the clock, and outputs a one clock signal on the rising edge of the button

 - 4-stage ring counter store the current stage of the system. When the counter is enabled by the output of input conditioner, the ring counter will move the one-hot bit to the next stage. The output has four bits, indicating "Off", "On", "Blink" and "Dim" in order. We don't need the output bit for "Off", since when "Off" is high, all other inputs to the final OR gate will be 0. Same reason for "On", we don't need additional circuit other than the one hot output. The remaining two bits will AND with the their corresponding circuit, behaving as a circuit chooser.

 - 12-bit up counter is a counter that can count up to 2^11, and reset to 0 when overflow occurs. The output of the counter is its most significant bit. Therefore, the output will alternating between 1 and 0 at frequency of 16 HZ. However, it's not alternating evenly. The LED flashes yet only once every 1/16 sec

 - LED Driver amplifies a logic signal to a level that can electrically power the LED

 - The D Flip Flop buffers the clock(we cannot send clock directly to the MUX, which will gate the clock). By choosing buffered clock signal as an input to the LED driver, we can get a dimming light with 50% duty cycle in frequency of 32768 HZ. 



## Schematic

### 12-bit UP Counter

#### specification
The 12-bit up counter has 12 D Flip Flops. Every DFF connects ~Q back to its input D, and send ~Q as clk for the next DFF in sequence. The function of each DFF is to divide the frequency by two. So after 12 D Flip Flop, we have a frequency of 2^15/2^12 = 8 HZ. 

![enter image description here](https://lh3.googleusercontent.com/-hGsoDB9B7QY/VkeY_ByOHEI/AAAAAAAAAOA/G_mYUBtsB0I/s0/12-bit+counter.png "12-bit counter.png")

#### input and output
This device needs an input clock; its output is a clock signal but with a frequency 2^12 times slower than the input.

#### cost analysis 
![enter image description here](https://lh3.googleusercontent.com/-H1p0kHvBEOQ/VkfO7HTAbaI/AAAAAAAAAQo/FlUzJeBFy6g/s0/12-bit+up+counter.png "12-bit up counter_cost.png")



### Input Conditioner

#### specification
The input conditioner buffers the noisy button input with the help of the clock, and outputs a one clock signal on the rising edge of the button. Since we assume the noisy signal's length is about one millisecond. So the wait time(n) must satisfy formula 

> n*(1/clk) >= L

Given that clock value is 2^15 and length is 0.001, we get n*(1/2^15) >= 0.001, in which n should be greater than 32.768. So the n should be at least 33. 

In the top level, we have four DFFs: sync0, sync1, conditioned and posi-edge. The Conditioned wait till the counter reached 33 and then get the value of sycn1. And when Conditioned rise from 0 to 1, posi-edge will be triggered and output '1' for one clock cycle. 

Note that the '0' in the diagram actually holds 0 for 6 bits. When check 33 outputs '1', it will reset the counter and enable conditioned and posi-edge. If check 33 outputs '0', the counter will keeps increasing by 1 each clock cycle.

The 6-bit counter has the same implementation of the 12-bit up counter but has 6 bits and outputs all the 6 bits.

We will further discuss the implementation of the 6-bit adder and check 33 in the following sections.

![enter image description here](https://lh3.googleusercontent.com/-REucSxs8i0U/VkfEmXZE24I/AAAAAAAAAPE/_G8UxAU0UCM/s0/input_conditioner.png "input_conditioner.png")

#### input and output
This device needs a clock and a button input signal; its output is the value stored in the posi-edge DFF, which set '1' on the rising edge of the button input.

#### cost analysis 
![enter image description here](https://lh3.googleusercontent.com/-wVh4jSUowds/VkjUrzW2HEI/AAAAAAAAAVM/5MINuLC_UiA/s0/input_conditioner_cost.png "input_conditioner_cost.png")

### 1-bit Adder

#### specification
The 1-bit adder simply adds two bits and output sum and Cout.

![enter image description here](https://lh3.googleusercontent.com/-8oMGmMI3aNg/VkfImuGs__I/AAAAAAAAAPU/-k7rK3aXIyw/s0/1-bit+adder.png "1-bit adder.png")

#### input and output
This device needs two bits to add; its outputs are a 1-bit sum and a 1-bit Cout.

#### cost analysis
![enter image description here](https://lh3.googleusercontent.com/-GuPHqzi5sso/VkjPojPqLJI/AAAAAAAAAT0/Yl-WBcJuDvk/s0/1_bit_adder_cost.png "1_bit_adder_cost.png")



### 6-bit Adder

#### specification
The 6-bit adder simply adds 1 to a 6-bit number and outputs sum. Note in the diagram, 'A' is the input[0]. And the next input for the next 1-bit adder is intput[1] and so on. The Cout of each 1-bit adder is connected to the Cin of the next adder.

![enter image description here](https://lh3.googleusercontent.com/-3QJV6bbrp-w/VkfIrGdBSzI/AAAAAAAAAPg/uN5qICsOUek/s0/6-bit+adder.png "6-bit adder.png")

#### input and output
This device needs one 6-bit number and a '1'; its output is a 6-bit sum.

#### cost analysis
![enter image description here](https://lh3.googleusercontent.com/-COFHdKXcPUA/VkjPs1HdUTI/AAAAAAAAAUA/rbwb4R9IpVY/s0/6_bit_adder_cost.png "6_bit_adder_cost.png")


### Check 33

#### specification
Check 33 get sum[5] and sum[0], which respectively, are the bit represents 2^5 and 2^0. So when both of them becomes 1, check 33 will send 1 to the system and perform the reset job.

![enter image description here](https://lh3.googleusercontent.com/-Ah_6Pate6ng/VkfI0LxLlOI/AAAAAAAAAPs/rNRVL6PTJxc/s0/check_33.png "check_33.png")

#### input and output
This device needs two 1-bit inputs; its output is one control bit.  

#### cost analysis
![enter image description here](https://lh3.googleusercontent.com/-8DABwbjcwHM/VkjPzy1gNFI/AAAAAAAAAUM/GKhD8osALcQ/s0/check33_cost.png "check33_cost.png")

## Cost Estimation Model

By adding all the sub-components we've covered in the previous sections, we come up with the following cost table for the whole system(including the LED driver). 

![enter image description here](https://lh3.googleusercontent.com/-EBeGdtl9jwQ/VkjUwZC_9-I/AAAAAAAAAVk/GskVEldx-AA/s0/Total_cost.png "Total_cost.png")