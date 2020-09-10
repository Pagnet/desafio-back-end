# Instalação

### Dependências
- Ruby 2.6.3
- Rails 6.0.3.2
- PostgreSQL 12.2

### Configuração do projeto
1. Instale o git caso não tenha

```bash
Linux: sudo apt-get install git
Mac: brew install git
```
2. Clone do projeto para sua máquina e acesse a pasta do projeto

```bash
git clone git@github.com:meirabruno/desafio-back-end.git
cd desafio-back-end
```

3. Instale o bundler

```bash
gem install bundler -v 2.1.4
```

4. Execute o bundler para instalar as dependências do projeto

```bash
bundle install
```

5. Crie o banco de dados, rode as migrations e o seed

```bash
rails db:create
rails db:migrate
rails db:seed
```

### Rodando e acessando o projeto

1. Iniciando o servidor

```bash
rails s
```

2. Acesse http://localhost:3000/
3. Utilize o usuário de exemplo

```bash
email: user@desafiobackend.com
senha: 123123
```

### Fazendo o upload do arquivo CNAB

- No menu lateral clique em Importadores e depois na tela de listagem de Importadores clique em Novo Importadore CNAB
- Na tela de importação clique em Escolher um Arquivo e depois de selecionar um arquivo clique em salvar
- Ao clicar em salvar a importação vai ser feita

### Visualizando transações e lojas importadas

- No menu lateral clique em Transações, aqui você vai ver todas as informações importadas de cada transação
- Clicando em Lojas você vai poder ver a lista de Lojas importadas, clicando em Visualizar em uma das loja da lista você vai poder ver as informações da loja e a lista de transações dessa loja