`timescale 1ns/1ps

module Control_Unit_tb;
    // Inputs
    reg [6:0] opcode;
    
    // Outputs
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire MemToReg;
    wire ALUSrc;
    wire Branch;
    wire [1:0] ALUOp;
    
    // Instantiate the Unit Under Test (UUT)
    Control_Unit uut (
        .opcode(opcode),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUSrc(ALUSrc),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );
    
    initial begin
        // Initialize Inputs
        opcode = 0;
        
        // Monitor changes
        $monitor("Time=%0t opcode=%7b | RegWrite=%b MemRead=%b MemWrite=%b MemToReg=%b ALUSrc=%b Branch=%b ALUOp=%2b",
                 $time, opcode, RegWrite, MemRead, MemWrite, MemToReg, ALUSrc, Branch, ALUOp);
        
        // Test case 1: R-type instruction
        $display("\nTest 1: R-type instruction");
        opcode = 7'b0110011;
        #10;
        
        // Test case 2: I-type instruction
        $display("\nTest 2: I-type instruction");
        opcode = 7'b0010011;
        #10;
        
        // Test case 3: Load instruction
        $display("\nTest 3: Load instruction");
        opcode = 7'b0000011;
        #10;
        
        // Test case 4: Store instruction
        $display("\nTest 4: Store instruction");
        opcode = 7'b0100011;
        #10;
        
        // Test case 5: Branch instruction
        $display("\nTest 5: Branch instruction");
        opcode = 7'b1100011;
        #10;
        
        // Test case 6: Jump instruction
        $display("\nTest 6: Jump instruction");
        opcode = 7'b1101111;
        #10;
        
        // Test case 7: Default case
        $display("\nTest 7: Default case");
        opcode = 7'b1111111;
        #10;
        
        $display("\nAll tests completed");
        $finish;
    end
endmodule