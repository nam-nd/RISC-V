`timescale 1ns / 1ps

module ALU_tb;
    // Inputs
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALUcontrol_In;
    
    // Outputs
    wire [31:0] Result;
    wire Zero;
    
    // Instantiate the Unit Under Test (UUT)
    ALU uut (
        .A(A),
        .B(B),
        .ALUcontrol_In(ALUcontrol_In),
        .Result(Result),
        .Zero(Zero)
    );
    
    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;
        ALUcontrol_In = 0;
        
        // Wait 100 ns for global reset to finish
        #100;
        
        // Test case 1: ADD operation
        $display("Test 1: ADD");
        A = 32'h00000005;
        B = 32'h00000003;
        ALUcontrol_In = 4'b0000;
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 2: SUB operation
        $display("\nTest 2: SUB");
        A = 32'h00000005;
        B = 32'h00000003;
        ALUcontrol_In = 4'b0001;
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 3: AND operation
        $display("\nTest 3: AND");
        A = 32'h0000FFFF;
        B = 32'hFFFF0000;
        ALUcontrol_In = 4'b0010;
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 4: OR operation
        $display("\nTest 4: OR");
        A = 32'h0000FFFF;
        B = 32'hFFFF0000;
        ALUcontrol_In = 4'b0011;
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 5: XOR operation
        $display("\nTest 5: XOR");
        A = 32'h0000FFFF;
        B = 32'hFFFF0000;
        ALUcontrol_In = 4'b0100;
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 6: SLL operation
        $display("\nTest 6: SLL");
        A = 32'h00000001;
        B = 32'h00000004;
        ALUcontrol_In = 4'b0101;
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 7: SRL operation
        $display("\nTest 7: SRL");
        A = 32'h80000000;
        B = 32'h00000004;
        ALUcontrol_In = 4'b0110;
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 8: SRA operation
        $display("\nTest 8: SRA");
        A = 32'h80000000;
        B = 32'h00000004;
        ALUcontrol_In = 4'b0111;
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 9: SLT operation
        $display("\nTest 9: SLT");
        A = 32'h00000005;
        B = 32'h0000000A;
        ALUcontrol_In = 4'b1000;
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 10: Zero flag test
        $display("\nTest 10: Zero flag");
        A = 32'h00000000;
        B = 32'h00000000;
        ALUcontrol_In = 4'b0001; // SUB
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        // Test case 11: Default case
        $display("\nTest 11: Default case");
        A = 32'h12345678;
        B = 32'h87654321;
        ALUcontrol_In = 4'b1111; // Invalid control
        #10;
        $display("A = %h, B = %h, ALUcontrol = %b, Result = %h, Zero = %b", 
                A, B, ALUcontrol_In, Result, Zero);
        
        $display("\nAll tests completed");
        $finish;
    end
endmodule