%{
    open Instr
%}

%token EOF EOL COMMA CONST MOV ADD SUB MUL DIV EQ LT LEQ JMP IF_ZERO RD_GLOB WR_GLOB MK_TAB
%token RD_TAB WR_TAB CALL RET
%token<int> INT REG
%token<string> STR ID FN
%type<(string * Instr.instr list) list> main
%start main

%%
main:
  prog EOF { List.rev $1 }

prog:
  { [] }
| EOL prog { $2 }
| prog fn { $2::$1 }
;

fn:
| FN EOL instrs { $1, List.rev $3 }

instrs:
  instr EOL { [$1] }
| instrs instr EOL { $2::$1 }
| instrs EOL { $1 }

instr:
  CONST REG COMMA INT { I_const (`L_Reg $2, `L_Int $4) }
| CONST REG COMMA STR { I_const (`L_Reg $2, `L_Str $4) }
| CONST REG COMMA ID { I_const (`L_Reg $2, `L_Id $4) }
| MOV REG COMMA REG { I_mov (`L_Reg $2, `L_Reg $4) }
| ADD REG COMMA REG COMMA REG { I_add (`L_Reg $2, `L_Reg $4, `L_Reg $6) }
| SUB REG COMMA REG COMMA REG { I_sub (`L_Reg $2, `L_Reg $4, `L_Reg $6) }
| MUL REG COMMA REG COMMA REG { I_mul (`L_Reg $2, `L_Reg $4, `L_Reg $6) }
| DIV REG COMMA REG COMMA REG { I_div (`L_Reg $2, `L_Reg $4, `L_Reg $6) }
| EQ REG COMMA REG COMMA REG { I_eq (`L_Reg $2, `L_Reg $4, `L_Reg $6) }
| LT REG COMMA REG COMMA REG { I_lt (`L_Reg $2, `L_Reg $4, `L_Reg $6) }
| LEQ REG COMMA REG COMMA REG { I_leq (`L_Reg $2, `L_Reg $4, `L_Reg $6) }
| JMP INT { I_jmp $2 }
| IF_ZERO REG COMMA INT { I_if_zero (`L_Reg $2, $4) }
| RD_GLOB REG COMMA ID { I_rd_glob (`L_Reg $2, `L_Id $4) }
| WR_GLOB ID COMMA REG { I_wr_glob (`L_Id $2, `L_Reg $4) }
| MK_TAB REG { I_mk_tab (`L_Reg $2) }
| RD_TAB REG COMMA REG COMMA REG { I_rd_tab (`L_Reg $2, `L_Reg $4, `L_Reg $6) }
| WR_TAB REG COMMA REG COMMA REG { I_wr_tab (`L_Reg $2, `L_Reg $4, `L_Reg $6) }
| CALL REG COMMA INT COMMA INT { I_call (`L_Reg $2, $4, $6) }
| RET REG { I_ret (`L_Reg $2) }
