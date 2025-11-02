// --- Arquivo: CafeLeblanc.java ---

/**
 * EXERCÍCIO 3 (continuação): Implementar Composição.
 * A Cafeteria (CafeLeblanc) "TEM UM" Menu.
 * Esta é a classe principal que administra o cenário.
 */
public class CafeLeblanc {

    // O UML usa '_menu'. Em Java, isso geralmente significa private.
    private Menu _menu;

    // Construtor que implementa a composição.
    // A cafeteria *recebe* seu menu ao ser criada.
    public CafeLeblanc(Menu menu) {
        this._menu = menu;
    }

    /**
     * Método 'receberPedido' pedido no UML.
     * A lógica não foi especificada, então vou só simular
     * o recebimento e cálculo do preço.
     */
    public void receberPedido(Cafe cafe) {
        System.out.println("Recebendo pedido de: " + cafe.getNome());
        // Aqui eu usaria o polimorfismo!
        System.out.println("Preço final: R$ " + cafe.calcularPrecoFinal());
    }

    // Método auxiliar pra mostrar o cardápio todo
    public void mostrarCardapio() {
        System.out.println("--- Cardápio Cafe Leblanc ---");
        // Pego os itens do menu...
        for (Cafe cafe : this._menu.getItens()) {
            // ...e chamo o método polimórfico!
            // O Java vai saber qual 'calcularPrecoFinal' usar
            // (se é o do Cafe ou do CafeGourmet).
            System.out.println(
                    "Item: " + cafe.getNome() +
                            " | Preço: R$ " + cafe.calcularPrecoFinal()
            );
        }
        System.out.println("-----------------------------");
    }
}