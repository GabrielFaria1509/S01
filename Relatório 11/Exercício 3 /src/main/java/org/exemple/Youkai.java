
// --- Arquivo: Youkai.java ---
/**
 * Classe Youkai.
 * Esta classe "esconde" (hides) os campos da classe mãe.
 * Ela tem SEUS PRÓPRIOS campos 'nome' e 'localizacao'.
 */
package org.example;

public class Youkai extends Entidade {

    // + (public) como no diagrama 'Youkai'
    public String nome;

    // - (private) como no diagrama 'Youkai'
    private String localizacao;

    // '_' (private, como discutido)
    private Poder poder;

    // + (public) construtor
    public Youkai(String nome, String localizacao, Poder poder) {
        // 1. Chama o construtor da mãe
        super(nome, localizacao);

        // 2. Define SEUS PRÓPRIOS campos
        this.nome = nome;
        this.localizacao = localizacao;
        this.poder = poder;
    }

    // + (public) como no diagrama
    @Override
    public String obterCoordenadas() {
        // Este método usa os campos PRÓPRIOS do Youkai
        // (o 'this.nome' public e o 'this.localizacao' private)
        return "YOUKAI: " + this.nome +
               " | Coordenadas: " + this.localizacao +
               " | Poder Detectado: " + this.poder.nome;
    }
}
