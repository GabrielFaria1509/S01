#include <bits/stdc++.h>
using namespace std;

class Personagem{              //classe personagem//possui atributos : nome,nivel,dano,vida
    public:
    string nome;
    int nivel;
    int dano;
    int vida;
    Personagem(string nome,int nivel,int dano,int vida){      //construtor
        this->nome = nome; 
        this->nivel = nivel;
        this->dano = dano;
        this->vida = vida;
    }

    void atacar(Personagem &inimigo, int dano){      //método atacar
        inimigo.vida -= dano;
        cout << "Inimigo agora tem " << inimigo.vida << " pontos de vida" << endl;
    }
};




int main(){
    int vida;
    int dano;
    int nivel;
    string nome;
    
    cout << "Defina valores do heroi:" << endl;
    cout << "Nome: ";
    cin >> nome;
    cout << "Nivel: ";
    cin >> nivel;
    cout << "Dano: ";
    cin >> dano;
    cout << "Vida: ";
    cin >> vida;

    Personagem heroi(nome, nivel, dano, vida);  //instancia do heroi
    cout << "Heroi criado com sucesso!" << endl;

    cout << "Defina os valores do inimigo:" << endl;
    cout << "Nome: ";
    cin >> nome;
    cout << "Nivel: ";
    cin >> nivel;
    cout << "Dano: ";
    cin >> dano;
    cout << "Vida: ";
    cin >> vida;
    
    Personagem inimigo(nome, nivel, dano, vida);  //instancia do inimigo
    cout << "Inimigo criado com sucesso!" << endl;

    cout << "Escolha quem ira atacar primeiro (1 - Heroi, 2 - Inimigo): ";
    int escolha;

    cin >> escolha;

    if(escolha == 1){
        cout << "Heroi ataca!" << endl;
        cout << "Quantos pontos de dano deseja causar? ";
        int dano;
        cin >> dano;
        
        heroi.atacar(inimigo, dano);  //chamada do  método atacar
        if(inimigo.vida <= 0){
            cout << "Inimigo derrotado! Heroi vence!" << endl;
            return 0;
        }



    }
    if(escolha == 2){
        cout << "Inimigo ataca!" << endl;
        cout << "Quantos pontos de dano deseja causar? ";
        int dano;
        cin >> dano;

        inimigo.atacar(heroi, dano);  //chamada do  método atacar
        if(heroi.vida <= 0){
            cout << "Heroi derrotado! Inimigo vence!" << endl;
            return 0;
        }

    }
    return 0;
}
