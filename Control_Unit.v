module Control_Unit( opcode, RegWrite, MemRead, MemWrite, MemToReg, ALUSrc, Branch, ALUOp );
    input [6:0] opcode;      
    output reg RegWrite;         
    output reg MemRead;         
    output reg MemWrite;         
    output reg MemToReg;        
    output reg ALUSrc;                    
    output reg Branch;                        
    output reg [1:0] ALUOp;       

    always @(*) begin
        case (opcode)
            7'b0110011:  // R-type 
            begin  
                ALUSrc <= 1'b0;
                MemToReg <= 1'b0; 
                RegWrite <= 1'b1; 
                MemRead <= 1'b0; 
                MemWrite <= 1'b0;
                Branch <= 1'b0; 
                ALUOp <= 2'b10;
            end
            7'b0000011:  // I-type 
            begin
                ALUSrc   <= 1'b1;
                MemToReg <= 1'b0;
                RegWrite <= 1'b1;
                MemRead  <= 1'b0;
                MemWrite <= 1'b0;
                Branch   <= 1'b0;
                ALUOp    <= 2'b10;
            end
            7'b0000011:   // Load 
            begin
                ALUSrc   <= 1'b1;
                MemToReg <= 1'b1;
                RegWrite <= 1'b1;
                MemRead  <= 1'b1;
                MemWrite <= 1'b0;
                Branch   <= 1'b0;
                ALUOp    <= 2'b00;
            end
            7'b0100011:   // Store 
            begin
                ALUSrc   <= 1'b1;
                MemToReg <= 1'b0;
                RegWrite <= 1'b0;
                MemRead  <= 1'b0;
                MemWrite <= 1'b1;
                Branch   <= 1'b0;
                ALUOp    <= 2'b00;
            end
            7'b1100011:   // Branch 
            begin
                ALUSrc   <= 1'b0;
                MemToReg <= 1'b0;
                RegWrite <= 1'b0;
                MemRead  <= 1'b0;
                MemWrite <= 1'b0;
                Branch   <= 1'b1;
                ALUOp    <= 2'b11;
            end 
            7'b1101111:   // Jump 
            begin
                ALUSrc   <= 1'b0;
                MemToReg <= 1'b0;
                RegWrite <= 1'b1;
                MemRead  <= 1'b0;
                MemWrite <= 1'b0;
                Branch   <= 1'b0;
                ALUOp    <= 2'b10;
            end
            default: 
            begin 
                ALUSrc   <= 1'b0;
                MemToReg <= 1'b0;
                RegWrite <= 1'b0;
                MemRead  <= 1'b0;
                MemWrite <= 1'b0;
                Branch   <= 1'b0;
                ALUOp    <= 2'b00;
            end
        endcase
    end

endmodule