// --- Arquivo: BossMagico.java ---

/**
 * Herança (Extends Boss).
 */
package org.exemple
public class BossMagico extends Boss {

    /**
     * + (public) construtor
     */
    public BossMagico(String nome, String id, String fracoContra) {
        // 'super()' chama o construtor da classe mãe (Boss)
        super(nome, id, fracoContra);
    }

    /**
     * + (public) como no diagrama
     * Polimorfismo (@Override)
     */
    @Override
    public void iniciarFase() {
        // 1. Chama o comportamento da classe mãe
        super.iniciarFase();
        
        // 2. Adiciona o comportamento novo
        System.out.println(">>> " + this.nome + " está conjurando magias arcanas!");
        System.out.println("----------------------------------------------");
    }
}
