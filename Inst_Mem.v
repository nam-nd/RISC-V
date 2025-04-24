module Inst_Mem(rst, clk, read_address, instruction_out);

input rst, clk;
input [31:0] read_address;
output [31:0] instruction_out;
reg [31:0] I_Mem [63:0];  
integer k;
assign instruction_out = I_Mem[read_address];

always @(posedge clk or posedge rst)
begin
    if (rst) begin
        for (k = 0; k < 64; k = k + 1) begin 
            I_Mem[k] = 32'b00;  
        end
    end else begin
        
    // R-type
    I_Mem[0]  = 32'b00000000000000000000000000000000;  // no operation
    I_Mem[4]  = 32'b0000000_11001_11000_000_01101_0110011;  // add x13, x24, x25
    I_Mem[8]  = 32'b0100000_00111_01000_000_00101_0110011;  // sub x5, x7, x8
    I_Mem[12] = 32'b0000000_00010_00011_111_00001_0110011;  // and x1, x2, x3
    I_Mem[16] = 32'b0000000_00101_00011_110_00100_0110011;  // or x5, x3, x4
    // I-type
    I_Mem[20] = 32'b000000000011_10101_000_10110_0010011;  // addi x22, x21, 31
    // L-type
    I_Mem[24] = 32'b000000011111_00101_010_01000_0000011;  // lw x8, 15(x5)
    // S-type
    I_Mem[28] = 32'b0000000_01111_00101_010_01100_0100011;  // sw x15, 12(x5)
    // SB-type
    I_Mem[32] = 32'b0000000_01001_01001_000_01100_1100011;  // beq x9, x9, 12
    
    end
end

endmodule
