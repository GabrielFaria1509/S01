// --- Arquivo: CafeGourmet.java ---

/**
 * EXERCÍCIO 1 (continuação): Usar herança para especializar Cafe.
 * CafeGourmet É UM Cafe, então usamos 'extends'.
 */
public class CafeGourmet extends Cafe {

    // Atributo específico da classe filha
    protected double bonusAroma;

    /**
     * Construtor pedido no UML.
     * Preciso receber os dados da classe 'Cafe' (nome, preco) e o bônus.
     */
    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        // Tenho que chamar o construtor da classe mãe (super) primeiro.
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    /**
     * EXERCÍCIO 2: Usar Polimorfismo (@Override).
     * Aqui está a especialização do método. O 'final' no nome do método
     * do exercício ("calcularPrecoFinal") deve ser só parte do nome,
     * e não a palavra-chave 'final' do Java, senão eu não poderia sobrescrever.
     */
    @Override
    public double calcularPrecoFinal() {
        // O preço do gourmet é o preço base (que está na classe mãe)
        // mais o bônus pelo aroma.
        // Como 'precoBase' é protected, posso acessar diretamente.
        return this.precoBase + this.bonusAroma;
    }
}