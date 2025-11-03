// --- Arquivo: Main.java ---
package org.example;
public class Main {
    public static void main(String[] args) {
        // 1. Poderes
        Poder poderFogo = new Poder("Pirocinese");
        Poder poderMente = new Poder("Telepatia");

        // 2. Entidades
        Entidade youkai1 = new Youkai("Kitsune", "Floresta de Aokigahara", poderFogo);
        Entidade alien1 = new Alien("Zorg", "Area 51, Nevada", "Marte", "Disco Prateado");

        // 3. Teste de duplicidade
        Entidade youkai2 = new Youkai("Kitsune", "Templo Fushimi Inari", poderMente);

        // 4. Registro
        RegistroOculto registro = new RegistroOculto("Detetives Ocultos");
        registro.registrarAvistamento(youkai1); // SUCESSO
        registro.registrarAvistamento(alien1);  // SUCESSO
        registro.registrarAvistamento(youkai2); // FALHA

        // 5. Listar
        registro.listarAvistamentos();
    }
}
