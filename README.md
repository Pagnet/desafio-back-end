# README
DESAFIO BACKEND - Controle de Transações

Importante!
A instalação do Ruby, Rails e suas dependências foram baseadas no guia abaixo:

https://gorails.com/setup/ubuntu/18.04

Obs: rbenv foi o método utilizado na instalação do Ruby.

Versões: 

- Ruby > 2.7.1
- Rails > 6.0.3.2

Para iniciar o WebApp siga as seguintes instruções:

- Clone o repositório 

- Acesse o novo diretório

$ cd desafiosolides

- Instale os pacotes necessários

yarn install --check-files (este comando único foi o suficiente em meu teste)

yarn add bootstrap jquery popper.js

yarn add inputmask

$ bundle install --without production

- Configure o arquivo database.yml com a senha do seu Mysql

- Crie o Banco de Dados

$ rails db:create

$ rails db:migrate

- Insira os Tipos de Transação e vamos nessa!

$ rails db:seed

$ rails server

- Algumas imagens do WebApp

https://ibb.co/3YdrS09

https://ibb.co/0p74h9z

https://ibb.co/Bg34HWJ

https://ibb.co/K54jvLw