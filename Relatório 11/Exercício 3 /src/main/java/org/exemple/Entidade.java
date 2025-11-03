// --- Arquivo: Entidade.java ---

/**
 * Classe base abstrata para Alien e Youkai.
 */
public abstract class Entidade implements IRastreavel {
    public String nome;
    public String localizacao; // Onde foi avistado

    /**
     * Construtor da classe base 
     */
    public Entidade(String nome, String localizacao) {
        this.nome = nome;
        this.localizacao = localizacao;
    
   
    public String getNome() {
        return this.nome;
    }

    // Método abstrato da interface (sem alteração)
    @Override
    public abstract String obterCoordenadas();
}
