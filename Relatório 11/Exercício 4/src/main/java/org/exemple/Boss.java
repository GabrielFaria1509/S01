// --- Arquivo: Boss.java ---
package exemple.org

import java.util.LinkedHashSet;

/**
 * Classe base (superclasse) para os chefes.

 */
public class Boss {
    
    // + (public) como no diagrama
    public String nome;
    
    // - (private) como no diagrama (conforme sua correção)
    private String idBoss; 

    // - (private) como no diagrama
    private String PontoFraco; 

    // '_moveset' (private) como no diagrama
    private LinkedHashSet<PadrãoAtaque> moveset;

    /**
     * + (public) construtor
     * Parâmetros 'id' e 'fracoContra' como no diagrama.
     */
    public Boss(String nome, String id, String fracoContra) {
        this.nome = nome;
        
        // Atribui ao campo private 'idBoss'
        this.idBoss = id; 
        
        // Atribui ao campo private 'PontoFraco'
        this.PontoFraco = fracoContra; 
        
        this.moveset = new LinkedHashSet<PadrãoAtaque>();
    }

    /**
    
    public String getIdBoss() {
        return this.idBoss;
    }

    // + (public) como no diagrama
    public void adicionarAtaque(PadrãoAtaque ataque) {
        this.moveset.add(ataque);
        System.out.println("Ataque '" + ataque.nome + "' adicionado ao Boss " + this.nome);
    }

    // + (public) como no diagrama
    public void iniciarFase() {
        System.out.println("\n--- INICIANDO FASE DO BOSS: " + this.nome + " ---");
        System.out.println("Ponto fraco: " + this.PontoFraco); 
        System.out.println("Moveset:");
        
        for (PadrãoAtaque ataque : this.moveset) {
            System.out.println("- " + ataque.nome + " (" + ataque.dano + " de dano)");
        }
    }
}
