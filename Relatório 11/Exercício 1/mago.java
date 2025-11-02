package main.java.org.example;

public class mago extends personagem {
    private String magia;

    public mago(String nome, int idade, String magia){
        super(nome, idade);
        this.magia = magia;
    }
    
    public String getMagia(){
        return this.magia;
    }
}
