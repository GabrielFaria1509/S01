// --- Arquivo: Cafe.java ---

/**
 * EXERCÍCIO 1: Implementar as classes Cafe e CafeGourmet.
 * Esta é a classe base (superclasse). O Sojiro quer diferenciar os tipos,
 * então essa é a classe genérica.
 */
public class Cafe {

    // O diagrama UML coloca '+' (public), mas atributos devem ser privados ou
    // protegidos. Vou usar 'protected' para que a subclasse 'CafeGourmet'
    // possa acessá-los diretamente.
    protected String nome;
    protected double precoBase;

    // Construtor pedido no UML
    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    /**
     * Calcula o preço final. Para um café comum, é apenas o preço base.
     * A classe filha (Gourmet) vai sobrescrever isso.
     * @return o preço final do café
     */
    public double calcularPrecoFinal() {
        return this.precoBase;
    }

    // Método auxiliar só pra facilitar a exibição no final
    public String getNome() {
        return nome;
    }
}