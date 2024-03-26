## Teste 1
O código na linguagem Go implementa uma função chamada contarNotas que calcula a quantidade de notas de dinheiro necessárias para representar um determinado valor monetário. A função começa verificando se o valor é positivo e, se não for, imprime uma mensagem de erro e retorna. Em seguida, há uma lista de notas disponíveis em ordem decrescente de valor, que é usada para calcular a quantidade de cada nota necessária.

O código percorre essa lista de notas disponíveis e, para cada uma delas, calcula quantas vezes ela pode ser usada para compor o valor desejado. Isso é feito através da divisão inteira do valor pelo valor da nota. Se a quantidade resultante for maior que zero, significa que é possível usar essa nota para compor parte do valor desejado. Essa quantidade de notas é armazenada em um mapa onde a chave é o valor da nota e o valor é a quantidade de notas.

Após percorrer todas as notas disponíveis, o código verifica se houve algum resto após o cálculo. Se não houver resto, significa que o valor foi totalmente representado pelas notas disponíveis, então ele imprime a quantidade de cada nota necessária. Caso contrário, imprime uma mensagem indicando que o valor não pode ser representado exatamente com as notas disponíveis.

O código utiliza a função sort.Sort() para ordenar a lista de notas disponíveis em ordem decrescente, o que facilita o processo de cálculo, pois sempre tenta usar as notas de maior valor primeiro.

## Teste 2

O código SQL seleciona o ID de cadastro, a descrição do dia da semana e o total de horas trabalhadas para cada usuário em cada dia da semana. O código garante que, mesmo se não houver registros de horas trabalhadas para um usuário em um determinado dia, tenhamos uma linha com o valor 0 para as horas trabalhadas. O resultado final é ordenado primeiro pelo ID de cadastro e depois pela descrição do dia da semana.

A subconsulta `(SELECT DISTINCT CadastroId FROM HorariosTrabalho) dt` é utilizada para obter uma lista de IDs de cadastro distintos da tabela HorariosTrabalho para garantir que tenhamos todos os usuários incluídos na consulta, mesmo que eles não tenham registros de horas trabalhadas.

O `CROSS JOIN` com a tabela DiasSemana garante que tenhamos todas as combinações possíveis entre os IDs de cadastro e os dias da semana.

O `LEFT JOIN` com a tabela HorariosTrabalho é utilizado para unir os dados de horas trabalhadas com as combinações de IDs de cadastro e dias da semana `ht.DiaId = ds.DiaId` e `dt.CadastroId = ht.CadastroId`.

Os resultados foram agrupados pelo ID de cadastro e pela descrição do dia da semana para calcular o total de horas trabalhadas para cada usuário em cada dia da semana.

Os resultados são ordenados primeiro pelo ID de cadastro e, em seguida, pela descrição do dia da semana através.


