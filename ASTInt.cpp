#include "ASTInt.h"
#include <stdio.h>

ASTInt::ASTInt(int b) {vrednost = b;}

void ASTInt::print() {printf(" %i",&vrednost);}

char ASTInt::gtype() {return 'i';}
