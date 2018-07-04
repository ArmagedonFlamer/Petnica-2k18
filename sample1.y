%start expr_list

%{
#include "ASTList.h"
#include "ASTNode.h"
#include "ASTText.h"
#include "ASTInt.h"
#include <iostream>

// Bring the standard library into the
// global namespace
using namespace std;

// Prototypes to keep the compiler happy
void yyerror (const char *error);
int  yylex ();
%}


%union {
        int number;
        char *string;
        ASTNode *node;
        ASTList *list;
}

%token <string> SYMBOL
%token <string> TEKST
%token <number> NUMBER
%token NL
%token LP
%token RP

%type <node> expression
%type <list> expr_list

%%

expr_list: 				        { $$ = new ASTList(); }
	 | expr_list expression   	{ $$ = new ASTList($1,$2); }
	 ;
expression: LP expr_list RP	{ $$ = (ASTNode*)(new ASTList($2)); }
	  | TEKST		{ $$ = (ASTNode*)(new ASTText($1)); }
	  | SYMBOL		{ $$ = (ASTNode*)(new ASTText($1)); }
	  | NUMBER		{ $$ = (ASTNode*)(new ASTInt($1)); }
	  ;
%%


void yyerror (const char *error)
{
  cout << error << endl;
}



/*
http://www.tldp.org/HOWTO/Lex-YACC-HOWTO.html#toc5

https://www.gnu.org/software/bison/manual/html_node/Understanding.html
https://www.gnu.org/software/bison/manual/html_node/Reduce_002fReduce.html
https://www.gnu.org/software/bison/manual/html_node/Shift_002fReduce.html
*/
