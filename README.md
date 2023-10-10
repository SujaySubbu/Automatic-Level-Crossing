# Automatic-Level-Crossing
**Inputs:**
The inputs to be fed to the FPGA are to be read from a mechanical axle counter. The rough diagram of the axle counter is shown below.

 ![input](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/1afa3319-3116-4f18-ad27-42b14eb5a9c6)
 
The axle counter is attached to the rail of the track. Let us name the left axle as “a” and the right axle as “b”. There are two directions of motion possible – a to b and b to a.

When the wheel of the bogey moves from a to b, first a goes down followed by b. After that state (both pressed down), a goes up followed by b.
Similarly, when the wheel of the bogey moves from b to a, first b goes down and then a. After that state (both pressed down), a goes up followed by b.

The following table can easily represent this kind of input:

| a | b | Description |
| ------------- | ------------- | ------------- |
| 0	| 0	| Both axle a and b are up, i.e. there is no wheel on the sensor	|
| 0	| 1	| b is pressed while a is up	|
| 1	| 0	| a is pressed while b is up	|
| 1	| 1	| Both a and b are pressed	|

![inputs](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/11ce18b0-62a6-4537-8f67-6b42fdef601e)

**Outputs:**
The desirable output is if the gate at the level crossing must be open or closed. This is represented by gate_open output port in the code. If the value is 1, it means that the gate must be kept open. Else, it must be kept closed. The other outputs include the counts of the bogeys passing through a given point. All the outputs are displayed using VIO.

**FSM_Wheel:**
FSM_Wheel is the most basic unit of the design. The main purpose of the module is to check if a wheel has passed over the axle counter and if so, notify in which direction has the wheel passed (a to b or b to a).
The module has 4 inputs – Clk, Reset, a and b. Clk is the clock and Reset reinitializes the state of the FSM to S0. Inputs a and b is the input from the sensor. The behavior of the inputs a and b is described in Table 1. These two determine the states in the FSM.
There are certain inputs which are invalid. For example, when the state is in S2 (10 -> 11), then if we give an input of 00, it is an infeasible case. So in such cases, we bring the state back to itself.
Another case is when we apply the same input as the input which was used to get to that state. For example, when the state is in S2 (10 -> 11) and we again give an input of 11, even in these cases, the state should go back to itself.
The module has 2 output ports – a2b and b2a. a2b is high when a wheel has passed in the direction a to b. b2a is high when a wheel has passed in the direction b to a.
S4 and Q4 are the final states. After reaching this state, a2b or b2a respectively get incremented.
 
Below is the diagram of the FSM. State transition depends on the values of input signals a and b. The first value in the pair represents signal a and the second represents signal b. The FSM can be thought of as a sequence detector.
The sequence for a wheel moving from a to b is as follows:
00 <-> 10 <-> 11 <-> 01 <-> 00
The sequence for a wheel moving from b to a is as follows:
00 <-> 01 <-> 11 <-> 10 <-> 00
Notice that double sided arrows are used in the above expressions. This is because the wheel reverses direction (from a to b -> b to a and vice versa) if the train stops and reverses its direction when on the counter

![FSM](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/a38b4b12-a43f-4486-9ec5-f884c29f040c)

Here, the output generated is a pulse of one clock cycle indicating if the wheel has moved completely in the direction from a to b or b to a. The outputs of this FSM are taken as inputs for Bogey_counter. Below is the table of outputs.

| State | a2b | b2a | Description |
| ------------- | ------------- | ------------- | ------------- |
| S4	| 1	| 0	| The wheel has moved completely in the direction a to b	|
| Q4	| 0	| 1	| The wheel has moved completely in the direction b to a	|
| Otherwise	| 0	| 0	| The wheel has not completely moved over the sensor	|

**Bogey_counter:**
The bogey counter counts the number of bogeys that have passed over the counter. The inputs of bogey_counter (a2b, b2a, Count_a2b and Count_b2a) are the outputs of FSM_Wheel. Here, it is assumed that each bogey has 4 wheels on either side. Therefore, 4 pulses in the same direction would imply that a bogey has completely passed over the counter. The module outputs two registers (Count_a and Count_b) to keep track of the number of bogies that have passed in both the directions. The count value is the input to the level_crossing module. We consider a case when a2b is not 0 (a wheel has passed from a2b) and Count_b is not 0 (a few wheels have already passed from b to a). This means that initially, train has been moving from b to a but now has reversed directions and is moving from a to b. So for this case we decrement Count_b2a. If Count_a is not 0 (a few wheels have already passed from a to b) and a2b is not 0, then we simply increment Count_a. If Count_a is equal to 4, this means the bogey has completely passed the counter. So in this case, we increment Count_a2b and reset Count_a and Count_b to 0.
 
**Level_crossing:**

![level](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/7fa23eda-7853-477f-9712-7f48dda70237)

The level_crossing module determines if the level crossing needs to be open or closed based on the number of bogeys that have passed over the counters. One counter is placed when the train enters the level crossing, and another counter is placed at the exit. Values of these two counters are used to determine the state of the gate (open or closed). We want the level crossing to close when the number of bogies passing the counter is 8 and open otherwise. The inputs of level_crossing (Count_a2b_1, Count_b2a_1, Count_a2b_2 and Count b2a_2) are the outputs of Bogey_Counter. First case we consider is when the train has passed completely through both counters a2b_1 and a2b_2. In this case the gate will be open as the train has fully passed. Second, we consider a case when the train has passed through a2b_1 but not through a2b_2. In this case we keep the gate closed as the train is still passing through. Similarly, we take the cases for b2a_1 and b2a_2.
 
**Results:**

**Simulation Waveform:**

![Output](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/c6e69c9d-57a9-4819-a5f8-2e1ff50e8de9)

**RTL Schematic:**

![Schem](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/5a62fa0c-df27-4c97-a475-d9c4f6b9d5ed)

**Post Synthesis Utilization Summary:**

![Psot](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/89865b9e-eee6-43b1-9b27-792dd01180af)

**Post Implementation Utilization Summary:**

![Post](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/d3165214-d129-46c5-bfd5-220499eacb6f)

**Post Synthesis Power Utilization:**

![Power_util](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/0415a8f6-e56a-40fa-a66d-869a4223a9a6)

**Post Implementation Power Utilization:**

![Post_power](https://github.com/SujaySubbu/Automatic-Level-Crossing/assets/134432333/a7dc7f69-6105-44aa-867e-1c09f18611c7)

