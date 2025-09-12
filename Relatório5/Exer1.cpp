#include<iostream>
using namespace std;
int fib(int n){             //função auxiliar
    if(n==0)
        return 0;
    if (n==1){
        return 1;
    }
    return fib(n-1)+fib(n-2);   //uso de recursividade
}
int main(){
    int n;  //até qual termo vou da sequência
    cin >> n;
    
    for(int i = 0; i < n; i++){
        cout << fib(i);
        if(i < n-1){
            cout << ", ";
        }
    }
    cout << endl;
    return 0;

}
