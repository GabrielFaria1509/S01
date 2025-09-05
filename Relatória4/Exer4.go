package main
import "fmt"

func verificarLogin(usuario,senha string)bool{
	if(usuario== "senha" && senha == "admin"){
		return true
	}else{
		return false
	}
		
}

func main() {
	contador :=0
	var usuario string
	var senha string
	for contador >= 0{
		fmt.Println("Digite o usuario")
		fmt.Scan(&usuario)
		fmt.Println("Digite a senha")
		fmt.Scan(&senha)

	var resultado = verificarLogin(usuario,senha)
		if resultado == true{
			fmt.Println("Login bem-sucedido")
			println("Bem vindo :",usuario,".","A sua senha eh :",senha)
			break
		}else{
			fmt.Println("Usuario ou senha incorretos.Tente novamente.")
		}
		
	}
}
