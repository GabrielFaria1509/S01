// --- Arquivo: Entidade.java ---
/**
 * Classe base abstrata.

 */
package org.example;

public abstract class Entidade implements IRastreavel {

    // + (public) como no diagrama
    public String nome;

    // - (private) como no diagrama
    private String localizacao;

    /**
     * Construtor da classe base.
     * O construtor no UML '(nome, local, poder)' não faz sentido
     * para a classe 'Alien'. Vou usar o construtor lógico.
     */
    public Entidade(String nome, String localizacao) {
        this.nome = nome;
        this.localizacao = localizacao;
    }

    /**
     * ADIÇÃO NECESSÁRIA:
     * Como 'localizacao' é PRIVATE, a classe filha 'Alien'
     * não pode acessá-la. Ela precisa deste método "getter"
     * para poder implementar 'obterCoordenadas()'.
     */
    public String getLocalizacao() {
        return this.localizacao;
    }

    // Método auxiliar (ok, pois 'nome' é public)
    public String getNome() {
        return this.nome;
    }

    // + (public) como no diagrama
    @Override
    public abstract String obterCoordenadas();
}
