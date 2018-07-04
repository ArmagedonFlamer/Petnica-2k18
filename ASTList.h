#ifndef ASTLIST_H
#define ASTLIST_H

#include "ASTNode.h"
#include <bits/stdc++.h>

class ASTList : public ASTNode
{
 public:
    ASTList (ASTNode* prvi = NULL, ASTNode* drugi = NULL);
    char gtype();
    void addSin(ASTNode*);
    void print();
    std::vector<ASTNode*> Sinovi;

};

#endif // ASTLIST_H
