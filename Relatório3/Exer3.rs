use std::io;
fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
  for i in limite_inferior..=limite_superior {  //loop entre os limites
    println!("{} x {} = {}", numero, i, numero * i); //imprime a tabuada
  }
}

fn main() {
  println!("Digite o numero base da tabuada: ");
  let mut numero = String::new(); //variavel para armazenar o valor base
  io::stdin()
    .read_line(&mut numero)
    .expect("Falha ao ler o valor");
  let numero: i32 = numero.trim().parse().expect("Digite um numero inteiro valido"); //converte a string para inteiro

  println!("Digite o limite inferior: ");
  let mut limite_inferior = String::new(); //variavel para armazenar o limite inferior
  io::stdin()
    .read_line(&mut limite_inferior)
    .expect("Falha ao ler o valor");

  //converter a string para inteiro
  let limite_inferior: i32 = limite_inferior.trim().parse().expect("Digite um numero inteiro valido");

  println!("Digite o limite superior: ");
  let mut limite_superior = String::new(); 
  io::stdin()
    .read_line(&mut limite_superior)
    .expect("Falha ao ler o valor");
  //converter para inteiro
  let limite_superior: i32 = limite_superior.trim().parse().expect("Digite um numero inteiro valido");

  //chamda função
  imprimir_tabuada(numero, limite_inferior, limite_superior);
}
