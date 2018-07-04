%{
/**** The beginnings of a lisp evaluator. ****/
#include <iostream>
#include <string>
#include "y.tab.cc"
#include "ASTList.h"
#include "ASTNode.h"
#include "ASTText.h"
#include "ASTInt.h"

using namespace std;


%}
%option c++

%%

[!+*/=><:-]+ 		{ return SYMBOL; }

[a-zA-Z][a-zA-Z0-9]*   	{
			   yylval.string = strdup(yytext);
			   return TEKST;
			}

[0-9]+  		{
			   yylval.number = atoi(yytext);
			   return NUMBER;
			}

\n    			{ return NL; }
\(			{ return LP; }
\)			{ return RP; }

[ ]  			;

.       printf("Invalid character\n");

%%
//http://www.tldp.org/HOWTO/Lex-YACC-HOWTO.html#toc5

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

