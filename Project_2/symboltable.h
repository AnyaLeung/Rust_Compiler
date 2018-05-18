#include <iostream>
#include <vector>
#include <string>
#include <map>

using namespace std;

class SymbolTable{
    private:
        vector<string> V;
        map<string, int> M;
        int size;
    public:
        SymbolTable();
        int LookUp(string s);
        int Insert(string s);
        int Dump(void);
};

extern SymbolTable* st;

