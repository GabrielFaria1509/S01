#include <bits/stdc++.h>
using namespace std;

 class Pessoa{
    public:
    string nome;

    //metodo virtual  //permite que a funcao seja sobrescrita
    virtual void apresentar(){
        cout << "Ola,meu nome eh " << nome << "e eu sou uma pessoa." << endl;
    }
 };

 //classes herdeiras

 class Aluno : public Pessoa{
    public:
    string curso;
    
    Aluno(string n, string c){
        this->nome = n;
        this->curso = c;
    }

    void apresentar(){
        cout << "Ola, meu nome eh " << nome << "e eu sou um aluno de " << curso << "." << endl;
    }
 };

 class Professor : public Pessoa{
    public:
    string disciplina;
    
    Professor(string n, string d){
        this->nome = n;
        this->disciplina = d;
    }

    void apresentar(){
        cout << "Ola, meu nome eh " << nome << "e eu sou um professor de " << disciplina << "." << endl;
    }
 };

int main(){
    string nome;
    string disciplina;
    string curso;

    cout << "1 - Aluno 2 - Professor" << endl;
    cout << "Escolha o tipo de pessoa: " << endl;
    int opcao;
    cin >> opcao;

    if(opcao == 1){
        cout << "Digite o nome do aluno: " << endl;
        cin >> nome;
        cout << "Digite o curso do aluno: " << endl;
        cin >> curso;
       
        Aluno aluno(nome,curso);
        
        //Polimorfismo: ponteiro da classe base aponta para objeto da classe filha
        Pessoa *pessoa = &aluno;
        pessoa->apresentar();  //Chama o método da classe Aluno
        
    }else if(opcao == 2){
        cout << "Digite o nome do professor: " << endl;
        cin >> nome;
        cout << "Digite a disciplina do professor: " << endl;
        cin >> disciplina;
        
        Professor professor(nome,disciplina);
        
        //Polimorfismo: ponteiro da classe base aponta para objeto da classe filha
        Pessoa *pessoa = &professor;
        pessoa->apresentar();  //Chama o método da classe Professor
        
    }else{
        cout << "Opcao invalida" << endl;
    }

    return 0;
}
