package main
import "fmt"

func fibonacci(n int){
	if n <= 0 {
		fmt.Println("Digite um número maior que 0")
		return
	}

	// imprime os dois primeiros números
	if n >= 1 {
		fmt.Print("[0]")
	}
	if n >= 2 {
		fmt.Print(",[1]")
	}

	num1, num2 := 0, 1
	for i := 3; i <= n; i++ {
		num3 := num1 + num2
		fmt.Print(",[", num3, "]")
		num1, num2 = num2, num3
	}
	fmt.Println() // quebra de linha no final
}

func main() {
	fmt.Print("Digite um numero: ")
	var n int
	fmt.Scanln(&n)

	fibonacci(n)
}
