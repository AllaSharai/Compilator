%option noyywrap
%{
#include <stdlib.h>
#include "global.h"
#include "parser.h"
int lineno = 1;
int tokenval = NONE;
%}

%%
[ \t] 	{ }

[\n] 	{ 
			lineno++; 
		}

[0-9]+ 	{ 
			tokenval = atoi(yytext); 
			return NUM; 
		}

[a-zA-Z][a-zA-Z0-9]* 	{
							int	p = lookup(yytext);
							if (p == 0) {
								p = insert(yytext, ID);
							}
							tokenval = p;
							return symtable[p].token;
						}

<<EOF>> { return DONE; }

. 		{ tokenval = NONE; return yytext[0]; }

%%
int lexan(){
	return yylex();
}
