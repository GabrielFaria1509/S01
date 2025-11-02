package main.java.org.example;

public class personagem {
    private String nome;  
    private int idade;

    public personagem(String nome, int idade) {  //construtor
        this.nome = nome;
        this.idade = idade;
    }
    //setter do nome
    public void setNome(String nome){
        this.nome = nome;
    }
    
    public String getNome(){
        return this.nome;
    }
    
    public int getIdade(){
        return this.idade;
    }
}
