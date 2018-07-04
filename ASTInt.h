#ifndef ASTINT_H
#define ASTINT_H

#include "ASTNode.h"


class ASTInt : public ASTNode
{
public:
    ASTInt(int);
    char gtype();
    void print();
    int vrednost;
};

#endif // ASTINT_H
