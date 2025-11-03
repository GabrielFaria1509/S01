// --- Arquivo: RegistroOculto.java ---
import java.util.HashMap;
package org.example;

/**
 * EXERCÍCIO 4: Classe de Registros.
 */
public class RegistroOculto {

    // + (public) como no diagrama
    public String nomeEquipe;

    // '_' (private)
    // O tipo no UML 'HashMap<Entidade, String>' está errado
    // pela regra 4 ("identificada pelo NOME").
    // O correto é <String, Entidade>
    private HashMap<String, Entidade> avistamentos;

    // + (public) construtor
    public RegistroOculto(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<String, Entidade>();
    }

    /**
     * + (public) como no diagrama
     * O UML '(entidade, nome)' é redundante.
     * Vou usar só 'entidade' e pegar o 'entidade.nome'.
     */
    public boolean registrarAvistamento(Entidade entidade) {
        // Usa o campo 'nome' (que é public em Entidade e Youkai)
        String chaveNome = entidade.nome;

        if (this.avistamentos.containsKey(chaveNome)) {
            System.out.println("FALHA: Entidade '" + chaveNome + "' já está no registro.");
            return false;
        } else {
            this.avistamentos.put(chaveNome, entidade);
            System.out.println("SUCESSO: Entidade '" + chaveNome + "' registrada.");
            return true;
        }
    }

    // Método auxiliar para teste
    public void listarAvistamentos() {
        System.out.println("\n--- REGISTRO OCULTO DA EQUIPE: " + this.nomeEquipe + " ---");
        for (Entidade e : this.avistamentos.values()) {
            // Polimorfismo!
            System.out.println(e.obterCoordenadas());
        }
        System.out.println("----------------------------------------------\n");
    }
}
