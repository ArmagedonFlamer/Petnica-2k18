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

%{
/**** The beginnings of a lisp evaluator. ****/
#include <stdlib.h>
#include <stdio.h>

#define PLUS "+"
#define MINUS "-"
#define TIMES "*"
#define DIVIDE "/"
#define LEFTPAREN "("
#define RIGHTPAREN ")"
#define NUMBER "int"
#define VARIABLE "var"
#define NEWLINE "\n"
%}

%%

[a-z]+   {
	   //yylval.ti.value = 0.0;
	  // yylval.ti.name =  (char *) strdup(yytext);
	   printf( VARIABLE);
        }

[0-9]+  {  
          // yylval.ti.value = atof(yytext);
	   //yylval.ti.name = NULL;
	   printf( NUMBER);
        }

\+    printf( PLUS);
\-    printf( MINUS);
\*    printf( TIMES);
\/    printf( DIVIDE);
\(    printf( LEFTPAREN);
\)    printf( RIGHTPAREN);

\n    printf( NEWLINE);

[ ]   ;

.       printf("Invalid character\n");

%%

int yywrap() {
  return 1;
}
