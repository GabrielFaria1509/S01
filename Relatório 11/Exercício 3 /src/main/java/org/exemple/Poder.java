// --- Arquivo: Poder.java ---
package org.example;
public class Poder {
    // + (public) como no diagrama
    public String nome;

    // + (public) como no diagrama
    public Poder(String nome) {
        this.nome = nome;
    }

    @Override
    public String toString() {
        return this.nome;
    }
}
