// --- Arquivo: Menu.java ---

// EXERCÍCIO 4: Gerenciar itens com ArrayList. Preciso importar.
import java.util.ArrayList;

/**
 * EXERCÍCIO 3: Implementar Composição.
 * O Menu "TEM" Cafés. Isso é composição.
 * Esta classe vai gerenciar a lista de cafés disponíveis.
 */
public class Menu {

    // O UML indica '-' (private) para 'itens'.
    private ArrayList<Cafe> itens;

    /**
     * Construtor pedido no UML.
     * Ele recebe uma lista de itens. Na prática, talvez fosse melhor
     * começar com uma lista vazia, mas vou seguir o diagrama.
     */
    public Menu(ArrayList<Cafe> itens) {
        this.itens = itens;
    }

    // Construtor alternativo (e mais comum) que inicializa a lista vazia.
    // O exercício não pede, mas é uma boa prática.
    public Menu() {
        this.itens = new ArrayList<Cafe>();
    }

    /**
     * EXERCÍCIO 4 (continuação): Método para gerenciar os itens.
     * Adiciona um novo café ao menu.
     */
    public void adicionarItem(Cafe cafe) {
        this.itens.add(cafe);
    }

    // Método auxiliar pra gente poder testar e ver os itens
    public ArrayList<Cafe> getItens() {
        return this.itens;
    }
}