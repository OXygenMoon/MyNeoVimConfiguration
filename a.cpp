#include<iostream>
#include <vector>
using namespace std;

void func(int a, int b,  string c){
}

class info{
    public:
        char name[4];
        double score[4];
        void fun(){
            cout << "func" << endl;
        }

};

int main(){

    vector<int> a;
    for(int it : a)
    {
        cout << it; 
    }

    cout << "success" << endl;
    cout << "success" << endl;
    cout << "success" << endl;
    cout << "success" << endl;
    return 0;
}
