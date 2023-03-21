# VEDA-Verilog-Memory
This a Verilog implementation of a memory called VEDA for course CS220 at IIT Kanpur.
VEDA a single port memory of dimension 32 × 32. This means that
the depth of the memory is 32 and the width of the memory is 32 bits. A block diagram of this memory
is shown in Figure 1. This memory operates into two different modes: scribble when mode=0 and interpret
when mode=1. In scribble mode, the input data is written to the memory and driven on the data output. In
interpret mode, the data previously written in the memory will be provided the output. In both the cases,
the data will appear at the output port after one clock cycle delay of providing address value.
![veda_mem](https://user-images.githubusercontent.com/95034003/226749023-842df0df-f7aa-40c0-830b-4205193fd17d.PNG)
