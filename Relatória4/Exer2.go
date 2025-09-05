package main //tem que ter
import "fmt" //tem que ter para printar frases etc



func main() {
	fmt.Print("Digite um numero: ")
	var num int
	fmt.Scanln(&num)

	var resto int = num % 2

	if resto == 0 {
		fmt.Println("O num eh par")
	}else{
		fmt.Println("O num eh impar")
	}
}
