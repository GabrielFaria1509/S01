// --- Arquivo: Main.java ---

// Importando só para o ArrayList de inicialização

import java.util.ArrayList;

/**
 * Classe principal para testar todo o sistema.
 * Vou criar os cafés, o menu e a cafeteria.
 */
public class Main {

    public static void main(String[] args) {
        // 1. Criar os objetos de Cafe
        // (nome, precoBase)
        Cafe cafeComum = new Cafe("Café da Casa", 5.0);

        // (nome, precoBase, bonusAroma)
        Cafe cafeGourmet = new CafeGourmet("Blue Mountain", 8.0, 3.0);
        Cafe outroGourmet = new CafeGourmet("Blend Especial", 7.0, 2.0);


        // 2. Criar o Menu (Vou usar o construtor vazio)
        Menu cardapio = new Menu();

        // 3. Adicionar os cafés ao menu (Passo 4)
        cardapio.adicionarItem(cafeComum);
        cardapio.adicionarItem(cafeGourmet);
        cardapio.adicionarItem(outroGourmet);

        // 4. Criar a Cafeteria com esse menu (Passo 3 - Composição)
        CafeLeblanc cafeteria = new CafeLeblanc(cardapio);

        // 5. Testar!
        // Vou chamar o método que criei para mostrar o cardápio.
        // Isso vai provar que o Polimorfismo (Passo 2) está funcionando.
        cafeteria.mostrarCardapio();

        /*
         * Saída esperada:
         * --- Cardápio Cafe Leblanc ---
         * Item: Café da Casa | Preço: R$ 5.0  (usou o método da classe Cafe)
         * Item: Blue Mountain | Preço: R$ 11.0 (usou o método da CafeGourmet: 8.0 + 3.0)
         * Item: Blend Especial | Preço: R$ 9.0 (usou o método da CafeGourmet: 7.0 + 2.0)
         * -----------------------------
         */
    }
}