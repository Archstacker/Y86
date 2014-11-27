`include "defines.v"
module id_ex(
	input	wire			clk,
	input	wire			rst,
	input	wire			E_bubble_i,

	input	wire[`NIBBLE]	id_icode,
	input	wire[`NIBBLE]	id_ifun,
	input	wire[`WORD]		id_valA,
	input	wire[`WORD]		id_valB,
	input	wire[`WORD]		id_valC,
	input	wire[`WORD]		id_valP,
    input	wire[`NIBBLE]	id_dstE,
    input	wire[`NIBBLE]	id_dstM,

	output	reg[`NIBBLE]	ex_icode,
	output	reg[`NIBBLE]	ex_ifun,
	output	reg[`WORD]		ex_valA,
	output	reg[`WORD]		ex_valB,
	output	reg[`WORD]		ex_valC,
	output	reg[`WORD]		ex_valP,
    output	reg[`NIBBLE]	ex_dstE,
    output	reg[`NIBBLE]	ex_dstM
);

	always @ (posedge clk) begin
		if( E_bubble_i==`ENABLE ) begin
			ex_icode	<=	`INOP;
			ex_dstE		<=	`RNONE;
			ex_dstM		<=	`RNONE;
		end
		else begin
			ex_icode	<=	id_icode;
			ex_ifun		<=	id_ifun;
			ex_valA		<=	id_valA;
			ex_valB		<=	id_valB;
			ex_valC		<=	id_valC;
			ex_valP		<=	id_valP;
			ex_dstE		<=	id_dstE;
			ex_dstM		<=	id_dstM;
		end
	end
endmodule
