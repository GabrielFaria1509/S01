//Personagem herda de protagonista Portagonista extende personagem
//Criatura é uma agregação de Diário
//Protagonista é uma agregação de Diário
//CabanaMistério é uma agregação de Personagem
//Diario deve usar um Map para enigmas e o método decodificar deve validar o acesso usando o autorsecreto e o índice do enigma descodificado

//listar funcionários deve acessar a lista de personagens funcionários
//listar funcioinários retornar a coleção de personagens agregada

//Ps : Gravity Falls é meu desenho favorito então quis afzer com mais detalhe nos textos , na hora de listar os funcionários quis separar certinho
//mas sei que no exercício era para listar todos personagens como funcionários , mas quis fazer mais detalhado
class Diario{
    
  //enigmas atributo privado
    #enigmas;
    #criaturasAvistadas;  //vais ser um array

    constructor(autor){
        this._autor = autor;
        this.#criaturasAvistadas = [];  //inicializa o array de criaturas
        this.#enigmas = new Map();  //inicializa o map de enigmas //map é para chave e valor

    }


    //getter para autor  //getter inicializa o atributo autor
    getAutor(){
        return this._autor;
    }

    adicionarCriatura(criatura){
        this.#criaturasAvistadas.push(criatura);  //adiciona criatura ao array privado
    }

    //construtor para enigmas //parametro enigmas é um numero e uma string //parametros públicos
 adicionarEnigma(numero, enigma){    
       this.#enigmas.set(numero,enigma);  //set adiciona chave e valor ao map
    }

    //decoficiador de enigmass
    //usa map para ter como chave uma string e valor um numero
    decodificarEnigma(chave,num){
        if(chave != this._autor){
            console.log("Acesso negado: Autor secreto incorreto.");
            return null;
        }else{
            if(this.#enigmas.has(num) === false){
                console.log("Enigma não encontrado.");  //verifica se o enigma existe
                return null;
            }else{
                return this.#enigmas.get(num);  //retorna o enigma correspondente ao numero
            }
        }
        
    }

}

class Criatura{
    constructor(nome,perigosa){
        this.nome = nome;
        this.perigosa = perigosa;  //boolean
       
    }
}

class Personagem{
    //atributo diario 3 é privado
    constructor(nome, idade){
        this.nome = nome;
        this.idade = idade;
        
    }

}

class Protagonista extends Personagem{
    //atributo diario3 é privado de Protagonista
    #diario3;
    
    constructor(nome, idade){
        super(nome, idade); //chama o construtor da superclasse Personagem
        this.#diario3 = new Diario("Stanford Ford");
    }
}

class CabanaMistério{
    //atriibuto visitantes público
    //vistantes é um array de de strings
    //há um array de personagens
    //outro array para personagens que são funcionários
    personagens = [];  //todos os personagens da cabana
    funcionarios = [];  //funcionários da cabana
    visitantes = [];  //apenas visitantes genéricos

    constructor(diario){
        this.diario = diario;
    }


    listarFuncionarios(){   
        console.log("\n=== Lista de Personagens Funcionários ===");
        return this.funcionarios;  //listo apenas os que trabalham lá 
}
}

//testes
const diarioStanford = new Diario("Stanford Ford");  //criando o diário do Stanford //entre parenteses é o autor secreto , ou seja , o parametro do construtor

// Criaturas perigosas
const billCipher = new Criatura("Bill Cipher", true);
const gremloblin = new Criatura("Gremloblin", true);
const summerween = new Criatura("Summerween Trickster", true);

// Criaturas não perigosas
const gnomo = new Criatura("Gnomo", false);
const manotaur = new Criatura("Manotaur", false);

console.log("\n=== Diário de Stanford Ford ===");
console.log(`Autor: ${diarioStanford.getAutor()}`);  //usando o getter para autor
// Adicionando criaturas ao diário
console.log("\nAdicionando criaturas ao diário...");
console.log("Criatura 1 : Bill Cipher (Perigosa)");
console.log("Criatura 2 : Gremloblin (Perigosa)");
console.log("Criatura 3 : Summerween Trickster (Perigosa)");
console.log("Criatura 4 : Gnomo (Não Perigosa)");
console.log("Criatura 5 : Manotaur (Não Perigosa)");
diarioStanford.adicionarCriatura(billCipher);
diarioStanford.adicionarCriatura(gremloblin);
diarioStanford.adicionarCriatura(summerween);
diarioStanford.adicionarCriatura(gnomo);
diarioStanford.adicionarCriatura(manotaur);

console.log("Stanford cria os enigmas no diário...");
// Adicionando enigmas
diarioStanford.adicionarEnigma(1, "Enigma do Bill Cipher: Triângulo dos sonhos");
diarioStanford.adicionarEnigma(2, "Enigma do Gremloblin: Criatura da caverna");
diarioStanford.adicionarEnigma(3, "Enigma do Summerween Trickster: Doces amaldiçoados");
diarioStanford.adicionarEnigma(4, "Enigma do Gnomo: Segredos da floresta");
diarioStanford.adicionarEnigma(5, "Enigma do Manotaur: Força e coragem");


//criando o protagonista(Dipper)

const Dipper = new Protagonista("Dipper Pines",12);

//adicionando personagens à cabana
const cabana = new CabanaMistério(diarioStanford);
const Mabbel = new Personagem("Mabbel Pines", 14);
const Soos = new Personagem("Soos Ramirez", 22);
const Wendy = new Personagem("Wendy Corduroy", 15);
const weddles = new Personagem("Weddles", 30);
const Stan = new Personagem("Stanley Ford", 60);

cabana.personagens.push(Dipper);
cabana.personagens.push(Mabbel);
cabana.personagens.push(Soos);
cabana.personagens.push(Wendy);
cabana.personagens.push(weddles);
cabana.personagens.push(Stan);

//lista de visitantes genéricos
const visitantesGenericos = ["Tourist1", "Tourist2", "Tourist3"];
cabana.visitantes.push(...visitantesGenericos); //adiciona visitantes genéricos

//Personagens que são funcionários
cabana.funcionarios.push(Soos);
cabana.funcionarios.push(Wendy);
cabana.funcionarios.push(Stan);

//dipper acha o diário e decodifica os enigmas
console.log("\nDipper encontra o diário e tenta decodificar os enigmas...");

// Tentativa com autor incorreto
console.log("\nTentativa de decodificação com autor incorreto:");
let enigmaIncorreto = diarioStanford.decodificarEnigma("Mabel Pines", 1);

//tentativa certa
console.log("\nDipper decodfica os enigmas com o autor correto:");
for(let i = 1; i <=5; i++){
    let enigmacorreto = diarioStanford.decodificarEnigma("Stanford Ford",i);
    console.log(`Enigma ${i}: ${enigmacorreto}`);
}

//listando os funcionários da cabana
console.log("\n=== Funcionários da Cabana ===");
cabana.funcionarios.forEach(funcionario => {
    console.log(`Funcionário: ${funcionario.nome}, Idade: ${funcionario.idade}`);
});

