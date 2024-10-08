# Pipelined RISC-V Processor

Design and implementation of RISC-V processor with a pipelined datapath, controller, and hazard unit.
## Commands

```ruby
R_Type:  add, sub, and, or, slt
```
```ruby
I_Type:  lw, addi, xori, ori, slti, jalr
```
```ruby
S_Type:  sw
```
```ruby
J_Type:  jal
```
```ruby
B_Type:  beq, bne, blt, bge
```
```ruby
U_Type:  lui
```
## Datapath
<img src="./doc/Datapath.png">

## Controller
<img src="./doc/CONT.jpg">

### Immediate Extension Unit Controller
<img src="./doc/Imm_Ext.jpg">

### ALU Opcode Controller
<img src="./doc/ALU_OP.jpg">

### ALU Controller
<img src="./doc/ALU_CONT.jpg">

## Hazard Unit
<img src="./doc/hazard.png">

## Test Code
The following assembly code can be converted to machine code using [RISC-V Online Assembler](https://riscvasm.lucasteske.dev/#).

```ruby
addi X7,X0,16;
addi X8,X0,30;
sub X9,X8,X7;
and X10,X8,X7;
or X11,X8,X7;
slt X12,X8,X7;
xori X13,X7,13;
ori X14,X7,13;
slti X15,X7,13;
sw X8,400(x7);
lui X17,60;
jalr X16,X7,10;

```
## Course Description
- **Course**: Digital Systems 2 [ECE 778]
- **Semester**: Spring 2023
- **Institution:** [School of Electrical & Computer Engineering](https://ece.ut.ac.ir/en/), [College of Engineering](https://eng.ut.ac.ir/en), [University of Tehran](https://ut.ac.ir/en)
- **Instructors:** Dr. Safari
- **Contributors:** [Fardin Abbasi](https://github.com/fardinabbasi/Laplace_Transform), Soheil Abdollahi
