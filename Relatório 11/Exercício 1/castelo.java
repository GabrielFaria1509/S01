package main.java.org.example;

import java.util.ArrayList;

public class castelo {
    public String nome;
    //divisões é um array list
    private ArrayList<divisao> divisoes;

    public castelo(String nome){
        this.nome = nome;
        this.divisoes = new ArrayList<divisao>();
    }
    
    // Método para criar divisão - composição forte
    public void criarDivisao(String nomeDivisao){
        divisao novaDivisao = new divisao(nomeDivisao);
        divisoes.add(novaDivisao);
    }
    
    //Cria as divisões
    public ArrayList<divisao> getDivisoes(){
        return divisoes;
    }

}
