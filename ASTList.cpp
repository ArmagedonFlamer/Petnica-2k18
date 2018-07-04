#include "ASTList.h"
#include <bits/stdc++.h>
using namespace std;

char ASTList::gtype () {return 'l';};

ASTList::ASTList(ASTNode* prvi, ASTNode* drugi)
{
    if((prvi==NULL)&&(drugi==NULL))
        Sinovi= vector<ASTNode*>();
    else
        {
            Sinovi = vector<ASTNode*>();
            for (int i=0;i<((ASTList*)(prvi))->Sinovi.size();++i)
                Sinovi.push_back(((ASTList*)(prvi))->Sinovi[i] );
            Sinovi.push_back(drugi);
        }
}

void ASTList::addSin(ASTNode *a)
{
    Sinovi.push_back(a);
}

void ASTList::print()
{
    cout<<" (";
    for (int i=0;i<Sinovi.size();++i)
        Sinovi[i]->print();
    cout<<" )";
}
