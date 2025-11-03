// --- Arquivo: Main.java ---
package org.exemple

public class Main {

    public static void main(String[] args) {
        
        // --- 1. Criando os Ataques ---
        PadrãoAtaque investida = new PadrãoAtaque("Investida Brutal", 25);
        PadrãoAtaque terremoto = new PadrãoAtaque("Terremoto", 40);
        PadrãoAtaque bolaDeFogo = new PadrãoAtaque("Bola de Fogo", 30);
        PadrãoAtaque nevasca = new PadrãoAtaque("Nevasca", 50);

        // --- 2. Criando os Bosses ---
        // Construtor Boss(nome, id, fracoContra)
        Boss golem = new Boss("Golem de Pedra", "B-001", "Água");
        Boss lich = new BossMagico("Lich Ancestral", "B-002", "Luz");

        // --- 3. Adicionando ataques ---
        golem.adicionarAtaque(investida);
        golem.adicionarAtaque(terremoto);
        lich.adicionarAtaque(bolaDeFogo);
        lich.adicionarAtaque(nevasca);
        
        System.out.println("\n=============================================\n");

        // --- 4. Criando a Batalha ---
        Batalha arenaPrincipal = new Batalha();

        // --- 5. Adicionando Bosses ---
        arenaPrincipal.adicionarBoss(golem);
        arenaPrincipal.adicionarBoss(lich);

        // --- 6. Iniciando Batalhas ---
        arenaPrincipal.iniciarBatalha("B-001");
        arenaPrincipal.iniciarBatalha("B-002");
        arenaPrincipal.iniciarBalha("B-999");
    }
}
