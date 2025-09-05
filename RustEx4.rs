use std::io;
fn calcular_media(nota1: f64, nota2: f64, nota3: f64) {  //função
  let soma = nota1*2.0 + nota2*3.0 + nota3*5.0;
  let media = soma / 10.0;
  if media >= 7.0 {
    println!("Aprovado");
  } else {
    println!("Reprovado");
  }
}

fn main() {
  println!("Digite a primeira nota : ");  //entrada de dados
  let mut nota1 = String::new();
  io::stdin().read_line(&mut nota1).expect("Falha ao ler a entrada");
  let nota1: f64 = nota1.trim().parse().expect("Erro ao converter para f64");

  println!("Digite a segunda nota : ");
  let mut nota2 = String::new();
  io::stdin().read_line(&mut nota2).expect("Falha ao ler a entrada");
  let nota2: f64 = nota2.trim().parse().expect("Erro ao converter para f64");

  println!("Digite a terceira nota : ");
  let mut nota3 = String::new();
  io::stdin().read_line(&mut nota3).expect("Falha ao ler a entrada");
  let nota3: f64 = nota3.trim().parse().expect("Erro ao converter para f64");

  // Chamada da função para calcular a média
  calcular_media(nota1, nota2, nota3);
}
