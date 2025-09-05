use std::io; //necessário para usar o io::stdin
fn eh_par(numero: i32) -> bool{
  if numero % 2 == 0{
    return true;
  }else{
    return false;
  }
}

fn main(){
  //jogador 1 vai digitar um numero
  println!("Digite um numero : ");
  let mut jog1 = String::new();
  io::stdin()
    .read_line(&mut jog1)
    .expect("Falha ao ler a entrada");
  //conversão para número inteiro
  let jog1: i32 = jog1.trim().parse().expect("Por favor digite um numero");
  //jogador 2 vai digitar um número inteiro

  println!("Jogador 1 escolha par ou impar : ");
  let mut escolha1 = String::new();
  io::stdin()
    .read_line(&mut escolha1)
    .expect("Falha ao ler a entrada");
  //jogador um vai chutar se a soma é par ou impar
  let escolha1 = escolha1.trim(); // precisa remover o \n

  println!("Digite um numero : ");
  let mut jog2 = String::new();
  io::stdin()
    .read_line(&mut jog2)
    .expect("Falha ao ler a entrada");
  //conversão para número inteiro
  let jog2: i32 = jog2.trim().parse().expect("Por favor digite um numero");

  let soma = jog1 + jog2;

  eh_par(soma);
  if eh_par(soma) == true && escolha1 == "par" {
    println!("Jogador 1 ganhou");
  } else if eh_par(soma) == false && escolha1 == "impar" {
    println!("Jogador 1 ganhou");
  } else {
    println!("Jogador 2 ganhou");
  }
}
