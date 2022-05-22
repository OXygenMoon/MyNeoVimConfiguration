#include<iostream>
#include <vector>
using namespace std;


int main(){

    vector<int> a;
    a.push_back(1);
    a.push_back(2);
    a.push_back(3);

    for(int it : a)
    {
        cout << it << endl; 
    }

    cout << "success" << endl;
    cout << "success" << endl;
    cout << "success" << endl;
    cout << "success" << endl;
    return 0;
}
