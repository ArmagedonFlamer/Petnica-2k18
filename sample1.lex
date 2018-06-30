%{
/**** The beginnings of a lisp evaluator. ****/
#include <stdio.h>
#include "y.tab.h"

%}

%%

[!+*/=><:-]+ 		{ return SYMBOL;}

[a-zA-Z][a-zA-Z0-9]*   	{
			   yylval=strdup(yytext);
			   return TEXT;
			}

[0-9]+  		{  
			   yylval = atoi(yytext);
			   return NUMBER;
			}

\n    			{ return NL;}
\(			{ return LP;}
\)			{ return RP;}

[ ]  			;

.       printf("Invalid character\n");

%%

int yywrap() {
  return 1;
}
/* 
 * Sample Scanner1: 
 * Description: Replace the string "username" from standard input 
 *              with the user's login name (e.g. lgao)
 * Usage: (1) $ flex sample1.lex
 *        (2) $ gcc lex.yy.c -lfl
 *        (3) $ ./a.out
 *            stdin> username
 *	      stdin> Ctrl-D
 * Question: What is the purpose of '%{' and '%}'?
 *           What else could be included in this section?
 */

