// --- Arquivo: Poder.java ---

/**
 * Classe que representa o poder de uma entidade.
 */
public class Poder {
    // CORREÇÃO: O UML indica '+' (public) para 'nome'.
    public String nome;

    // Construtor pedido no UML
    public Poder(String nome) {
        this.nome = nome;
    
    // já que 'nome' é público.

    @Override
    public String toString() {
        // Acesso direto ao atributo público.
        return this.nome;
    }
}
