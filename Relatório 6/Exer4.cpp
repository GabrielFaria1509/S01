#include <bits/stdc++.h>
using namespace std;
class SeresVivos{
    public:
    string nome;

    virtual void apresentar(){
        cout << "Ola , meu nome eh " << nome << endl;
    }
};

class Humano : public SeresVivos{
    //já herda nome de SeresVivos
    public:
    
    Humano(string n){
        this->nome = n;
    }

    void apresentar(){
        cout << "Ola , meu nome eh " << nome << " e sou um humano" << endl;
    }
    
};

class Elfo : public SeresVivos{
    public:
    
    Elfo(string n){
        this->nome = n;
    }

    void apresentar(){
        cout << "Ola , meu nome eh " << nome << " e sou um elfo" << endl;
    }
};

class Fada : public SeresVivos{
    public:
    
    Fada(string n){
        this->nome = n;
    }

    void apresentar(){
        cout << "Ola , meu nome eh " << nome << " e sou uma fada" << endl;
    }
};
 
int main(){
    
    string nome;

    list<SeresVivos*> seres; //lista de seres vivos

    cout << "Qual raca sera colocada ?" << endl;
    cout << "1 - Humano" << endl;
    cout << "2 - Elfo" << endl;
    cout << "3 - Fada" << endl;
    cout << "4 - Sair" << endl;

    int escolha = 0;

    cin >> escolha;

   while(escolha != 0){
    if(escolha == 1){
        cout << "Digite o nome do humano" << endl;
        cin >> nome;
        Humano *humano = new Humano(nome);   //ponteiro para inserção na lista
        seres.push_back(humano);
        cout << "Humano registrado" << endl;
      }

    if(escolha == 2){
        cout << "Digite o nome do elfo" << endl;
        cin >> nome;
        SeresVivos *elfo = new Elfo(nome);
        seres.push_back(elfo);
        cout << "Elfo registrado" << endl;
      }

    if(escolha == 3){
        cout << "Digite o nome da fada" << endl;
        cin >> nome;
        SeresVivos *fada = new Fada(nome);
        seres.push_back(fada);
        cout << "Fada registrada" << endl;
    }

    cout << "Escolha a raca novamente ou digite 4 para finalizar"

    cin >> escolha;
    if(escolha == 4){
        break;
    }
    
   }

   //percorrendo lista chamando metódo apresentar

   for(list<SeresVivos*>::iterator it = seres.begin(); it != seres.end(); it++){   //usei iterador que meu vscode é compilador mais antigo
    (*it)->apresentar();   
   }



    
    
    return 0;
}
