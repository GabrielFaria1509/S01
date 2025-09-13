#include<iostream>
using namespace std;
double celsiusParaFahrenheit(double celsius){
    return (celsius * 9/5) + 32;
}

double celiusParaKelvin(double celsius){
    return celsius + 273.15;
}

int main(){
    
    int opcao = 0;

    double celsius; 

    do{
        cout << "Menu de Conversao de Temperatura" << endl;
        cout << "Escolha uma opcao:" << endl;
        cout << "1. Celsius para Fahrenheit" << endl;
        cout << "2. Celsius para Kelvin" << endl;
        cout << "0. Sair" << endl;
        cin >> opcao;

        switch(opcao){
            case 1:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << "Temperatura em Fahrenheit: " << celsiusParaFahrenheit(celsius) << endl;
                break;
            case 2:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << "Temperatura em Kelvin: " << celiusParaKelvin(celsius) << endl;
                break;
            case 0:
                cout << "Saindo..." << endl;
                break;
            default:
                cout << "Opcao invalida!" << endl;
                break;
        }

    }while(opcao != 0);

    return 0;
    
}
