# Desafio back-end de Naiguel Santos

## Dependência
- Docker

## Executando o micro serviço:

Entrar na pasta do projeto:

`cd microservice`

Executar comando para construir os projetos front-end e back-end:

`docker-compose build`

Executar o comando para inicializar os projetos:

`docker-compose up -d`

Executar o comando para criar o banco de dados da api:

`docker-compose exec api rake db:create`

A api estará disponível no endereço http://localhost:3000

Acesse o formulário no endereço http://localhost:8080

## Rodando os testes

Execute os testes automatizados:

`docker-compose exec api bundle exec rspec`