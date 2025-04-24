`timescale 1ns/1ps

module Imm_Gen_tb;
    // Inputs
    reg [31:0] instruction;
    
    // Outputs
    wire [31:0] imm_out;
    
    // Instantiate the Unit Under Test (UUT)
    Imm_Gen uut (
        .instruction(instruction),
        .imm_out(imm_out)
    );
    
    initial begin
        // Initialize Inputs
        instruction = 0;
        
        // Monitor changes
        $monitor("Time=%0t Instruction=%8h | Imm_out=%8h", $time, instruction, imm_out);
        
        // Test case 1: I-type instruction
        $display("\nTest 1: I-type instruction");
        instruction = 32'hF1230493; // ADDI x9, x6, -239
        #10;
        
        // Test case 2: Load-type instruction
        $display("\nTest 2: Load-type instruction");
        instruction = 32'h00412083; // LW x1, 4(x2)
        #10;
        
        // Test case 3: Store-type instruction
        $display("\nTest 3: Store-type instruction");
        instruction = 32'h00512223; // SW x5, 4(x2)
        #10;
        
        // Test case 4: B-type instruction
        $display("\nTest 4: B-type instruction");
        instruction = 32'hFE0426E3; // BEQ x4, x0, -20
        #10;
        
        // Test case 5: J-type instruction
        $display("\nTest 5: J-type instruction");
        instruction = 32'h004000EF; // JAL x1, 4
        #10;
        
        // Test case 6: Default case
        $display("\nTest 6: Default case");
        instruction = 32'h00000000; // Invalid opcode
        #10;
        
        $display("\nAll tests completed");
        $finish;
    end
endmodule