package main //tem que ter
import "fmt" //tem que ter para printar frases etc

func classificar_numero(num int) string {
	if num > 0 {
		return "Positivo"
	}
	if num < 0 {
		return "Negativo"
	}
	return "Zero" // só chega aqui se for 0
}

func main() {
	fmt.Print("Digite um numero: ")
	var num int
	fmt.Scanln(&num)

	resultado := classificar_numero(num)
	fmt.Println("Classificação:", resultado)
}
