# Desafio programação - para vaga Back-end Blu

## Descrição do projeto

A aplicação é uma interface web que aceita upload do [arquivo CNAB](https://github.com/Pagnet/desafio-back-end/blob/master/CNAB.txt) via formulário, interpreta o arquivo recebido, normaliza os dados, armazena-os em um banco de dados SQLite e exiba essas informações em tela. Essas informações contém uma lista das operações importadas por lojas, e um totalizador do saldo em conta de cada loja,
onde saldos negativos são representados entre parênteses para uma leitura mais agradável.

# Documentação do arquivo CNAB

| Descrição do campo  | Inicio | Fim | Tamanho | Comentário
| ------------- | ------------- | -----| ---- | ------
| Tipo  | 1  | 1 | 1 | Tipo da transação
| Data  | 2  | 9 | 8 | Data da ocorrência
| Valor | 10 | 19 | 10 | Valor da movimentação. *Obs.* O valor encontrado no arquivo precisa ser divido por cem(valor / 100.00) para normalizá-lo.
| CPF | 20 | 30 | 11 | CPF do beneficiário
| Cartão | 31 | 42 | 12 | Cartão utilizado na transação 
| Hora  | 43 | 48 | 6 | Hora da ocorrência atendendo ao fuso de UTC-3
| Dono da loja | 49 | 62 | 14 | Nome do representante da loja
| Nome loja | 63 | 81 | 19 | Nome da loja

# Documentação sobre os tipos das transações

| Tipo | Descrição | Natureza | Sinal |
| ---- | -------- | --------- | ----- |
| 1 | Débito | Entrada | + |
| 2 | Boleto | Saída | - |
| 3 | Financiamento | Saída | - |
| 4 | Crédito | Entrada | + |
| 5 | Recebimento Empréstimo | Entrada | + |
| 6 | Vendas | Entrada | + |
| 7 | Recebimento TED | Entrada | + |
| 8 | Recebimento DOC | Entrada | + |
| 9 | Aluguel | Saída | - |


<br>
<hr>

## Para executar o projeto é necessário ter:

<table>
    <tr>
        <td>Ferramenta</td>
        <td>Versão</td>
    </tr>
    <tr>
        <td>Ruby</td>
        <td>2.6.5</td>
    </tr>
    <tr>
        <td>Rails</td>
        <td>6.0.4</td>
    </tr>
</table>

<table>
    <tr>
        <td>Banco de dados</td>
        <td>Versão</td>
    </tr>
    <tr>
        <td>Sqlite3</td>
        <td>1.4</td>
    </tr>
</table>

<br>

<p>É necessário também ter uma chave ssh válida para clonar o projeto, você pode obter mais informações <a href="https://docs.github.com/pt/github/authenticating-to-github/connecting-to-github-with-ssh">Aqui</a></p>
</br>
<br>
<hr>

## Para executar localmente o projeto siga os passos abaixo: 


#### Clone o repositório
```
$ git@github.com:vinicius-vph/desafio-back-end.git
```

#### Acesse a pasta do projeto
```
$ cd desafio-back-end
```

#### Instale as dependencias do ruby e do rails  
```
$ bundle install
```

#### Instale as dependencias do javascript 
```
$ yarn
```

#### Se necessário crie o banco de dados e execute as migrações das tabelas manualmente
```
$ rails db:migrate
```

#### Execute o projeto localmente
```
$ rails s
```
<br>

Acesse o endereço  <a href="http://localhost:3000">http://localhost:3000</a>

Você estará na tela inicial da aplicação, e com isso deverá ser possível realizar o upload do [arquivo CNAB](https://github.com/Pagnet/desafio-back-end/blob/master/CNAB.txt) e visualizar os dados na tela de resultados.
