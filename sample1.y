%start expr_list

   %token SYMBOL
   %token TEXT
   %token NUMBER
   %token NL
   %token LP
   %token RP


   %%
	

   expr_list:
   | LP expression RP expr_list 	{ $$ = expr($2,$4) }
   | LP expr_list RP			{ $$ = $1 }
	;
   expression:
     LP word NUMBER NUMBER RP	{ $$ = exp($2,$3,$4) }
   | LP word NUMBER TEXT RP	{ $$ = exp($2,$3,$4) }
   | LP word TEXT NUMBER RP	{ $$ = exp($2,$3,$4) }
   | LP word TEXT TEXT RP	{ $$ = exp($2,$3,$4) }
   ;
	
   word:
      NUMBER 	{ $$ = $1 }
   |  SYMBOL	{ $$ = $1 }
   |  TEXT	{ $$ = $1 }
   ;
