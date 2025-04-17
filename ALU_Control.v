module ALU_Control(funct3, funct7, ALUOp, ALUcontrol_Out);    
    input [2:0] funct3;       
    input [6:0]funct7;       
    input [1:0] ALUOp;          
    output reg [3:0] ALUcontrol_Out; 

always @(*) begin
  case ({ALUOp, funct7, funct3})
    12'b10_0000000_000 : ALUcontrol_Out <= 4'b0010;    // ADD 
    12'b00_0000000_000 : ALUcontrol_Out <= 4'b0010;    // ADD 
    12'b00_0000000_001 : ALUcontrol_Out <= 4'b0010;    // ADD 
    12'b00_0000000_010 : ALUcontrol_Out <= 4'b0010;    // ADD 
    12'b10_0100000_000 : ALUcontrol_Out <= 4'b0001;    // SUB 
    12'b01_0000000_000 : ALUcontrol_Out <= 4'b0110;    // SUB
    12'b10_0000000_111 : ALUcontrol_Out <= 4'b0000;    // AND
    12'b10_0000000_110 : ALUcontrol_Out <= 4'b0001;    // OR
    default            : ALUcontrol_Out <= 4'b0000; 
  endcase
end


endmodule
