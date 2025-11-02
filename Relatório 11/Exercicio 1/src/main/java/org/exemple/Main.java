package main.java.org.example;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        // Criação do castelo
        System.out.println("Digite o nome do castelo: ");
        String nomeCastelo = scanner.nextLine();
        castelo castelo = new castelo(nomeCastelo);

        System.out.println("Quantas divisões tem o castelo? ");
        int numDivisoes = scanner.nextInt();
        scanner.nextLine(); // limpa buffer

        for(int i = 0; i < numDivisoes; i++){
            System.out.println("Digite o nome da divisão " + (i+1) + ": ");
            String nomeDivisao = scanner.nextLine();
            castelo.criarDivisao(nomeDivisao);
        }

        for(int i = 0; i < numDivisoes; i++){
            System.out.println("Divisão " + (i+1) + ": " + castelo.getDivisoes().get(i).getNome());
        }

        // Criação do mago
        System.out.println("Digite o nome do mago: ");
        String nomeMago = scanner.nextLine();
        System.out.println("Digite a idade do mago: ");
        int idadeMago = scanner.nextInt();
        scanner.nextLine(); // limpa buffer
        System.out.println("Digite o nome da magia: ");
        String magiaMago = scanner.nextLine();
        
        mago mago = new mago(nomeMago, idadeMago, magiaMago);

        // Exibição dos resultados
        System.out.println("O mago " + mago.getNome() + " usa a magia: " + mago.getMagia());
        System.out.println("O mago " + mago.getNome() + " tem " + mago.getIdade() + " anos");
        System.out.println("O castelo " + castelo.nome + " possui " + numDivisoes + " divisões");
        
        scanner.close();
    }
}
