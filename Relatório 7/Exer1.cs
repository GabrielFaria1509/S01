using System;  // Importa a biblioteca System para usar Console
using System.Collections.Generic; // Importa a biblioteca System.Collections.Generic para usar List<>



// Definição de uma classe chamada MembroDaSociedade
class MembroDaSociedade
{
    //atributos privados
    private string nome;
    private string raca;
    private string funcao;

    // Construtor que obriga a inicialização dos três atributos
    public MembroDaSociedade(string nome, string raca, string funcao)
    {
        this.nome = nome;
        this.raca = raca;
        this.funcao = funcao;
    }

    
    // Método para exibir informações
    public void Descrever()
    {
        Console.WriteLine($"Nome: {nome}, Raça: {raca}, Função: {funcao}");
    }
}
class Program  //classe principal
    {
        public static void Main()  //método principal 
        {
            // Criando membros - OBRIGATÓRIO passar os 3 parâmetros
            MembroDaSociedade Aragon = new MembroDaSociedade("Aragorn", "Humano", "Rei");
            MembroDaSociedade Legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");
            
            // Exibindo informações
            Aragon.Descrever();
            Legolas.Descrever();
        }
    }
