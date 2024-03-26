package main

import (
    "fmt"
    "sort"
)

func main() {
    valor := 37
    contarNotas(valor)
}

func contarNotas(valor int) {
	if valor < 0 {
        fmt.Println("Valor inválido. O valor deve ser positivo.")
        return
    }

    notasDisponiveis := []int{200, 100, 50, 20, 10, 5, 2}
	sort.Sort(sort.Reverse(sort.IntSlice(notasDisponiveis)))

    quantidadeNotas := make(map[int]int)

    resto := valor
    for _, nota := range notasDisponiveis {
        quantidade := resto / nota
        if quantidade > 0 {
            quantidadeNotas[nota] = quantidade
            resto %= nota
        }
    }

    if resto == 0 {
        fmt.Println("Quantidade de notas necessárias:")
        for nota, quantidade := range quantidadeNotas {
            fmt.Printf("%d: %d\n", nota, quantidade)
        }
    } else {
        fmt.Println("Valor indisponível para saque.")
    }
}
