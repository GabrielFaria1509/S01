// --- Arquivo: Batalha.java ---
package org.exemple
import java.util.HashMap;

/**
 * Gerencia a arena de batalha.
 */
public class Batalha {

    // - (private) como no diagrama
    private HashMap<String, Boss> arena;

    /**
     * + (public) construtor
     */
    public Batalha() {
        this.arena = new HashMap<String, Boss>();
    }

    /**
     * + (public) como no diagrama
     */
    public void adicionarBoss(Boss boss) {
        this.arena.put(boss.getIdBoss(), boss);
        System.out.println("Boss '" + boss.nome + "' (ID: " + boss.getIdBoss() + ") adicionado à arena.");
    }

    /**
     * + (public) como no diagrama
     * REGRA 3: Deve usar o HashMap para localizar o Boss.
     */
    public void iniciarBatalha(String idBoss) {
        System.out.println("\n... Tentando iniciar batalha com ID: " + idBoss + " ...");

        Boss bossDaBatalha = this.arena.get(idBoss);

        if (bossDaBatalha != null) {
            bossDaBatalha.iniciarFase();
        } else {
            System.out.println("ERRO: Boss com ID '" + idBoss + "' não encontrado na arena!");
            System.out.println("----------------------------------------------");
        }
    }
}
