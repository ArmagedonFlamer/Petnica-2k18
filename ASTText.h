#ifndef ASTTEXT_H
#define ASTTEXT_H

#include <ASTNode.h>
#include <string>
using namespace std;
class ASTText : public ASTNode
{
public:
    ASTText(std::string);
    char gtype();
    void print();
    std::string kom;
};

#endif // ASTTEXT_H
