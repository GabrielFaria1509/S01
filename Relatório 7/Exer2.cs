using System; // Importa a biblioteca System para usar Console
using System.Collections.Generic; // Importa a biblioteca para usar List

//classe base
class Pokemon
{
    public string nome = string.Empty; //atributo público

    //método virtual - pode ser sobrescrito pelas classes filhas
    public virtual void Atacar()
    {
        Console.WriteLine(nome + " está atacando ! ");
    }
}

//classe filha 1
class PokemonDeFogo : Pokemon
{
    //herda nome da classe mãe
    public PokemonDeFogo(string nome)
    {
        this.nome = nome; //inicializa o nome
    }

    public override void Atacar() //sobrescreve o método Atacar da classe mãe
    {
        Console.WriteLine(nome + " lançou uma bola de fogo! ");
    }
}

//classe filha 2
class PokemonDeAgua : Pokemon
{
    //herda nome da classe mãe
    public PokemonDeAgua(string nome)
    {
        this.nome = nome; //inicializa o nome
    }

    public override void Atacar() //sobrescreve o método Atacar da classe mãe
    {
        Console.WriteLine(nome + " lançou um jato de água! ");
    }
}

class Exer2
{
    public static void Main()
    {
        //lista de objetos do tipo da classe mãe (Pokemon)
        List<Pokemon> pokemons = new List<Pokemon>();

        pokemons.Add(new PokemonDeAgua("Blastoise")); //adiciona um PokemonDeAgua à lista
        pokemons.Add(new PokemonDeFogo("Charizard")); //adiciona um PokemonDeFogo à lista

        foreach (var pokemon in pokemons)  //percorre a lista //pokemon é nome genérico para cada item da lista
        {
            pokemon.Atacar(); //chama o método Atacar de cada Pokémon (polimorfismo)
        }

    }
}
