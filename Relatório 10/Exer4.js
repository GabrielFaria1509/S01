//classe base
//hunter implenta a interface IRastrearLocal
class Hunter{
    //atributos nome,idade,localização são proteceted
    constructor(nome,idade,lat,long){
        this._nome = nome;
        this._idade = idade;
        this._localizacao = {lat, long};
    }

    rastrearLocal(){
        console.log(`[Hunter] ${this._nome} está na localização -> Latitude ${this._localizacao.lat}, Longitude ${this._localizacao.long}.`);
    }
}

//classe filha de Hunter
class Especialista extends Hunter{
    //atributo exclusivo protegido : habilidadeNen
    constructor(nome,idade,lat,long,habilidadeNen){  //tem as normais de Hunter e a exclusiva de Especialista
        super(nome,idade,lat,long); //herda de Hunter
        this._habilidadeNen = habilidadeNen;
    }

    rastrearLocal(){
        console.log(`[Especialista] ${this._nome} está na localização -> Latitude ${this._localizacao.lat}, Longitude ${this._localizacao.long}. usando de sua habilidade : ${this._habilidadeNen}.`);
    }
}

class Manipulador extends Hunter{
    //atributo exclusivo protegido : alvoAtual
    constructor(nome, idade, lat, long, alvoAtual){  //tem as normais de Hunter e a exclusiva de Especialista
        super(nome, idade, lat, long); //herda de Hunter
        this._alvoAtual = alvoAtual;
    }

    rastrearLocal(){
        console.log(`[Manipulador] ${this._nome} está na localização -> Latitude ${this._localizacao.lat}, Longitude ${this._localizacao.long}. procurando por ${this._alvoAtual}.`);
    }
}

class Batalhao{  //deve iterar sobre o set de hunters e chamar rastrear local em cada um , exibindo a localização
    //atributo privado e de set -> #hunters : Set<Hunter>
    #hunters;
    constructor(){
        this.#hunters = new Set();  //método set para inicializar o atributo privado
        //set garante que não haverá hunters duplicados
    }

    adicionarHunter(hunter){  //método público para adicionar hunter ao batalhão
        this.#hunters.add(hunter);
    }

    getNumHunters(){  //método público para acessar o número de hunters no batalhão
        return this.#hunters.size;
    }

    //iniciar rastreamento devolve um array de strings com as localizações rastreadas
    iniciarRastreamento(){
        console.log("\n=== Iniciando o rastreamento do batalhão ===");
        for(const hunter of this.#hunters){
            hunter.rastrearLocal();
        };
        
    }
}

//Teste
console.log("\n=== Iniciando o rastreamento do batalhão ===");
console.log("Listando hunters...")

const batalhao = new Batalhao(); //batalhão dos hunters

// Criando hunters reais da obra Hunter x Hunter
const gon = new Hunter("Gon Freecss", 12, -23.5505, -46.6333);
const killua = new Hunter("Killua Zoldyck", 12, 35.6762, 139.6503);

// Especialistas
const kurapika = new Especialista("Kurapika", 17, 40.7128, -74.0060, "Correntes do Julgamento");
const netero = new Especialista("Isaac Netero", 110, 51.5074, -0.1278, "100-Type Guanyin Bodhisattva");

// Manipuladores
const illumi = new Manipulador("Illumi Zoldyck", 24, 35.6762, 139.6503, "Killua Zoldyck");
const shalnark = new Manipulador("Shalnark", 26, 48.8566, 2.3522, "Genei Ryodan");

// Adicionando hunters ao batalhão
batalhao.adicionarHunter(gon);
batalhao.adicionarHunter(killua);
batalhao.adicionarHunter(kurapika);
batalhao.adicionarHunter(netero);
batalhao.adicionarHunter(illumi);
batalhao.adicionarHunter(shalnark);

console.log(`\nTotal de hunters no batalhão: ${batalhao.getNumHunters()}`);

// Iniciando rastreamento
batalhao.iniciarRastreamento();



