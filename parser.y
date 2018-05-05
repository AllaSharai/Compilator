%{
#include "global.h"
#include "parser.h"
%}
  
%token ID NUM MOD DIV
  
%% 
list: expr ';' list
	|
	;

expr : expr '+' term {emit('+',NONE);}
	| expr '-' term {emit('-',NONE);}
	| term
	|
	;

term : term '*' factor {emit('*',NONE);}
	| term '/' factor {emit('/',NONE);}
	| term DIV factor {emit(DIV,NONE);}
	| term MOD factor {emit(MOD,NONE);}
	| factor
	;

factor : '(' expr ')'
	| ID {emit(ID, tokenval);}
	| NUM {emit(NUM, tokenval);}
	;

%% 
  
void parse(){
	yyparse();
}
  
int yyerror(char *e)
{
	error(e);
	return 0;
}
