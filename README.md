# Instruções de uso

## Instalação

### Requisitos

* NodeJS (Preferencialmente versão superior à 8)
* Ruby (2.6.3)
* PostgreSQL (Versão 12.x)

### Instruções

* Faça um clone deste projeto para sua máquina local
* Execute o comando `bundle install` para instalar as dependências
* Execute o comando `bundle exec rake db:setup` para configurar o banco de dados
* Execute o comando `yarn install` para instalar as dependências de CSS e Javascript

## Desenvolvendo

* Use o comando `rspec` para rodar os testes
* Use o comando `formeman start -f Procfile.dev` para rodar o servidor do rails e webpacker
* Use o comando `bin/rails c` para acessar diretamente a shell da aplicação em ruby
