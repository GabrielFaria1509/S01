//Esquedrào implementa explorar território chamando explorarTerritório de cada soldado
//IExplorador é uma interface
//Soldado tem um ODM_Gear (composição)
//Soldado tem agregação com Esquadrão



class Soldado {
    // #gear: ODM_Gear (Usamos _gear por convenção de "protegido")
    constructor(nome, modeloGear) {
        this.nome = nome;
        // Composição: O Soldado CRIA e é dono do seu ODM_Gear.
        this._gear = new ODM_gear(modeloGear, 100);
    }

    explorarTerritorio() {  // Implementação da interface IExplorador
        console.log(`--- ${this.nome} está patrulhando a área.`);
        
        // DEMONSTRAÇÃO: Chamando a função do ODM_Gear (usarGas)
        if (this._gear.usarGas(10)) {
            return `${this.nome} explorou com sucesso.`;
        } else {
            return `${this.nome} não pode explorar (sem gás).`;
        }
    }

    verificarEquipamento() {
        // Chamando a função do ODM_Gear (getGas)
        const status = `[${this.nome}] Gás restante: ${this._gear.getGas()}`;
        return status;
    }
}

class Esquadrão {
    constructor(lider, membrosIniciais = []) {
        this.lider = lider;
        // Agregação: O Esquadrão RECEBE os Soldados, não os cria.
        this.membrosIniciais = membrosIniciais;
    }

    adicionarMembro(soldado) {
        console.log(`\n[Esquadrão] Adicionando ${soldado.nome} ao esquadrão.`);
        this.membrosIniciais.push(soldado);
    }

    relatarStatus() {
        console.log(`\n===== Status do Esquadrão (Líder: ${this.lider.nome}) =====`);
        const statusArray = this.membrosIniciais.map(membro => {
            const statusMembro = membro.verificarEquipamento();
            console.log(statusMembro);
            return statusMembro;
        });
        console.log("==================================================");
        return statusArray;
    }

    //usa interface IExplorador
    explorarTerritorio() {
        console.log(`\n===== Esquadrão iniciando exploração! =====`);
        this.membrosIniciais.forEach(membro => {
            membro.explorarTerritorio(); // Delega a ação para cada membro
        });
        console.log("==========================================");
        return "Exploração do esquadrão concluída.";
    }
}

class ODM_gear {
   
    constructor(modelo, gasRestante) {
        this.modelo = modelo;
        this._gasRestante = gasRestante; //atributo protegido , ou seja , não acessível diretamente fora da classe
    }

    usarGas(quantidade) {
        if (quantidade <= this._gasRestante) {
            this._gasRestante -= quantidade;
            console.log(`[ODM_Gear] Usou ${quantidade} de gás. Restam ${this._gasRestante}.`);
            return true;
        }
        console.log(`[ODM_Gear] Gás insuficiente!`);
        return false;
    }

    getGas() {   // Método público para acessar o gás restante
        return this._gasRestante;
    }
}


// ======================================================
// DEMONSTRAÇÃO DE USO
// ======================================================

// 1. Criar os Soldados
const levi = new Soldado("Levi", "Modelo Padrão");
const mikasa = new Soldado("Mikasa", "Modelo Avançado");
const armin = new Soldado("Armin", "Modelo Leve");

// 2. Criar o Esquadrão (Agregação)
const esquadraoLevi = new Esquadrão(levi, [levi, mikasa, armin]);

// 3. Relatar status inicial
esquadraoLevi.relatarStatus();

// 4. DEMONSTRAÇÃO PRINCIPAL
// Chamar explorarTerritorio() do Esquadrão,
// que chama explorarTerritorio() de cada Soldado,
// que por sua vez chama usarGas() do ODM_Gear.
esquadraoLevi.explorarTerritorio();

// 5. Relatar status final (para ver o gás diminuir)
esquadraoLevi.relatarStatus();
