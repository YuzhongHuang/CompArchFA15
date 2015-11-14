# Bike Light Controller Specification Document

### Yuzhong Huang

## Overview

A bike light controller in the document controls one single LED in bike light. This bike light should have four modes:  Off, On, Blinking, and Dim (On at approximately 50% brightness). It cycles through the modes by pressing a single button.

## Inputs and Outputs

The input for the bike light is a single button. When the button is pressed(the system will react on the rising edge of the button input), the bike light will change to the next mode in order of Off, On, Blinking and Dim.

The output of the bike light is a single LED that produces light when power is applied. 

## Modes

 1. Off

	Off mode	simply cuts off the power and the LED should not produce any light. As shown in the following graph.

	![enter image description here](https://lh3.googleusercontent.com/C4PX3fGGcOauuMFMlRSqa882qeCtrUTb-qariMtJ-6E=s200 "off.png") 

 2. On

	On mode turns on the power and the LED light up. As shown in the following graph.

	![enter image description here](https://lh3.googleusercontent.com/-Ovo5VMT4EU0/VkVIQEFPdJI/AAAAAAAAAL0/bQd3o-mGDT4/s200/on.jpg "on.jpg")

 3. Blink

	When the bike light is in Blink mode, the system will produce a blinking light with a frequency of 10 HZ to naked eyes. As shown in the following graph.
			![enter image description here](https://lh3.googleusercontent.com/C4PX3fGGcOauuMFMlRSqa882qeCtrUTb-qariMtJ-6E=s200 "off.png")      ![enter image description here](https://lh3.googleusercontent.com/-Ovo5VMT4EU0/VkVIQEFPdJI/AAAAAAAAAL0/bQd3o-mGDT4/s200/on.jpg "on.jpg")

	The LED will alternate between the above states in a frequency of 10 HZ.
 4. Dim
 
	 In Dim mode, the LED will produce at approximately 50% brightness. As the graph shown in below.
	 ![enter image description here](https://lh3.googleusercontent.com/-jbIPjkMWOP4/VkVLKf3fMKI/AAAAAAAAAMI/UQZiqt21ADA/s200/dim.png "dim.png")

## FSM

The finite state machine is shown below:
![enter image description here](https://lh3.googleusercontent.com/-cr0QzytSkHw/VkVLqjpSxNI/AAAAAAAAAMg/cvZE_fi3_to/s600/fsm.png "fsm.png")

As we can see, the FSM contains for states, which corresponding to the four modes. And on each state, when a button is pressed, the FSM will change to the next state.

