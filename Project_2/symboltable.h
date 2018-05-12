#include <iostream>
#include <vector>
#include <string>
#include <map>
#define SymbolTable sym_t

using namespace std;

class SymbolTable{
    public:
        vector<string> V;
        map<string, int> M;
        int size;
};

sym_t* st;

/* functions */
sym_t* Create(void){
    st = new SymbolTable();
    st->size = 0;
}

int LookUp(string s){
    if ((st->M).find(s)==(st->M).end()){
        return -1;
    } //s not in map M's keys
    else {
        return (st->M)[s];
    }
}

int Insert(string s){
    if(LookUp(s)==-1){
        (st->M).insert(pair<string,int>(s, st->size ));        
        (st->V).push_back(s);
        return (st->size)++;
    }
    else{
        return -1;
    }
}

int Dump(void){
    for(std::vector<string>::iterator it=(st->V).begin(); it!=(st->V).end(); it++){
        cout << *it << endl;
    }
    return (st->V).size();
}
