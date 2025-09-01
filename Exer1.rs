use std::io;

fn verificar_senha(senha: &str) -> bool {
    if senha.len() < 8 {
        return false;
    }

    if !senha.chars().any(|c| c.is_ascii_digit()) {
        return false;
    }

    if !senha.chars().any(|c| c.is_uppercase()) {
        return false;
    }

    true
}

fn main() {
    loop {           //loop até a pessoa acertar a senha com os requisitos
        let mut entrada = String::new();
        io::stdin()
            .read_line(&mut entrada)
            .expect("Falha ao ler a entrada");

        let senha = entrada.trim();

        if verificar_senha(senha) {
            println!("Senha válida! Acesso concedido.");
            break; // sai do loop quando a senha é válida
        } else {
            println!("Tente novamente, senha inválida.");
        }
    }
}
