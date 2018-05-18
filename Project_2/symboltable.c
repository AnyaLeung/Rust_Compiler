#include "symboltable.h"

/* functions */
SymbolTable::SymbolTable(void){
    st->size = 0;
}

int SymbolTable::LookUp(string s){
    if ((st->M).find(s)==(st->M).end()){
        return -1;
    } //s not in map M's keys
    else {
        return (st->M)[s];
    }
}

int SymbolTable::Insert(string s){
    if(LookUp(s)==-1){
        (st->M).insert(pair<string,int>(s, st->size ));        
        (st->V).push_back(s);
        return (st->size)++;
    }
    else{
        return -1;
    }
}

int SymbolTable::Dump(void){
    for(std::vector<string>::iterator it=(st->V).begin(); it!=(st->V).end(); it++){
        cout << *it << endl;
    }
    return (st->V).size();
}
