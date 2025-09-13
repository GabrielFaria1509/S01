#include<iostream>
using namespace std;

int main(){
    int n; //quqnatidade de notas
    int nvalidas; //quantidade de notas validas
    double nota;  //nota individual
    double soma; //soma das notas
    double media;

    cout << "quantas notas deseja inserir? " << endl;
    cin >> n;
    nvalidas = 0;

    for(int i = 0; i < n; i++){
        cout << "digite a nota : " << endl;
        cin >> nota;
        //vai pedir notaa té que seja válida //entre 0 e 10
        while(nota < 0 || nota > 10){
            cout << "nota invalida" << endl;
            cin >> nota;
        }
        nvalidas++;  //contador para as notas que vão entrar na média
        soma += nota; //soma das notas
    }

    media = soma / nvalidas; //cálculo da média
    
    if(media >= 7){
        cout << "Aprovado" << endl;
    } else {
        cout << "Reprovado" << endl;
    }

    return 0;
    
}
