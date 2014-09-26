`include "defines.v"

module id(
    input   wire        rst,
    input   wire[`PCLEN]     pc_i,
    input   wire[`INSTBUS]    inst_i,

    output  reg         instr_valid,
    output  reg         need_regids,
    output  reg         need_valC,

    output	wire[4:0]   icode,   =   inst_i[`ICODE];
    output	wire[4:0]   ifun,    =   inst_i[`IFUN];
    output	wire[4:0]   rA,
    output	wire[4:0]   rB,
    output	wire[31:0]	valC
);

	icode	<=	inst_i[`ICODE];
	ifun	<=	inst_i[`IFUN];
    case (icode)
		`RRMOVL:	begin
			rA		<=	inst_i[`RA];
			rB		<=	inst_i[`RB];
		end
		`IRMOVL:	begin
			rA		<=	inst_i[`RA];
			rB		<=	inst_i[`RB];
			valC	<=	inst_i[`IMME];
		end
		`MRMOVL		begin
			rA		<=	inst_i[`RA];
			rB		<=	inst_i[`RB];
			valC	<=	inst_i[`IMME];
		end
		`OPL		begin
			rA		<=	inst_i[`RA];
			rB		<=	inst_i[`RB];
		end
		`JXX		begin
			valC	<=	inst_i[`DEST]
		end
		`CMOVXX		begin
			rA		<=	inst_i[`RA]
			rB		<=	inst_i[`RB];
		end
		`CALL		begin
			valC	<=	inst_i[`DEST]
		end
		`RET		begin
		end
		`PUSHL		begin
			rA		<=	inst_i[`RA]
		end
		`POPL		begin
			rA		<=	inst_i[`RA]
		end
endmodule
