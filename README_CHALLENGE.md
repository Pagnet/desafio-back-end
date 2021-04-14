# Desafio back-end de Naiguel Santos

## Dependência
- Docker

## Executando o micro serviço:

Entrar na pasta do projeto:

`cd microservice`

Executar comando para construir os projeto back-end:

`docker-compose build`

Executar o comando para inicializar:

`docker-compose up -d`

Executar o comando para criar o banco de dados:

`docker-compose exec api rake db:create`

Executar o comando para migrar o banco de dados:

`docker-compose exec api rake db:migrate`

Executar o comando para efetuar o pré cadastro dos tipos de transações:

`docker-compose exec api rake db:seed`

A api estará disponível no endereço http://localhost:3000

## Rodando os testes automatizados

Execute o comando:

`docker-compose exec api bundle exec rspec`

## Executando o front-end:

Abra um novo terminal e entre na pasta do projeto:

`cd client`

Executar comando para construir o projeto:

`docker-compose build`

Executar o comando para inicializar o projeto:

`docker-compose up -d`

Acesse o front-end no endereço http://localhost:8080