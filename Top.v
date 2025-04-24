module Top(input clk, rst); 

wire [31:0] pc_out_top, pc_next_top, pc_top, instruction, read_data1, read_data2, WB_top, branch_target, immgen_top,muxtoAlu,read_data_top,WB_data_top;
wire RegWrite,ALUSrc, MemRead,MemWrite,MemToReg,Branch,Zero;
wire [1:0] ALUOp_top;
wire [3:0] ALUcontrol_top;

    // Program Counter
    PC PC(
        .clk(clk),
        .rst(rst),
        .pc_in(pc_top),
        .pc_out(pc_out_top));
    // PC Adder
    PC_Adder PC_Adder(
        .pc_in(pc_out_top),
        .pc_next(pc_next_top));
    // PC Mux
    PC_Mux PC_Mux(
        .pc_in(pc_next_top),
        .pc_branch(branch_target),
        .pc_select(Branch&Zero),
        .pc_out(pc_top));
    // Instruction Memory
    Inst_Mem Instr_Mem(
        .rst(rst),
        .clk(clk),
        .read_address(pc_out_top),
        .instruction_out(instruction));
    // Register File
    Reg_File Reg_File(
        .rst(rst), 
        .clk(clk), 
        .RegWrite(RegWrite), 
        .Rs1(instruction[19:15]), 
        .Rs2(instruction[24:20]), 
        .Rd(instruction[11:7]), 
        .Write_data(WB_data_top), 
        .read_data1(read_data1), 
        .read_data2(read_data2));
    // Control Unit
    Control_Unit Control_Unit(
        .opcode(instruction[6:0]),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .ALUOp(ALUOp_top));
    // ALU_Control
    ALU_Control ALU_Control(
        .funct3(instruction[14:12]),
        .funct7(instruction[31:25]),
        .ALUOp(ALUOp_top),
        .ALUcontrol_Out(ALUcontrol_top));
    // ALU
    ALU ALU(
        .A(read_data1),
        .B(muxtoAlu),
        .ALUcontrol_In(ALUcontrol_top),
        .Result(WB_top),
        .Zero(Zero));
    // Immediate Generator
    Imm_Gen Imm_Gen(
        .instruction(instruction),
        .imm_out(immgen_top));
    // ALU Mux
    MUX Imm_Mux(
        .input0(read_data2),
        .input1(immgen_top),
        .select(ALUSrc),
        .out(muxtoAlu));
    // Data Memory
    Data_Mem Data_Mem(
        .clk(clk),
        .rst(rst),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(WB_top),
        .write_data(read_data2),
        .read_data(read_data_top));
    //WB Mux
    MUX_DataMemory WB_Mux(
        .input0(WB_top),
        .input1(read_data_top),
        .select(MemToReg),
        .out(WB_data_top));
    //Branch_Adder
    Branch_Adder Branch_Adder(
        .PC(pc_out_top), 
        .offset(immgen_top), 
        .branch_target(branch_target));

endmodule