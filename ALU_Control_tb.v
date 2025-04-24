`timescale 1ns / 1ps

module ALU_Control_tb;
    // Inputs
    reg [2:0] funct3;
    reg [6:0] funct7;
    reg [1:0] ALUOp;
    
    // Outputs
    wire [3:0] ALUcontrol_Out;
    
    // Instantiate the Unit Under Test (UUT)
    ALU_Control uut (
        .funct3(funct3),
        .funct7(funct7),
        .ALUOp(ALUOp),
        .ALUcontrol_Out(ALUcontrol_Out)
    );
    
    initial begin
        // Initialize Inputs
        funct3 = 0;
        funct7 = 0;
        ALUOp = 0;
        
        // Monitor changes
        $monitor("Time = %t, ALUOp = %b, funct7 = %b, funct3 = %b, ALUcontrol = %b", 
                $time, ALUOp, funct7, funct3, ALUcontrol_Out);
        
        // Test case 1: ADD (R-type)
        $display("\nTest 1: ADD (R-type)");
        ALUOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b000;
        #10;
        
        // Test case 2: ADD (I-type)
        $display("\nTest 2: ADD (I-type)");
        ALUOp = 2'b00;
        funct7 = 7'b0000000;
        funct3 = 3'b000;
        #10;
        
        // Test case 3: SUB
        $display("\nTest 3: SUB");
        ALUOp = 2'b10;
        funct7 = 7'b0100000;
        funct3 = 3'b000;
        #10;
        
        // Test case 4: AND
        $display("\nTest 4: AND");
        ALUOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b111;
        #10;
        
        // Test case 5: OR
        $display("\nTest 5: OR");
        ALUOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b110;
        #10;
        
        // Test case 6: XOR
        $display("\nTest 6: XOR");
        ALUOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b100;
        #10;
        
        // Test case 7: SLL
        $display("\nTest 7: SLL");
        ALUOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b001;
        #10;
        
        // Test case 8: SRL
        $display("\nTest 8: SRL");
        ALUOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b101;
        #10;
        
        // Test case 9: SRA
        $display("\nTest 9: SRA");
        ALUOp = 2'b10;
        funct7 = 7'b0100000;
        funct3 = 3'b101;
        #10;
        
        // Test case 10: SLT
        $display("\nTest 10: SLT");
        ALUOp = 2'b10;
        funct7 = 7'b0000000;
        funct3 = 3'b010;
        #10;
        
        // Test case 11: Default case
        $display("\nTest 11: Default case");
        ALUOp = 2'b11;
        funct7 = 7'b1111111;
        funct3 = 3'b111;
        #10;
        
        $display("\nAll tests completed");
        $finish;
    end
endmodule