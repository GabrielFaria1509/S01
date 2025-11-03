// --- Arquivo: Alien.java ---
/**
 * Classe Alien.
 * Esta classe NÃO esconde os campos, ela usa os da classe mãe.
 */
package org.example;
public class Alien extends Entidade {

    // - (private) como no diagrama
    private String planetaOrigem;
    
    // - (private) como no diagrama
    private String Ovni;

    /**
     * + (public) construtor
     * O diagrama '(nome, planeta, Ovni)' está incompleto.
     * Precisa receber 'localizacao' para passar para o super().
     */
    public Alien(String nome, String localizacao, String planetaOrigem, String Ovni) {
        // 1. Chama a mãe para definir 'nome' (public)
        //    e 'localizacao' (private) na superclasse.
        super(nome, localizacao);
        
        // 2. Define seus campos 'private'
        this.planetaOrigem = planetaOrigem;
        this.Ovni = Ovni;
    }

    // + (public) como no diagrama
    @Override
    public String obterCoordenadas() {
        // CORREÇÃO CRÍTICA:
        // Usa 'this.nome' (o 'public' herdado)
        // Usa 'super.getLocalizacao()' (o 'getter' para o 'private' da mãe)
        return "ALIEN: " + this.nome +
               " | Coordenadas: " + super.getLocalizacao() +
               " | Planeta: " + this.planetaOrigem;
    }
}
