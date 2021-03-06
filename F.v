`include "defines.v"
module F(
    input   wire                clk,
    input   wire                rst,
    input   wire                F_stall_i,
    input   wire[`NIBBLE]       f_icode_i,
    input   wire[`WORD]         f_valC_i,
    input   wire[`WORD]         f_valP_i,
    output  reg[`WORD]          F_predPC_o
);

    initial F_predPC_o <= `ZEROWORD;
    always @ (posedge clk) begin
        if (rst == `DISABLE && F_stall_i != `ENABLE) begin
            if( f_icode_i == `IJXX || f_icode_i == `ICALL ) 
                F_predPC_o  <=      f_valC_i;
            else
                F_predPC_o  <=      f_valP_i;
        end
    end
endmodule
