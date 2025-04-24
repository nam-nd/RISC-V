module Reg_File(clk, rst, RegWrite, Rs1, Rs2, Rd, Write_data, read_data1, read_data2);

input clk, rst, RegWrite;
input [4:0] Rs1,Rs2, Rd;
input [31:0] Write_data;
output [31:0] read_data1, read_data2;

reg [31:0] Registers [31:0];

 initial begin
    Registers[0]  = 0;
    Registers[1]  = 5;
    Registers[2]  = 10;
    Registers[3]  = 22;
    Registers[4]  = 4;
    Registers[5]  = 5;
    Registers[6]  = 4;
    Registers[7]  = 20;
    Registers[8]  = 25;
    Registers[9]  = 12;
    Registers[10] = 26;
    Registers[11] = 7;
    Registers[12] = 32;
    Registers[13] = 45;
    Registers[14] = 5;
    Registers[15] = 5;
    Registers[16] = 33;
    Registers[17] = 21;
    Registers[18] = 43;
    Registers[19] = 60;
    Registers[20] = 30;
    Registers[21] = 10;
    Registers[22] = 5;
    Registers[23] = 45;
    Registers[24] = 37;
    Registers[25] = 23;
    Registers[26] = 4;
    Registers[27] = 35;
    Registers[28] = 10;
    Registers[29] = 33;
    Registers[30] = 5;
    Registers[31] = 10;
end

integer k;
always @(posedge clk) begin
    if (rst) begin
        for (k = 0; k < 32; k = k + 1) begin
            Registers[k] = 32'b00;
        end
    end
    else if (RegWrite && Rd != 5'b00000) begin  
        Registers[Rd] = Write_data;
    end
end

assign read_data1 = (Rs1 == 5'b00000) ? 32'b0 : Registers[Rs1];
assign read_data2 = (Rs2 == 5'b00000) ? 32'b0 : Registers[Rs2];

endmodule