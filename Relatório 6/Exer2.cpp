#include <bits/stdc++.h>
using namespace std;

class Pessoa{          //classe pessoa
    private:          //atributos privados , ou seja , so pode ser acessado por metodos da propria classe
        string nome;
        int idade;

    public:           
        //métodos set/get para acessar os atributos privados
        void setNome(string nome) {   //set é para atribuir valor
            this->nome = nome;
        }
        string getNome() {        //get é para retornar o valor
            return this->nome;
        }

        void setIdade(int idade) {
            this->idade = idade;
        }
        int getIdade() {
            return this->idade;
        }
};

//classes protagonista e personagem são herdeiras de Pessoa  
// ou seja , elas herdam os atributos e metodos da classe mãe Pessoa
class Protagonista : public Pessoa{
    private:
        int nivel;

    public: //dados() precisa ser público para poder ser chamado no main
        void setNivel(int nivel) {
            this->nivel = nivel;
        }
        int getNivel() {
            return this->nivel;
        }

        void dados(){        //metodo para imprimir os dados do protagonista
            cout << "Nome: " << getNome() << " eh o protagonista" << endl; 
            cout << "Nivel: " << getNivel() << " level protagonista" << endl;
        }
};

class Personagem : public Pessoa{
   private:
        int rank;

   public: //dados() precisa ser público para poder ser chamado no main
        void setRank(int rank) {
            this->rank = rank;
        }
        int getRank() {
            return this->rank;
        }

        void dados(){           //metodo para imprimir os dados do personagem
            cout << "Nome: " << getNome() << " eh o personagem" << endl;
            cout << "Rank: " << getRank() << " level personagem" << endl;
        }
};

int main(){
   string nome;
   int nivel, rank;

   //entrada de dados
   cout << "Digite o nome do protagonista: ";
   cin >> nome;
   cout << "Digite o nivel do protagonista: ";
   cin >> nivel;

   //objeto da classe protagonista
   Protagonista p1;
   p1.setNome(nome);   //uso do set no padrão pedido
   p1.setNivel(nivel);

   cout << "Digite o nome do personagem: ";
   cin >> nome;
   cout << "Digite o rank do personagem: ";
   cin >> rank;

   //objeto da classe personagem
   Personagem p2;  
   p2.setNome(nome);
   p2.setRank(rank);

   //impressão dos valores
   p1.dados(); //chamada do metodo dados da classe protagonista
   p2.dados(); //chamada do metodo dados da classe personagem

   return 0;
}
