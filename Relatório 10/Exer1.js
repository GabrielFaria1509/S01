// Classe PAI - define as características básicas de qualquer Pokemon
class Pokemon{
    //atributos //vida é protected // nome e tipo são publicos
    constructor(nome,tipo,vidaInicial){
        this.nome = nome;           // Nome do Pokemon (ex: "Pikachu")
        this.tipo = tipo;           // Tipo do Pokemon (ex: "Elétrico", "Água", "Fogo")
        this._vidaInicial = vidaInicial; // Vida inicial (protegida)
    }

    // Método para consultar a vida atual
    getVida(){
        return this._vidaInicial;
    }

    // Métodos que serão implementados nas classes filhas
    receberDano(dano){
        console.log(`${this.nome} recebeu ${dano} de dano!`);
    }

    atacar(){
        console.log(`${this.nome} está atacando!`);
    }

}

// Classe FILHA - herda de Pokemon e adiciona características específicas de Pokemon de Água
class PokemonAgua extends Pokemon{
    constructor(nome,vidaInicial,curaBase){
        // super() chama o constructor da classe PAI (Pokemon)
        // Passa: nome do pokemon, tipo fixo "Água", e vida inicial
        super(nome, "Água", vidaInicial);
        
        // Adiciona atributo específico de Pokemon de Água
        this._curaBase = curaBase; // Poder de cura específico deste tipo
    }

    atacar(){
        console.log(`${this.nome} está atacando com um jato d'água!`)
    }


}

// Classe FILHA - herda de Pokemon e adiciona características específicas de Pokemon de Fogo
class PokemonFogo extends Pokemon{
    constructor(nome,vidaInicial,bonus){
        // super() chama o constructor da classe PAI (Pokemon)
        // Passa: nome do pokemon, tipo fixo "Fogo", e vida inicial
        super(nome, "Fogo", vidaInicial);
        
        // Adiciona atributo específico de Pokemon de Fogo
        this.bonus = bonus; // Bônus de ataque específico deste tipo
    }

    atacar(){
        console.log(`${this.nome} está atacando com uma bola de fogo!`)
    }

}

console.log("=== TESTE DOS POKEMONS ===");

// Dados de teste 
let nomePokemon1 = "Squirtle";
let vidaPokemon1 = 100;
let curabase = 25;

let nomePokemon2 = "Charmander";
let vidaPokemon2 = 90;
let bonus = 15;

// Criando Pokemon de Água
console.log(`\nCriando Pokemon de Água: ${nomePokemon1}`);
let pokemon1 = new PokemonAgua(nomePokemon1, vidaPokemon1, curabase);
console.log(`Nome: ${pokemon1.nome}, Tipo: ${pokemon1.tipo}, Vida: ${pokemon1.getVida()}`);

// Criando Pokemon de Fogo
console.log(`\nCriando Pokemon de Fogo: ${nomePokemon2}`);
let pokemon2 = new PokemonFogo(nomePokemon2, vidaPokemon2, bonus);
console.log(`Nome: ${pokemon2.nome}, Tipo: ${pokemon2.tipo}, Vida: ${pokemon2.getVida()}`);

// Testando ataques
console.log("\n=== ATAQUES ===");
[pokemon1, pokemon2].forEach(pokemon => {
    pokemon.atacar();
});

// Testando receber dano
console.log("\n=== RECEBENDO DANO ===");
pokemon1.receberDano(20);
pokemon2.receberDano(15);

