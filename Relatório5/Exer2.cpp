#include <iostream>
using namespace std;
float somaArray(float array[],int tamanho){   //função que soma os elementos do array
    float soma = 0;
    for(int i = 0; i < tamanho; i++){
        soma += array[i];
    }
    return soma;
}
int main(){  
    int n;
    cin >> n; //tamanho vetor
        float array[n];
        for(int i = 0; i < n; i++){
            cin >> array[i];
        }
        cout << somaArray(array, n) << endl;

        return 0;
    }
