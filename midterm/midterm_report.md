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

	When the bike light is in Blink mode, the system will produce a blinking light with a frequency of 16 HZ. As shown in the following graph.
			![enter image description here](https://lh3.googleusercontent.com/C4PX3fGGcOauuMFMlRSqa882qeCtrUTb-qariMtJ-6E=s200 "off.png")      ![enter image description here](https://lh3.googleusercontent.com/-Ovo5VMT4EU0/VkVIQEFPdJI/AAAAAAAAAL0/bQd3o-mGDT4/s200/on.jpg "on.jpg")

	The LED will alternate between the above states in a frequency of 16 HZ.
 4. Dim
 
	 In Dim mode, the LED will produce at approximately 50% brightness. As the graph shown in below.
	 ![enter image description here](https://lh3.googleusercontent.com/-jbIPjkMWOP4/VkVLKf3fMKI/AAAAAAAAAMI/UQZiqt21ADA/s200/dim.png "dim.png")
	Pulse width modulation is used to generate dimming. In this bike light controller, we will use 50% duty cycle with a frequency of 32768 HZ, which is faster than the eye can see.

#### signal chart
	
The signal chart of the four modes are shown below:

![enter image description here](https://lh3.googleusercontent.com/-83BCxO8T_7E/VkeLMWzD5yI/AAAAAAAAANM/c7lLgc30nVg/s600/diagram_part1.png "diagram_part1.png")

![enter image description here](https://lh3.googleusercontent.com/-U4TThUbYP54/VkeLTrBWDOI/AAAAAAAAANY/l7WUGOlMEok/s600/diagram_part2.png "diagram_part2.png")

Note that there is only one built-in clock, but we have a 12-bit counter that divides the frequency by 2^11, therefore having a clock of 16 HZ.
	
### FSM

The finite state machine is shown below:
![enter image description here](https://lh3.googleusercontent.com/-cr0QzytSkHw/VkVLqjpSxNI/AAAAAAAAAMg/cvZE_fi3_to/s600/fsm.png "fsm.png")

As we can see, the FSM contains for states, which corresponding to the four modes. And on each state, when a button is pressed, the FSM will change to the next state.

## Block Diagram

![enter image description here](https://lh3.googleusercontent.com/--059uwiZXxM/VkeuNyF-v_I/AAAAAAAAAOc/g4OA9S0M5_Q/s0/Block+Diagram.png "Block Diagram.png")
## Schematic

![enter image description here](https://lh3.googleusercontent.com/-hGsoDB9B7QY/VkeY_ByOHEI/AAAAAAAAAOA/G_mYUBtsB0I/s0/12-bit+counter.png "12-bit counter.png")

![enter image description here](https://lh3.googleusercontent.com/-REucSxs8i0U/VkfEmXZE24I/AAAAAAAAAPE/_G8UxAU0UCM/s0/input_conditioner.png "input_conditioner.png")

![enter image description here](https://lh3.googleusercontent.com/-8oMGmMI3aNg/VkfImuGs__I/AAAAAAAAAPU/-k7rK3aXIyw/s0/1-bit+adder.png "1-bit adder.png")

![enter image description here](https://lh3.googleusercontent.com/-3QJV6bbrp-w/VkfIrGdBSzI/AAAAAAAAAPg/uN5qICsOUek/s0/6-bit+adder.png "6-bit adder.png")

![enter image description here](https://lh3.googleusercontent.com/-Ah_6Pate6ng/VkfI0LxLlOI/AAAAAAAAAPs/rNRVL6PTJxc/s0/check_33.png "check_33.png")

## Cost Estimation Model

![enter image description here](https://lh3.googleusercontent.com/-bLLvhjX0Uow/VkfOv_bFFoI/AAAAAAAAAQU/KkS9fu6geTM/s0/1-bit+adder.png "1-bit adder_cost.png")

![enter image description here](https://lh3.googleusercontent.com/-SIYSMVjc_FY/VkfO2s869vI/AAAAAAAAAQc/8fkhzjavdls/s0/6-bit+adder.png "6-bit adder_cost.png")

![enter image description here](https://lh3.googleusercontent.com/-H1p0kHvBEOQ/VkfO7HTAbaI/AAAAAAAAAQo/FlUzJeBFy6g/s0/12-bit+up+counter.png "12-bit up counter_cost.png")

![enter image description here](https://lh3.googleusercontent.com/-ULcMO1jb1Ik/VkfPDrwhTBI/AAAAAAAAAQ4/4CNtTpbF--g/s0/check_33.png "check_33_cost.png")

![enter image description here](https://lh3.googleusercontent.com/-lqdOTVNXUVU/VkfPICdrqbI/AAAAAAAAARE/tGagX1Dg7As/s0/input_conditioner.png "input_conditioner_cost.png")

![enter image description here](https://lh3.googleusercontent.com/-tjW6gGs_53E/VkfPNO-3PCI/AAAAAAAAARQ/pO4lMMePkhQ/s0/whole+system.png "whole_system_cost.png")