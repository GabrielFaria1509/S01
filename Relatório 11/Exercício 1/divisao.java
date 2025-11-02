package main.java.org.example;

public class divisao {  //divisao tem composição com castelo
    public String nome;

    // Construtor package-private - só o castelo pode criar divisões
    divisao(String nome){
        this.nome = nome;
    }
    
    public String getNome(){
        return this.nome;
    }
}
