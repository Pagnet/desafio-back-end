# CNAB Desafio backend

O intuito dessa aplicação é parsear arquivos no formato [CNAB](https://pt.wikipedia.org/wiki/Concilia%C3%A7%C3%A3o_banc%C3%A1ria). O aplicativo tem uma interface simples com um formulário de envio de um arquivo, listagem dos arquivos enviados, com possibilidade de baixá-los, uma listagem dos lojistas e das negociações desses lojistas. Ao subir um arquivo, esse arquivo é consumido através de um sistema de filas que prepara o conteúdo e se tudo estiver certo, é adicionado ao banco de dados, caso haja algum erro, nada é feito e retorna uma mensagem de erro.

# Tecnologias

 - Ruby on Rails 6.0.3.3
 - Postgresql 12.4
 - Redis 6.0.8
 - Sidekiq 6.1.2
 - Docker

## Ruby Gems

- Sidekiq
- RSpec

## O que precisa para rodar esse app

- Docker

![Baixe o docker aqui](https://docs.docker.com/get-docker/)

## Como iniciar

1. Para iniciar o projeto clone este repositório em sua máquina.
2. entre no diretório baixado
3. após a instalação do Docker rode o seguinte comando em seu terminal:

> docker-compose up --build
4. Após o build do docker ter terminado, em seu navegador acesse esses endereços:
> http://localhost:3000

> http://localhost:3000/sidekiq

e comece a utilizar.

