#ifndef ASTNODE_H
#define ASTNODE_H


class ASTNode
{
public:
    virtual char gtype() = 0;
    virtual void print() = 0;
};


#endif // ASTNODE_H
