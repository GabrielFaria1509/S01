using System;  // Importa a biblioteca System para usar Console
using System.Collections.Generic;  // Importa a biblioteca para usar List

class Feitico        //é uma Composição
{
    public string nome = string.Empty;  //atributo público
}

class Grimorio   //é uma Composição
{
    private List<Feitico> feiticos = new List<Feitico>();  //lista privada de feitiços  //Só consigo acessar essa lista dentro da classe Grimorio
                                                           //método para adicionar feitiço à lista
                                                           //essa classe não existe sem  a classe Maga
    
    
    public void AdicionarFeitico(Feitico feitico)
    {
        //adiciona feitiço à lista
        feiticos.Add(feitico);
    }
}


class Ferramenta
{
    public string item = string.Empty;

    public Ferramenta(string item)
    {
        this.item = item;
    }
}

class Maga         // compõe um Grimorio e agrega uma lista de ferramentas em seu construtor ou por meio de uma propriedade  //classe que usa composição e agregação
//Maga "tem um" Grimório (composição) e "tem" uma lista de Ferramentas (agregação)

{
    public Grimorio grimorio { get; set; }       //Composição //get para acessar , set para modificar
                                                 //não preciso criar um construtor para Grimorio, pois ele será criado automaticamente no construtor da classe Maga
    //não preciso incicar/instanciar  grimorio na main pois ele será criado automaticamente no construtor da classe Maga
    public List<Ferramenta> ferramentas { get; set; }

    public Maga(List<Ferramenta> ferramentasExternas)     //construtor que recebe lista de ferramentas (agregação)
    {
        grimorio = new Grimorio();  //composição - cria automaticamente
        ferramentas = ferramentasExternas;  //agregação - recebe lista externa
    }
}


class ProgramExer3
{
    public static void Main()
    {
        //5. No main, crie uma lista de Ferramentas
        List<Ferramenta> ferramentas = new List<Ferramenta>();  //lista de ferramentas
        ferramentas.Add(new Ferramenta("Capacete"));
        ferramentas.Add(new Ferramenta("Lanterna"));  //.Add adiciona um item à lista //new Ferramenta() cria uma nova instância da classe Ferramenta
        ferramentas.Add(new Ferramenta("Corda"));
        
        //Crie a instância de Maga (Frieren), inicializando-a com seu Grimório (automaticamente) e passando a lista de Ferramentas (Agregação)
        Maga frieren = new Maga(ferramentas);

        //Grimorio é iniciado automaticamente no construtor da classe Maga (Composição)

        //6. Adicione feitiços ao Grimório de Frieren
        Feitico feitico1 = new Feitico { nome = "Bola de Fogo" };
        Feitico feitico2 = new Feitico { nome = "Cura" };
        Feitico feitico3 = new Feitico { nome = "Teleporte" };
        
        frieren.grimorio.AdicionarFeitico(feitico1);
        frieren.grimorio.AdicionarFeitico(feitico2);
        frieren.grimorio.AdicionarFeitico(feitico3);

        //6. imprima o nome das ferramentas que ela agregou
        Console.WriteLine("Ferramentas agregadas à maga Frieren:");
        foreach (var ferramenta in frieren.ferramentas) {
                Console.WriteLine("- " + ferramenta.item);
        }
        

    }
}
