class SymbolTable{
    private:
        vector<string> V;
        map<string, int> M;
        int size;
    public:
        Create(void){
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
};
