# MIPS-CPU

Module
a. TestBench module
“TestBench” is not a part of CPU, it is a file that controls all the program and verify the
correctness of our CPU. The main features are: send periodical signal CLK to CPU, set the initial value of Reg and DM, print the value of Reg and DM at each cycle, finish the program.
The initial value are Reg[i]=0, DM[i]=0, (i=0~7).

b. CPU module
Here are new wires:
PC_In represents Program Counter input
PC_Out represents Program Counter Output
Jump represents the instruction is j or not
Branch represents the instruction is beq or not
Jump_Address represents the PC value of the target. PC_Count_Add_Src1 represents the input of PC_Count_Adder PC_Count_Add_Src2 represents the input of PC_Count_Adder PC_Count_Add_Result represents the output of PC_Count_Adder Branch_Add_Src1 represents the input of Branch_Adder Branch_Add_Src2 represents the input of Branch_Adder Branch_Add_Result represents the output of Branch_Adder Branch_Select represents the control signal of MUX_Branch 
 
c. PC module
“PC” is the abbreviation of “Program Counter”. It is responsible for controlling next instruction ready to be executed. PC_In will assign to PC_Out in the end of every cycle.

d. IM module
“IM” is the abbreviation of “Instruction Memory”. This module saves all the instructions and send the instructions to CPU according to PC.

e. Reg module
“Reg” is Register module. It will read or write data according to input signals. The name of wires please refer to CPU module.

f. DM module
Same as Reg, but the target here is Data Memory.
Real memory is continuous spaces using byte as unit, but in order to easily implement this lab, we use what we use in Reg to simulate DM. That is using 16 bits as a unit to represent memory and use “grid” (DM[0] is a grid, DM[1] is a grid...) as continuous spaces.

g. Decoder module
Decoder is the module decodes signal according to OP code that passed in. Signals are send to each module for them to know what they should do.

h. ALU_ctrl module
Input ALU_OP and Funct and use these two input to ouput ALU_CTRL.

i. MUX_2_to_1 module
Choose the output according to select signal.

j. sign_extend module
Extend the immediate_in(14 bits) to 16bits but don’t change its sign.

k. ALU module
Perform the operation according to ALU_CTRL from ALU_ctrl module.

l. Add module
A normal Adder.
