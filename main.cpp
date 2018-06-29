#include <bits/stdc++.h>

#define list 1
#define broj 2
#define komm 3

using namespace std;

class ASTNode
{
public:
    virtual int gtype() = 0;
    virtual void print() = 0;
};

class ASTList: ASTNode
{
 public:
    ASTList ();
    int gtype() override {return list;};
    vector<ASTNode*> Sinovi;
    void addSin(ASTNode*);
    void print() override;
};

ASTList::ASTList()
{
    Sinovi=*new vector<ASTNode*>;
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

class ASTInt:ASTNode
{
public:
    ASTInt(int);
    int gtype() override {return broj;};
    void print() override {cout<<" "<<vrednost;};
    int vrednost;
};

ASTInt::ASTInt(int b)
{
    vrednost = b;
}

class ASTString:ASTNode
{
public:
    ASTString(string);
    int gtype() override {return komm;};
    void print() override {cout<<" "<<kom;}
    string kom;
};

ASTString::ASTString(string s)
{
    kom=s;
}

ASTList* rasparcaj (vector<string> *V);
ASTList* rasparcaj (vector<string>* V, int p);
ASTNode* nadjitip(string s);

int main()
{
// tokenizacija inputa
//-----------------------------------
    string str;
    vector<string> Comms;
    int n=0;
    getline(cin,str);
    char * pch;
    cout<<"Splitting string "<<str<<" into tokens:\n";
    pch = strtok (&str[0]," ,.-");
    while (pch != NULL)
    {
        Comms.push_back(pch);
        pch = strtok (NULL, " ");
    }
//------------------------------------
    //ASTList *Tree= rasparcaj(&Comms);

    ASTList L = *new ASTList();
    L.addSin((ASTNode*)(new ASTString("*")));
    L.addSin((ASTNode*)(new ASTString("x")));
    L.addSin((ASTNode*)(new ASTInt(2)));
    ASTList L1 = *new ASTList();
    L1.addSin((ASTNode*)(new ASTString("-")));
    L1.addSin((ASTNode*)(new ASTInt(6)));
    L1.addSin((ASTNode*)(new ASTInt(5)));
    double i;
    float * pi;
    std::cout << "\nint is: " << typeid(string).name() << '\n';
    std::cout << "  i is: " << typeid(i).name() << '\n';
    std::cout << " pi is: " << typeid(pi).name() << '\n';
    std::cout << "*pi is: " << typeid(*pi).name() << '\n';

    return 0;
}

/*ASTList* rasparcaj (vector<string> *V)
{
    int visited[V->size()];
    ASTList L = *new ASTList();
    for (int i=0;i<V->size();++i)
        visited[i]=0;
    for(int i=0; i<V->size();++i)
    {
        if ((*(V+i)[0]=='(') && (visited[i]==0))
        {
            visited[i]=1;
            L.addSin(rasparcaj(V, i+1));
        }
        else
            if ((*(V+i)==")")&&(visited[i]==0))
                return L;
            else
                L.addSin((ASTNode*)nadjitip(*(V+i)));
    }
    return 0;
}

ASTNode* rasparcaj (vector<string>* V, int p)
{
    ASTLIST *L = new ASTList();
    for(int i=p; i<V->size();++i)
    {
        if ((*(V+i)=="(") && (visited[i]==0))
        {
            visited[i]=1;
            L.addSin(rasparcaj(V, i+1));
        }
        else
            if ((*(V+i)==")")&&(visited[i]==0))
                {
                    visited[i]=1;
                    return L;
                }
            else
                L.addSin(nadjitip(*(V+i)));
    }
}

ASTNode* nadjitip(string s)
{
    ASTString S=*new ASTString(s);
    return (ASTNode*)(&S);
}*/
/*
typeid(int).name() == i
*/
