%start expr_list

   %token SYMBOL
   %token TEXT
   %token NUMBER
   %token NL
   %token LP
   %token RP


   %%

   expr_list:
     LP expression RP expr_list 	{ $$ = expl($2,$4) }
   | expr_list				{ $$ = $1 }
	;
   expression:
     LP word NUMBER NUMBER RP	{ $$ = exp($2,$3,$4) }
   | LP word NUMBER TEXT RP	{ $$ = exp($2,$3,$4) }
   | LP word TEXT NUMBER RP	{ $$ = exp($2,$3,$4) }
   | LP word TEXT TEXT RP	{ $$ = exp($2,$3,$4) }
   ;
	
   word:
     SYMBOL	{ $$ = $1 }
   | TEXT	{ $$ = $1 }
   ;
