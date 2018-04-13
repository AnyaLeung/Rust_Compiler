#include <iostream>
#include <string>
#include <map>
#include <vector>
#define SymbolTable sym_t

using namespace std;
    
class SymbolTable{
public:
    vector <string> V;
    map<string, int> M;
    int size;
};

sym_t* st;

 //funcs
sym_t* Create(void){
    st = new SymbolTable();
    st->size = 0;
}
int Insert(string s){
    (st->M).insert(pair<string,int>(s, st->size ));        
    (st->V).push_back(s);
    return (st->size)++;
}

int LookUp(string s){
    if ((st->M).find(s)==(st->M).end()){
        return -1;
     } //s not in map M's keys
    else {
        return (st->M)[s];
    }
}

int Dump(void){
    for(std::vector<string>::iterator it=(st->V).begin(); it!=(st->V).end(); it++){
        cout << *it << endl;
    }
    return (st->V).size();
}

int main(void){
    Create();

    cout << Insert("a") << endl;
    cout << Insert("b") << endl;
    cout << Insert("c") << endl;
    
    cout << Dump();
    return 0;
}
